import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:sport_model/models/enums.dart';

import '../../notifiers/ball_movement_state_notifier.dart';
import '../../providers/minimized_view/minimized_ball_artboard_provider.dart';
import '../../widgets/transformations/mirror_transform.dart';

class MinimizedBallStateMachine extends ConsumerWidget {
  const MinimizedBallStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(minimizedBallArtboardProvider);
    final ballMovementState = ref.watch(ballMovementStateProvider);
    final isHomeSide = ballMovementState.side == HomeOrAway.home;

    return artboard.when(
        loading: () => const SizedBox.shrink(),
        error: (error, stack) =>
            Center(child: Text('Minimized Loading Ball Artboard Error $error')),
        data: (artboard) {
          return Container(
            margin: EdgeInsets.only(
                left: isHomeSide ? 0 : 46, right: isHomeSide ? 46 : 0),
            child: MirrorTransform(
              doFlip: isHomeSide,
              child: Rive(
                artboard: artboard,
              ),
            ),
          );
        });
  }
}
