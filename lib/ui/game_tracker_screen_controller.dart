import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/basketball_match_incident_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_drive_list_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/match_incidents/match_incident_model.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/core/repositories/game_tracker_repository.dart';
import 'package:game_tracker/init_params.dart';

part 'game_tracker_screen_controller.freezed.dart';
part 'game_tracker_screen_controller.g.dart';

final gameTrackerScreenControllerProvider = NotifierProvider.autoDispose<
    GameTrackerScreenController, GameTrackerScreenState>(
  GameTrackerScreenController.new,
);

class GameTrackerScreenController
    extends AutoDisposeNotifier<GameTrackerScreenState> {
  StreamSubscription<MatchListDataModel>? _matchListSubscription;
  StreamSubscription<MatchModel>? _matchStateSubscription;
  StreamSubscription<FootballMatchIncidentModel>?
      _footballIncidentsSubscription;
  StreamSubscription<InitialFootballPayloadModel>?
      _pastFootballIncidentsSubscription;
  StreamSubscription<BasketballMatchIncidentModel>?
      _basketballIncidentsSubscription;
  StreamSubscription<InitialBasketballPayloadModel>?
      _pastBasketballIncidentsSubscription;
  StreamSubscription<bool>? _matchDisabledSubscription;
  StreamSubscription<bool>? _matchCoveredSubscription;

  @override
  GameTrackerScreenState build() {
    state = const GameTrackerScreenState();
    const localUuid = String.fromEnvironment('uuid');
    final uuid = getParameterValue('uuid') ?? localUuid;

    subscribeToMatch(uuid);

    return state;
  }

  void fetchMatchesByLeague(SportLeague league) {
    final repo = ref.watch(gameTrackerRepositoryProvider).requireValue;
    state = state.copyWith(league: league);
    repo.getMatches(league);

    _matchListSubscription = repo.matchesStreamController.listen((matches) {
      state = state.copyWith(
        allMatches: matches.matches
            ?.where((match) => match.status == MatchStatus.active)
            .toList(),
      );
    });
  }

  void subscribeToMatch(String uuid) {
    final repo = ref.watch(gameTrackerRepositoryProvider).requireValue
      ..getMatch(uuid)
      ..subscribeToMatch(uuid);

    _matchStateSubscription = repo.matchStateStreamController.listen((match) {
      state = state.copyWith(match: match);
      state = state.copyWith(league: match.league);
    });

    // todo: separate into football and basketball
    _pastFootballIncidentsSubscription =
        repo.pastFootballIncidentsStreamController.listen((list) {
      if (list.plays.isNotEmpty) {
        state = state.copyWith(footballIncidents: list.plays.reversed.toList());

        /// on initial load filter the list with currentDriveId
        filterFootballPlaysByCurrentDriveId(state.footballIncidents?.last);
      }
    });

    _footballIncidentsSubscription =
        repo.footballIncidentStreamController.listen(addIncident);

    _matchCoveredSubscription =
        repo.matchCoveredStreamController.listen((value) {
      state = state.copyWith(matchIsCovered: value);
    });

    _matchDisabledSubscription =
        repo.matchDisabledStreamController.listen((value) {
      state = state.copyWith(matchIsDisabled: value);
    });
  }

  void addIncident(FootballMatchIncidentModel incident) {
    if (state.match?.league != null) {
      if (state.match!.league!.isFootballLeagues) {
        final List<FootballMatchIncidentModel> incidents = [
          ...?state.footballIncidents,
          ...[incident],
        ];

        state = state.copyWith(footballIncidents: incidents);

        filterFootballPlaysByCurrentDriveId(incident);
      }
    }
  }

  void filterFootballPlaysByCurrentDriveId(
    FootballMatchIncidentModel? lastPlay,
  ) {
    final currentDriveId = lastPlay?.driveId;
    // print('lastFootballPlay $lastFootballPlay');
    // print('currentDriveId $currentDriveId');

    if (state.match != null && lastPlay != null) {
      /// only filter football plays when the game is active
      if (state.match?.status == MatchStatus.active &&
          lastPlay.event != FootballMatchIncidentEventType.matchEnded) {
        if (footballPlaysListGroupedByDriveId == null ||
            footballPlaysListGroupedByDriveId!.isEmpty) {
          state = state.copyWith(selectedFootballPlaysList: null);
        }

        /// set selectedFootballPlaysList with currentDriveId as the default list
        state = state.copyWith(
          selectedFootballPlaysList:
              footballPlaysListGroupedByDriveId?.firstWhere(
            (play) => play.driveId == currentDriveId,
          ),
        );
      }
    }
  }

  void filterFootballPlaysByDriveId(String driveId) {
    if (footballPlaysListGroupedByDriveId == null ||
        footballPlaysListGroupedByDriveId!.isEmpty) {
      state = state.copyWith(selectedFootballPlaysList: null);
    }

    /// set selectedFootballPlaysList with currentDriveId as the default list
    state = state.copyWith(
      selectedFootballPlaysList: footballPlaysListGroupedByDriveId?.firstWhere(
        (play) => play.driveId == driveId,
      ),
    );
  }

  List<FootballMatchIncidentDriveListModel>?
      get footballPlaysListGroupedByDriveId {
    final plays = state.footballIncidents;
    if (plays == null || plays.isEmpty) {
      return null;
    }

    final List<FootballMatchIncidentDriveListModel> groupedList = [];

    final List<FootballMatchIncidentModel> footballPlays =
        plays.map((play) => play).toList();

    footballPlays.removeWhere((play) {
      // Find plays with the same eventId and event type of driveStarted
      final duplicateDriveStartPlays = footballPlays.where(
        (p) =>
            p.eventId == play.eventId &&
            p.event == FootballMatchIncidentEventType.driveStarted,
      );

      // If there are duplicates and the current play is not corrected, remove it
      return duplicateDriveStartPlays.length > 1 && !play.isCorrectedPlay;
    });

    /// group the list of incidents with drive id
    footballPlays
        .groupListsBy((play) => play.driveId)

        /// add drive id and list of incidents
        .forEach((key, value) {
      groupedList
          .add(FootballMatchIncidentDriveListModel(driveId: key, plays: value));
    });

    return groupedList;
  }

  String get lastDriveIdFromPastDrives =>
      state.footballIncidents != null && state.footballIncidents!.isEmpty
          ? ''
          : state.footballIncidents!.last.driveId;

  // todo: past incidents
  List<FootballMatchIncidentModel>? get pastDriveIncidents {
    if (state.footballIncidents == null || state.footballIncidents!.isEmpty) {
      return null;
    }

    return state.footballIncidents!
        .where(
          (incident) =>
              !incident.isCorrectedPlay &&
              incident.driveId == lastDriveIdFromPastDrives,
        )
        .toList();
  }

  Match<FootballData> get footballMatch => state.match! as Match<FootballData>;

  void dispose() {
    _matchListSubscription?.cancel();
    _matchStateSubscription?.cancel();
    _footballIncidentsSubscription?.cancel();
    _pastFootballIncidentsSubscription?.cancel();
    _basketballIncidentsSubscription?.cancel();
    _pastBasketballIncidentsSubscription?.cancel();
    _matchDisabledSubscription?.cancel();
    _matchCoveredSubscription?.cancel();

    ref.watch(gameTrackerRepositoryProvider).requireValue.dispose();

    state = state.copyWith(
      match: null,
      league: null,
      basketballIncidents: null,
      footballIncidents: null,
      selectedFootballPlaysList: null,
    );
  }
}

@freezed
class GameTrackerScreenState with _$GameTrackerScreenState {
  const factory GameTrackerScreenState({
    List<MatchModel>? allMatches,
    SportLeague? league,
    MatchModel? match,
    List<FootballMatchIncidentModel>? pastFootballIncidents,
    List<BasketballMatchIncidentModel>? pastBasketballIncidents,
    List<FootballMatchIncidentModel>? footballIncidents,
    List<BasketballMatchIncidentModel>? basketballIncidents,
    FootballMatchIncidentDriveListModel? selectedFootballPlaysList,
    @Default(false) bool matchIsDisabled,
    @Default(true) bool matchIsCovered,
  }) = _GameTrackerScreenState;

  factory GameTrackerScreenState.fromJson(Map<String, dynamic> json) =>
      _$GameTrackerScreenStateFromJson(json);
}
