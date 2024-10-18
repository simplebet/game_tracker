import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';
import '../notifiers/ball_movement_state_notifier.dart';
import '../providers/ball_artboard_provider.dart';
import '../widgets/transformations/mirror_transform.dart';

class BallStateMachine extends ConsumerWidget {
  const BallStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(ballArtboardProvider);
    final ballMovementState = ref.watch(ballMovementStateProvider);

    return artboard.when(
        loading: () => const SizedBox.shrink(),
        error: (error, stack) =>
            const Center(child: Text('Loading Ball Artboard Error')),
        data: (artboard) {
          return MirrorTransform(
            doFlip: ballMovementState.side == HomeOrAway.home,
            child: Rive(
              artboard: artboard,
            ),
          );
        });
  }
}
