import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';
import '../notifiers/field_goal_state_notifier.dart';
import '../providers/field_goal_artboard_provider.dart';
import '../widgets/transformations/mirror_transform.dart';

class FieldGoalStateMachine extends ConsumerWidget {
  const FieldGoalStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(fieldGoalArtboardProvider);
    final fieldGoalState = ref.watch(fieldGoalStateProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Field Goal Artboard Error')),
      data: (artboard) {
        return MirrorTransform(
          doFlip: fieldGoalState.courtSide == HomeOrAway.home,
          child: Rive(
            artboard: artboard,
          ),
        );
      },
    );
  }
}
