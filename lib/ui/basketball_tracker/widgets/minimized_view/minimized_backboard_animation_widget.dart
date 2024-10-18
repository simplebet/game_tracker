import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifiers/backboard_state_notifier.dart';
import '../../state_machines/minimized_view/minimized_backboard_state_machine.dart';
import '../transformations/mirror_transform.dart';

class MinimizedBackboardLeftAnimationWidget extends ConsumerWidget {
  const MinimizedBackboardLeftAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backboardState = ref.watch(backboardStateProvider);

    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        opacity: backboardState.isLeftBackboardShown ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: const MirrorTransform(
            doFlip: true, child: MinimizedBackboardStateMachine()),
      ),
    );
  }
}

class MinimizedBackboardRightAnimationWidget extends ConsumerWidget {
  const MinimizedBackboardRightAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backboardState = ref.watch(backboardStateProvider);

    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedOpacity(
          opacity: backboardState.isRightBackboardShown ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: const MinimizedBackboardStateMachine()),
    );
  }
}
