import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';

final ballMovementStateProvider = StateNotifierProvider.autoDispose<
    BallMovementStateNotifier, BallMovementState>((ref) {
  return BallMovementStateNotifier();
});

class BallMovementStateNotifier extends StateNotifier<BallMovementState> {
  BallMovementStateNotifier() : super(const BallMovementState());

  void initStateMachineInputs({
    required SMIBool tipOffInputControl,
    required SMIBool possesionChangeInputControl,
    required SMIBool turnoverInputControl,
    required SMIBool jumpBallInputControl,
  }) {
    state = state.copyWith(
        tipOffInputControl: tipOffInputControl,
        possesionChangeInputControl: possesionChangeInputControl,
        turnoverInputControl: turnoverInputControl,
        jumpBallInputControl: jumpBallInputControl);
  }

  void startTipOff(HomeOrAway side) {
    if (mounted) {
      state = state.copyWith(
          side: side,
          isBallMovementActive: true,
          ballMovementType: BasketballMatchIncidentEventType.tipOff);

      state.tipOffInputControl?.value = true;
    }
  }

  /// What side ends up with possession. E.g. going from home to away would be `startTurnover(HomeOrAway.away)`
  void startTurnover(HomeOrAway side) {
    if (mounted) {
      state = state.copyWith(
          side: side,
          isBallMovementActive: true,
          ballMovementType: BasketballMatchIncidentEventType.turnover);

      state.turnoverInputControl?.value = true;
    }
  }

  void startPossessionChange(HomeOrAway side) {
    if (mounted) {
      state = state.copyWith(
          side: side,
          isBallMovementActive: true,
          ballMovementType: BasketballMatchIncidentEventType.possessionChange);

      state.possesionChangeInputControl?.value = true;
    }
  }

  void startJumpBall(HomeOrAway side) {
    if (mounted) {
      state = state.copyWith(
          side: side,
          isBallMovementActive: true,
          ballMovementType: BasketballMatchIncidentEventType.jumpBall);

      state.jumpBallInputControl?.value = true;
    }
  }

  void endBallMovementAnimation() {
    if (mounted) {
      if (state.ballMovementType == BasketballMatchIncidentEventType.tipOff) {
        state.tipOffInputControl?.value = false;
      }
      if (state.ballMovementType == BasketballMatchIncidentEventType.turnover) {
        state.turnoverInputControl?.value = false;
      }
      if (state.ballMovementType ==
          BasketballMatchIncidentEventType.possessionChange) {
        state.possesionChangeInputControl?.value = false;
      }
      if (state.ballMovementType == BasketballMatchIncidentEventType.jumpBall) {
        state.jumpBallInputControl?.value = false;
      }
      state = state.copyWith(
        isBallMovementActive: false,
      );
    }
  }
}

class BallMovementState {
  const BallMovementState({
    this.isBallMovementActive = false,
    this.side = HomeOrAway.home,
    this.ballMovementType,
    this.tipOffInputControl,
    this.possesionChangeInputControl,
    this.turnoverInputControl,
    this.jumpBallInputControl,
  });

  // ball movement animation
  final bool isBallMovementActive;
  final HomeOrAway side;
  final BasketballMatchIncidentEventType? ballMovementType;
  final SMIBool? tipOffInputControl;
  final SMIBool? possesionChangeInputControl;
  final SMIBool? turnoverInputControl;
  final SMIBool? jumpBallInputControl;

  BallMovementState copyWith({
    bool? isBallMovementActive,
    HomeOrAway? side,
    BasketballMatchIncidentEventType? ballMovementType,
    SMIBool? tipOffInputControl,
    SMIBool? possesionChangeInputControl,
    SMIBool? turnoverInputControl,
    SMIBool? jumpBallInputControl,
  }) {
    return BallMovementState(
      isBallMovementActive: isBallMovementActive ?? this.isBallMovementActive,
      side: side ?? this.side,
      ballMovementType: ballMovementType ?? this.ballMovementType,
      tipOffInputControl: tipOffInputControl ?? this.tipOffInputControl,
      possesionChangeInputControl:
          possesionChangeInputControl ?? this.possesionChangeInputControl,
      turnoverInputControl: turnoverInputControl ?? this.turnoverInputControl,
      jumpBallInputControl: jumpBallInputControl ?? this.jumpBallInputControl,
    );
  }
}
