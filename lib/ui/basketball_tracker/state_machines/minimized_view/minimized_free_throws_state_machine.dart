import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:sport_model/models/enums.dart';

import '../../notifiers/free_throw_state_notifier.dart';
import '../../providers/minimized_view/minimized_free_throw_artboard_provider.dart';
import '../../widgets/transformations/mirror_transform.dart';

class MinimizedFreeThrowsStateMachine extends ConsumerWidget {
  const MinimizedFreeThrowsStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(minimizeFreeThrowsArtboardProvider);
    final freeThrowsState = ref.watch(freeThrowStateProvider);
    final shouldFlip = freeThrowsState.courtSide == HomeOrAway.home;

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          Center(child: Text('Minimized Free Throw Artboard Error $error')),
      data: (artboard) {
        return MirrorTransform(
          doFlip: shouldFlip,
          child: Rive(
            artboard: artboard,
          ),
        );
      },
    );
  }
}
