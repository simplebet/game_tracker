import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../notifiers/slide_in_arrow_state_notifier.dart';
import '../../providers/minimized_view/minimized_slide_in_arrow_artboard_provider.dart';

class MinimizedSlideInArrowStateMachine extends ConsumerWidget {
  const MinimizedSlideInArrowStateMachine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(minimizedSlideInArrowArtboardProvider);
    // ignore: unused_local_variable
    final slideInArrowState = ref.watch(slideInArrowStateProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          const Center(child: Text('Minimized Slide In Arrow Artboard Error')),
      data: (artboard) {
        return Rive(
          artboard: artboard,
        );
      },
    );
  }
}
