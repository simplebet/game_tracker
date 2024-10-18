import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../providers/backboard_artboard_provider.dart';

class BackBoardStateMachine extends ConsumerWidget {
  const BackBoardStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(backboardArtboardProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Backboard Artboard Error')),
      data: (artboard) {
        return Rive(
          artboard: artboard,
        );
      },
    );
  }
}
