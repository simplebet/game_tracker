import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/controller_helper.dart';
import 'package:rive/rive.dart';

final transitionOverlaysMinimizedStateProvider =
    StateNotifierProvider.autoDispose<TransitionOverlaysMinimizedNotifier,
        TransitionOverlaysMinimizedState>((ref) {
  return TransitionOverlaysMinimizedNotifier();
});

class TransitionOverlaysMinimizedNotifier
    extends StateNotifier<TransitionOverlaysMinimizedState> {
  TransitionOverlaysMinimizedNotifier()
      : super(const TransitionOverlaysMinimizedState());

  void initStateMachineInputs({
    required StateMachineController stateMachineController,
  }) {
    state = state.copyWith(stateMachineController: stateMachineController);
  }

  void showOverlay() {
    if (mounted) {
      state = state.copyWith(
        isOverlayActive: true,
      );
    }
  }

  void hideOverlay() {
    if (mounted) {
      state = state.copyWith(
        isOverlayActive: false,
      );
    }
  }

  Future<void> triggerOvertime() async {
    if (mounted) {
      final trigger = state.stateMachineController!.findInput<bool>('Overtime')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTimeout() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('Timeout')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerHalftime() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('Halftime')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerPass() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('RushPass')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerCallOverturned() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('CallOverturned') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerPlayStands() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('PlayStands') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerUnderReview() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('UnderReview') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerCoinFlip() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('CoinFlip')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerQuarterEnd() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('QuarterEnd') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTurnoverOnDowns() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('TurnoverOnDowns') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTwoPointConversionFailed() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('TwoPointConversionFailed') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTwoPointConversion() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('TwoPointConversion') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerFumble() async {
    if (mounted) {
      final trigger =
          state.stateMachineController?.findInput<bool>('Fumble') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerSafety() async {
    if (mounted) {
      final trigger =
          state.stateMachineController?.findInput<bool>('Safety') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerSack() async {
    if (mounted) {
      final trigger =
          state.stateMachineController?.findInput<bool>('Sack') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerFairCatch() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('FairCatch')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerFlag() async {
    if (mounted) {
      final trigger =
          state.stateMachineController?.findInput<bool>('Flag') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTouchdown() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('Touchdown')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerExtraPointMissed() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('ExtraPointMissed') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerExtraPointMade() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('ExtraPointMade') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerRush() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('RushPass')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerInterception() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('Interception') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerTouchback() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('Touchback')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerFieldGoalMade() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('FieldGoalMade') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerFieldGoalMissed() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('FieldGoalMissed') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerPassIncomplete() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('PassIncomplete') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerOnsideKick() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('OnsideKick') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerOnsideKickFail() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('OnsideKickFail') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerDefensiveTwoPoint() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('DefensiveTwoPoint') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerPuntBlocked() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('PuntBlocked') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerPunt() async {
    if (mounted) {
      final trigger =
          state.stateMachineController?.findInput<bool>('Punt') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerKickoff() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('Kickoff')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerDriveStart() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('DriveStart') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerDriveEnd() async {
    if (mounted) {
      final trigger = state.stateMachineController?.findInput<bool>('DriveEnd')
          as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }

  Future<void> triggerDoubleTurnover() async {
    if (mounted) {
      final trigger = state.stateMachineController
          ?.findInput<bool>('DoubleTurnover') as SMITrigger;
      trigger.fire();
      if (state.stateMachineController != null) {
        await waitForInactive(state.stateMachineController!);
      }
    }
  }
}

class TransitionOverlaysMinimizedState {
  const TransitionOverlaysMinimizedState({
    this.isOverlayActive = false,
    this.stateMachineController,
  });

  final StateMachineController? stateMachineController;
  final bool isOverlayActive;

  TransitionOverlaysMinimizedState copyWith({
    StateMachineController? stateMachineController,
    bool? isOverlayActive,
  }) {
    return TransitionOverlaysMinimizedState(
      stateMachineController:
          stateMachineController ?? this.stateMachineController,
      isOverlayActive: isOverlayActive ?? this.isOverlayActive,
    );
  }
}
