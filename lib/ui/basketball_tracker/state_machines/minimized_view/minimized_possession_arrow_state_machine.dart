import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../providers/minimized_view/minimized_possession_arrow_artboard_provider.dart';
import '../../util/constants.dart';

class MinimizedPossessionArrowStateMachine extends ConsumerWidget {
  const MinimizedPossessionArrowStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(minimizedPossessionArrowArtboardProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) => const Center(
          child: Text(
              '${BasketballTrackerRiveArtboards.possessionArrowMinimized} Artboard Error')),
      data: (artboard) {
        return Rive(
          artboard: artboard,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
