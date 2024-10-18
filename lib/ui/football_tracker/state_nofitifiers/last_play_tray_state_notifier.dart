import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';

final lastPlayTrayStateProvider = StateNotifierProvider.autoDispose<
    LastPlayTrayStateNotifier, LastPlayTrayState>((_) {
  return LastPlayTrayStateNotifier();
});

class LastPlayTrayStateNotifier extends StateNotifier<LastPlayTrayState> {
  LastPlayTrayStateNotifier() : super(const LastPlayTrayState());

  void updateLastPlayTray(FootballMatchIncidentModel incident) {
    if (mounted) {
      state = state.copyWith(
        lastPlay: incident,
      );
    }
  }
}

class LastPlayTrayState {
  const LastPlayTrayState({
    this.lastPlay,
  });

  final FootballMatchIncidentModel? lastPlay;

  LastPlayTrayState copyWith({
    FootballMatchIncidentModel? lastPlay,
  }) {
    return LastPlayTrayState(
      lastPlay: lastPlay ?? this.lastPlay,
    );
  }
}
