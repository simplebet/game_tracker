import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';

import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/football_tracker_flame_game.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/football_tracker_flame_game_minimized.dart';

final incidentSequenceControllerProvider =
    Provider.autoDispose<IncidentSequenceController>(
  (_) => IncidentSequenceController(),
);

class IncidentSequenceController<T> {
  final StreamController<FootballMatchIncidentModel> _streamController =
      StreamController.broadcast();
  StreamQueue<FootballMatchIncidentModel> _streamQueue =
      StreamQueue(const Stream.empty());

  late T _game;

  bool streamQueueIsRunning = false;

  void init(T game) {
    _streamQueue = StreamQueue(_streamController.stream);
    _game = game;
  }

  void add(FootballMatchIncidentModel incident) {
    _streamController.sink.add(incident);

    if (!streamQueueIsRunning) {
      runNext();
    }
  }

  bool _hasNextIncident = false;

  Future<void> runNext() async {
    try {
      _hasNextIncident = await _streamQueue.hasNext;

      if (_hasNextIncident) {
        streamQueueIsRunning = true;

        final incident = await _streamQueue.next;

        if (_game is FootballTrackerFlameGame) {
          await (_game as FootballTrackerFlameGame)
              .animationSequence
              .renderUpcomingIncidents(incident);
        } else if (_game is FootballTrackerFlameGameMinimized) {
          await (_game as FootballTrackerFlameGameMinimized)
              .animationSequence
              .renderUpcomingIncidents(incident);
        }

        await runNext();
      } else {
        streamQueueIsRunning = false;
      }
    } catch (e) {
      throw Exception('IncidentSequenceControllerMinimized: $e');
    }
  }

  void dispose() {
    _streamQueue.cancel(immediate: true);
    _streamController.close();
  }
}
