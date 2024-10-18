import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../providers/possession_arrow_artboard_provider.dart';

class PossessionArrowStateMachine extends ConsumerWidget {
  const PossessionArrowStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(possessionArrowArtboardProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Possession Arrow Artboard Error')),
      data: (artboard) {
        return Rive(
          artboard: artboard,
          alignment: Alignment.centerLeft,
        );
      },
    );
  }
}
