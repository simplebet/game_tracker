import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../providers/minimized_view/minimized_backboard_artboard_provider.dart';

class MinimizedBackboardStateMachine extends ConsumerWidget {
  const MinimizedBackboardStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(minimizedBackboardArtboardProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Minimized Backboard Artboard Error')),
      data: (artboard) {
        return Container(
          padding: const EdgeInsets.only(top: 3, left: 61, bottom: 5),
          child: Rive(
            artboard: artboard,
          ),
        );
      },
    );
  }
}
