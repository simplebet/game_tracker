import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/field_goal_state_notifier.dart';
import '../state_machines/field_goal_state_machine.dart';

class FieldGoalAttemptsAnimationWidget extends ConsumerWidget {
  const FieldGoalAttemptsAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldGoalState = ref.watch(fieldGoalStateProvider);

    return AnimatedOpacity(
      opacity: fieldGoalState.fieldGoalAnimationIsActive ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: const FieldGoalStateMachine(),
    );
  }
}
