import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/backboard_state_notifier.dart';
import '../state_machines/backboard_state_machine.dart';
import 'transformations/mirror_transform.dart';

class BackboardLeftAnimationWidget extends ConsumerWidget {
  const BackboardLeftAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __) {
      final backboardState = ref.watch(backboardStateProvider);

      return AnimatedOpacity(
          opacity: backboardState.isLeftBackboardShown ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: const MirrorTransform(
            doFlip: true,
            child: BackBoardStateMachine(),
          ));
    });
  }
}

class BackboardRightAnimationWidget extends ConsumerWidget {
  const BackboardRightAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (_, ref, __) {
      final backboardState = ref.watch(backboardStateProvider);

      return AnimatedOpacity(
        opacity: backboardState.isRightBackboardShown ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: const BackBoardStateMachine(),
      );
    });
  }
}
