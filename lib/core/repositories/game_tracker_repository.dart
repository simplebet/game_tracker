import 'dart:async';
import 'dart:developer';

import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/basketball_match_incident_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/match_incidents/match_incident_model.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/core/services/socket_service.dart';
import 'package:game_tracker/init_params.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'game_tracker_repository.g.dart';

const _localUserId = String.fromEnvironment('user_id');
final userId = getParameterValue('user_id') ?? _localUserId;

@Riverpod(keepAlive: false)
Future<GameTrackerRepository> gameTrackerRepository(
  GameTrackerRepositoryRef ref,
) async {
  final socketService = ref.read(socketServiceProvider).requireValue;

  final repo = GameTrackerRepository(socketService);

  await repo.join();

  ref.onDispose(repo.dispose);
  return repo;
}

class GameTrackerRepository {
  GameTrackerRepository(
    this._socketService,
  );

  final SocketService _socketService;

  late final PhoenixChannel _channel;

  Future<void> join() async {
    _channel = _socketService.addChannel(
      topic: 'play_by_play',
      parameters: {
        'event': 'phx_join',
      },
    );
    subscribe();
    await _channel.join().future;
  }

  void subscribe() {
    _setupMessageListener();
  }

  void getMatches(SportLeague league) {
    _channel.push(
      'get_matches',
      {'league': league.name},
    );
  }

  void getMatch(String uuid) {
    _channel.push(
      'get_match',
      {'id': uuid},
    );
  }

  void subscribeToMatch(String uuid) {
    _channel.push(
      'subscribe',
      {'match_id': uuid},
    );
  }

  late final StreamSubscription _subscription;
  final matchesStreamController = BehaviorSubject<MatchListDataModel>();
  final matchStateStreamController = BehaviorSubject<MatchModel>();
  final footballIncidentStreamController =
      BehaviorSubject<FootballMatchIncidentModel>();
  final basketballIncidentStreamController =
      BehaviorSubject<BasketballMatchIncidentModel>();
  final pastFootballIncidentsStreamController =
      BehaviorSubject<InitialFootballPayloadModel>();
  final pastBasketballIncidentsStreamController =
      BehaviorSubject<InitialBasketballPayloadModel>();
  final matchDisabledStreamController = BehaviorSubject<bool>();
  final matchCoveredStreamController = BehaviorSubject<bool>();

  void _setupMessageListener() {
    _subscription = _channel.messages.listen(
      (message) {
        if (message.event == PhoenixChannelEvent.error) {
          log('Error: ${message.payload}');
          return;
        }

        final payload = message.payload ?? {};

        if (message.event.value.contains('chan_reply')) {
          if (payload['status'] == 'ok') {
            final response = payload['response'] as Map<String, dynamic>? ?? {};

            /// fetch match list
            if (response['status'] == 'success') {
              final data = response['data'];
              final matches = MatchListDataModel.fromJson(
                  data as Map<String, dynamic>? ?? {});
              matchesStreamController.add(matches);
            }

            if (response.isNotEmpty) {
              /// fetch initial match state
              if (response.containsKey('match')) {
                final match = MatchModel.fromJson(
                    response['match'] as Map<String, dynamic>? ?? {});
                matchStateStreamController.add(match);
              }

              /// fetch historic plays
              if (response.containsKey('plays')) {
                if (response['stats'] != null) {
                  final league =
                      (response['stats'] as Map<String, dynamic>)['league'];
                  if (league == 'cfb' || league == 'nfl') {
                    final incidents = InitialFootballPayloadModel.fromJson(
                        response as Map<String, dynamic>? ?? {});
                    pastFootballIncidentsStreamController.add(incidents);
                  }
                  if (league == 'nba' || league == 'cbb') {
                    final incidents = InitialBasketballPayloadModel.fromJson(
                        response as Map<String, dynamic>? ?? {});
                    pastBasketballIncidentsStreamController.add(incidents);
                  }
                }
              }
            }
          }
          return;
        }

        switch (message.event) {
          /// match state updates
          case const PhoenixChannelEvent.custom('match_update'):
            // print('paylaod: ${payload['match']}');
            final match = MatchModel.fromJson(
              payload['match'] as Map<String, dynamic>? ?? {},
            );
            matchStateStreamController.add(match);

          /// new play incident updates
          case const PhoenixChannelEvent.custom('new_play'):
            if (payload['league'] == 'cfb' || payload['league'] == 'nfl') {
              final incident = FootballMatchIncidentModel.fromJson(
                payload as Map<String, dynamic>? ?? {},
              );
              footballIncidentStreamController.add(incident);
            }
            if (payload['league'] == 'nba' || payload['league'] == 'cbb') {
              final incident = BasketballMatchIncidentModel.fromJson(
                payload as Map<String, dynamic>? ?? {},
              );
              basketballIncidentStreamController.add(incident);
            }

          /// match disabled updates
          case const PhoenixChannelEvent.custom('match_alert'):
            matchDisabledStreamController.add(payload['status'] == 'disabled');

          /// match covered updates
          case const PhoenixChannelEvent.custom('coverage_update'):
            matchCoveredStreamController.add(payload['is_covered?']);
          default:
        }
      },
      // TODO: Log error
      onError: (err) => log(err),
    );
  }

  void dispose() {
    matchesStreamController.close();
    matchStateStreamController.close();
    footballIncidentStreamController.close();
    basketballIncidentStreamController.close();
    pastFootballIncidentsStreamController.close();
    pastBasketballIncidentsStreamController.close();
    matchDisabledStreamController.close();
    matchCoveredStreamController.close();
    _subscription.cancel();
    _channel.leave().future.then((_) {
      _channel.close();
    });
  }
}
