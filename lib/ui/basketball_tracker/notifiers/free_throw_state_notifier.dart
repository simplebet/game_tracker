import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';
import '../util/enums.dart';

final freeThrowStateProvider =
    StateNotifierProvider.autoDispose<FreeThrowStateNotifier, FreeThrowState>(
        (ref) => FreeThrowStateNotifier());

Map<BasketballMatchIncidentEventType, MadeOrMissed> _freeThrowAttemptMap = {
  BasketballMatchIncidentEventType.freeThrowMade: MadeOrMissed.made,
  BasketballMatchIncidentEventType.freeThrowMissed: MadeOrMissed.missed,
};

class FreeThrowStateNotifier extends StateNotifier<FreeThrowState> {
  FreeThrowStateNotifier() : super(const FreeThrowState());

  void initStateMachineInputs({
    required SMIBool freeThrowMadeInputControl,
    required SMIBool freeThrowMissedInputControl,
  }) {
    state = state.copyWith(
      freeThrowMadeInputControl: freeThrowMadeInputControl,
      freeThrowMissedInputControl: freeThrowMissedInputControl,
    );
  }

  void setFreeThrowAttemptResult(BasketballMatchIncidentModel incident) {
    if (!mounted) {
      return;
    }

    switch (incident.meta?.attempt) {
      case 1:
        _setFirstAttempt(incident.event);
        break;
      case 2:
        _setSecondAttempt(incident.event);
        break;
      case 3:
        _setThirdAttempt(incident.event);
        break;
    }
  }

  void setFreeThrowIncident(BasketballMatchIncidentModel incident) {
    if (!mounted) {
      return;
    }

    state = state.copyWith(incident: incident);
  }

  void setPlayerAtLine(BasketballMatchIncidentModel incident) {
    if (!mounted) {
      return;
    }

    state = state.copyWith(incident: incident);
    _showFreeThrowInfoPanel();
  }

  void setFreeThrowEnded(BasketballMatchIncidentModel incident) {
    if (!mounted) {
      return;
    }

    state = state.copyWith(
      incident: incident,
      showFreeThrowsAnimation: false,
    );

    hideFreeThrowInfoPanel();
    _clearFreeThrowAttemptsLog();
  }

  void _setFirstAttempt(BasketballMatchIncidentEventType? eventType) {
    if (mounted) {
      state = state.copyWith(firstAttempt: _freeThrowAttemptMap[eventType]);
    }
  }

  void _setSecondAttempt(BasketballMatchIncidentEventType? eventType) {
    if (mounted) {
      state = state.copyWith(secondAttempt: _freeThrowAttemptMap[eventType]);
    }
  }

  void _setThirdAttempt(BasketballMatchIncidentEventType? eventType) {
    if (mounted) {
      state = state.copyWith(thirdAttempt: _freeThrowAttemptMap[eventType]);
    }
  }

  void _clearFreeThrowAttemptsLog() {
    if (mounted) {
      state = state.copyWith(
          firstAttempt: MadeOrMissed.none,
          secondAttempt: MadeOrMissed.none,
          thirdAttempt: MadeOrMissed.none);
    }
  }

  void startFreeThrowsAnimation(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
        courtSide: courtSide,
        showFreeThrowsAnimation: true,
      );
    }
  }

  void showFreeThrowMade(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
        courtSide: courtSide,
        showFreeThrowsAnimation: true,
      );

      state.freeThrowMadeInputControl?.value = true;
    }
  }

  void showFreeThrowMissed(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
        courtSide: courtSide,
        showFreeThrowsAnimation: true,
      );

      state.freeThrowMissedInputControl?.value = true;
    }
  }

  void resetFreeThrowInputs() {
    if (mounted) {
      state.freeThrowMadeInputControl?.value = false;
      state.freeThrowMissedInputControl?.value = false;
    }
  }

  void hideFreeThrowsAnimation() {
    if (mounted) {
      state = state.copyWith(showFreeThrowsAnimation: false);

      state.freeThrowMadeInputControl?.value = false;
      state.freeThrowMissedInputControl?.value = false;
    }
  }

  void _showFreeThrowInfoPanel() {
    if (mounted) {
      state = state.copyWith(freeThrowInfoPanelIsActive: true);
    }
  }

  void hideFreeThrowInfoPanel() {
    if (mounted) {
      state = state.copyWith(freeThrowInfoPanelIsActive: false);
    }
  }

  bool get isActive =>
      state.freeThrowInfoPanelIsActive || state.showFreeThrowsAnimation;
}

class FreeThrowState {
  const FreeThrowState({
    this.incident,
    this.firstAttempt,
    this.secondAttempt,
    this.thirdAttempt,
    this.showFreeThrowsAnimation = false,
    this.courtSide = HomeOrAway.away,
    this.freeThrowInfoPanelIsActive = false,
    this.freeThrowMadeInputControl,
    this.freeThrowMissedInputControl,
  });

  final BasketballMatchIncidentModel? incident;
  final MadeOrMissed? firstAttempt;
  final MadeOrMissed? secondAttempt;
  final MadeOrMissed? thirdAttempt;

  final bool showFreeThrowsAnimation;
  final HomeOrAway courtSide;
  final bool freeThrowInfoPanelIsActive;

  final SMIBool? freeThrowMadeInputControl;
  final SMIBool? freeThrowMissedInputControl;

  FreeThrowState copyWith({
    BasketballMatchIncidentModel? incident,
    MadeOrMissed? firstAttempt,
    MadeOrMissed? secondAttempt,
    MadeOrMissed? thirdAttempt,
    bool? showFreeThrowsAnimation,
    HomeOrAway? courtSide,
    bool? freeThrowInfoPanelIsActive,
    SMIBool? freeThrowMadeInputControl,
    SMIBool? freeThrowMissedInputControl,
  }) {
    return FreeThrowState(
      incident: incident ?? this.incident,
      firstAttempt: firstAttempt ?? this.firstAttempt,
      secondAttempt: secondAttempt ?? this.secondAttempt,
      thirdAttempt: thirdAttempt ?? this.thirdAttempt,
      showFreeThrowsAnimation:
          showFreeThrowsAnimation ?? this.showFreeThrowsAnimation,
      courtSide: courtSide ?? this.courtSide,
      freeThrowInfoPanelIsActive:
          freeThrowInfoPanelIsActive ?? this.freeThrowInfoPanelIsActive,
      freeThrowMadeInputControl:
          freeThrowMadeInputControl ?? this.freeThrowMadeInputControl,
      freeThrowMissedInputControl:
          freeThrowMissedInputControl ?? this.freeThrowMissedInputControl,
    );
  }
}
