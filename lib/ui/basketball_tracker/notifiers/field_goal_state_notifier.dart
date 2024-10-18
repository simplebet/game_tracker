import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';

final fieldGoalStateProvider =
    StateNotifierProvider.autoDispose<FieldGoalStateNotifier, FieldGoalState>(
        (ref) => FieldGoalStateNotifier());

class FieldGoalStateNotifier extends StateNotifier<FieldGoalState> {
  FieldGoalStateNotifier() : super(const FieldGoalState());

  void initStateMachineInputs({
    required SMIBool twoPointerMadeInputControl,
    required SMIBool threePointerMadeInputControl,
    required SMIBool twoPointerMissedInputControl,
    required SMIBool threePointerMissedInputControl,
  }) {
    state = state.copyWith(
        twoPointerMadeInputControl: twoPointerMadeInputControl,
        threePointerMadeInputControl: threePointerMadeInputControl,
        twoPointerMissedInputControl: twoPointerMissedInputControl,
        threePointerMissedInputControl: threePointerMissedInputControl);
  }

  void startFieldGoalAnimation(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
        courtSide: courtSide,
        fieldGoalAnimationIsActive: true,
      );
    }
  }

  void show2PointMade(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
          courtSide: courtSide,
          showFieldGoalAnimation: true,
          fieldGoalAttemptType:
              BasketballMatchIncidentEventType.fieldGoalMadeTwo);

      state.twoPointerMadeInputControl?.value = true;
    }
  }

  void show3PointMade(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
          courtSide: courtSide,
          showFieldGoalAnimation: true,
          fieldGoalAttemptType:
              BasketballMatchIncidentEventType.fieldGoalMadeThree);

      state.threePointerMadeInputControl?.value = true;
    }
  }

  void show2PointDefensiveRebound(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
          courtSide: courtSide,
          showFieldGoalAnimation: true,
          fieldGoalAttemptType:
              BasketballMatchIncidentEventType.fieldGoalMissedTwo);

      state.twoPointerMissedInputControl?.value = true;
    }
  }

  void show3PointDefensiveRebound(HomeOrAway courtSide) {
    if (mounted) {
      state = state.copyWith(
          courtSide: courtSide,
          showFieldGoalAnimation: true,
          fieldGoalAttemptType:
              BasketballMatchIncidentEventType.fieldGoalMissedThree);

      state.threePointerMissedInputControl?.value = true;
    }
  }

  void endFieldGoalAnimation() {
    if (mounted) {
      state = state.copyWith(
        fieldGoalAnimationIsActive: false,
      );
    }
  }

  void hideFieldGoalAttemptAnimation() {
    if (mounted) {
      state = state.copyWith(showFieldGoalAnimation: false);

      if (state.fieldGoalAttemptType ==
          BasketballMatchIncidentEventType.fieldGoalMadeTwo) {
        state.twoPointerMadeInputControl?.value = false;
      }

      if (state.fieldGoalAttemptType ==
          BasketballMatchIncidentEventType.fieldGoalMadeThree) {
        state.threePointerMadeInputControl?.value = false;
      }

      if (state.fieldGoalAttemptType ==
          BasketballMatchIncidentEventType.fieldGoalMissedTwo) {
        state.twoPointerMissedInputControl?.value = false;
      }

      if (state.fieldGoalAttemptType ==
          BasketballMatchIncidentEventType.fieldGoalMissedThree) {
        state.threePointerMissedInputControl?.value = false;
      }
    }
  }
}

class FieldGoalState {
  const FieldGoalState({
    this.showFieldGoalAnimation = false,
    this.fieldGoalAnimationIsActive = false,
    this.fieldGoalAttemptType =
        BasketballMatchIncidentEventType.fieldGoalMadeTwo,
    this.courtSide = HomeOrAway.away,
    this.twoPointerMadeInputControl,
    this.twoPointerMissedInputControl,
    this.threePointerMadeInputControl,
    this.threePointerMissedInputControl,
  });

  // Field goal attempts animation
  final BasketballMatchIncidentEventType fieldGoalAttemptType;
  final bool fieldGoalAnimationIsActive;
  final bool showFieldGoalAnimation;
  final HomeOrAway courtSide;
  final SMIBool? twoPointerMadeInputControl;
  final SMIBool? twoPointerMissedInputControl;
  final SMIBool? threePointerMadeInputControl;
  final SMIBool? threePointerMissedInputControl;

  // genereate copy with
  FieldGoalState copyWith({
    bool? showFieldGoalAnimation,
    bool? fieldGoalAnimationIsActive,
    BasketballMatchIncidentEventType? fieldGoalAttemptType,
    HomeOrAway? courtSide,
    SMIBool? twoPointerMadeInputControl,
    SMIBool? threePointerMadeInputControl,
    SMIBool? twoPointerMissedInputControl,
    SMIBool? threePointerMissedInputControl,
  }) {
    return FieldGoalState(
      showFieldGoalAnimation:
          showFieldGoalAnimation ?? this.showFieldGoalAnimation,
      fieldGoalAttemptType: fieldGoalAttemptType ?? this.fieldGoalAttemptType,
      fieldGoalAnimationIsActive:
          fieldGoalAnimationIsActive ?? this.fieldGoalAnimationIsActive,
      courtSide: courtSide ?? this.courtSide,
      twoPointerMadeInputControl:
          twoPointerMadeInputControl ?? this.twoPointerMadeInputControl,
      threePointerMadeInputControl:
          threePointerMadeInputControl ?? this.threePointerMadeInputControl,
      twoPointerMissedInputControl:
          twoPointerMissedInputControl ?? this.twoPointerMissedInputControl,
      threePointerMissedInputControl:
          threePointerMissedInputControl ?? this.threePointerMissedInputControl,
    );
  }
}
