import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/free_throw_state_notifier.dart';
import '../state_machines/free_throws_state_machine.dart';

class FreeThrowsAnimationWidget extends ConsumerWidget {
  const FreeThrowsAnimationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freeThrowsState = ref.watch(freeThrowStateProvider);

    return AnimatedOpacity(
      opacity: freeThrowsState.showFreeThrowsAnimation ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: const FreeThrowsStateMachine(),
    );
  }
}