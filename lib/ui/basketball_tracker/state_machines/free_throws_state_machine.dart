import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';
import '../notifiers/free_throw_state_notifier.dart';
import '../providers/free_throw_artboard_provider.dart';
import '../widgets/transformations/mirror_transform.dart';

class FreeThrowsStateMachine extends ConsumerWidget {
  const FreeThrowsStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(freeThrowsArtboardProvider);
    final freeThrowsState = ref.watch(freeThrowStateProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Free Throw Artboard Error')),
      data: (artboard) {
        return MirrorTransform(
          doFlip: freeThrowsState.courtSide == HomeOrAway.home,
          child: Rive(
            artboard: artboard,
          ),
        );
      },
    );
  }
}
