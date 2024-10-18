import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';

final slideInArrowStateProvider = StateNotifierProvider.autoDispose<
    SlideInArrowStateNotifier,
    SlideInArrowState>((ref) => SlideInArrowStateNotifier());

class SlideInArrowStateNotifier extends StateNotifier<SlideInArrowState> {
  SlideInArrowStateNotifier() : super(const SlideInArrowState());

  void initStateMachineInputs({
    required SMIBool jumpBallRightInputControl,
    required SMIBool jumpBallLeftInputControl,
    required SMIBool turnoverRightInputControl,
    required SMIBool turnoverLeftInputControl,
  }) {
    state = state.copyWith(
        jumpBallRightInputControl: jumpBallRightInputControl,
        jumpBallLeftInputControl: jumpBallLeftInputControl,
        turnoverRightInputControl: turnoverRightInputControl,
        turnoverLeftInputControl: turnoverLeftInputControl);
  }

  void showJumpBall(HomeOrAway side) {
    if (mounted) {
      if (side == HomeOrAway.away) {
        state = state.copyWith(slideInArrowType: SlideInArrowType.jumpBallLeft);

        state.jumpBallLeftInputControl?.value = true;
      } else {
        state =
            state.copyWith(slideInArrowType: SlideInArrowType.jumpBallRight);

        state.jumpBallRightInputControl?.value = true;
      }
    }
  }

  void showTurnover(HomeOrAway side) {
    if (mounted) {
      if (side == HomeOrAway.away) {
        state = state.copyWith(slideInArrowType: SlideInArrowType.turnoverLeft);

        state.turnoverLeftInputControl?.value = true;
      } else {
        state =
            state.copyWith(slideInArrowType: SlideInArrowType.turnoverRight);

        state.turnoverRightInputControl?.value = true;
      }
    }
  }

  void hideSlideInArrow() {
    if (mounted) {
      if (state.slideInArrowType == SlideInArrowType.jumpBallLeft) {
        state.jumpBallLeftInputControl?.value = false;
      }

      if (state.slideInArrowType == SlideInArrowType.jumpBallRight) {
        state.jumpBallRightInputControl?.value = false;
      }

      if (state.slideInArrowType == SlideInArrowType.turnoverLeft) {
        state.turnoverLeftInputControl?.value = false;
      }

      if (state.slideInArrowType == SlideInArrowType.turnoverRight) {
        state.turnoverRightInputControl?.value = false;
      }
    }
  }
}

class SlideInArrowState {
  const SlideInArrowState(
      {this.slideInArrowType = SlideInArrowType.jumpBallRight,
      this.jumpBallRightInputControl,
      this.jumpBallLeftInputControl,
      this.turnoverRightInputControl,
      this.turnoverLeftInputControl});

  // slide in arrow animation
  final SlideInArrowType slideInArrowType;
  final SMIBool? jumpBallRightInputControl;
  final SMIBool? jumpBallLeftInputControl;
  final SMIBool? turnoverRightInputControl;
  final SMIBool? turnoverLeftInputControl;

  SlideInArrowState copyWith({
    SlideInArrowType? slideInArrowType,
    SMIBool? jumpBallRightInputControl,
    SMIBool? jumpBallLeftInputControl,
    SMIBool? turnoverRightInputControl,
    SMIBool? turnoverLeftInputControl,
  }) {
    return SlideInArrowState(
      slideInArrowType: slideInArrowType ?? this.slideInArrowType,
      jumpBallRightInputControl:
          jumpBallRightInputControl ?? this.jumpBallRightInputControl,
      jumpBallLeftInputControl:
          jumpBallLeftInputControl ?? this.jumpBallLeftInputControl,
      turnoverRightInputControl:
          turnoverRightInputControl ?? this.turnoverRightInputControl,
      turnoverLeftInputControl:
          turnoverLeftInputControl ?? this.turnoverLeftInputControl,
    );
  }
}
