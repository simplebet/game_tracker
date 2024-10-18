import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../full_view/providers/transition_overlays_minimized_rive_provider.dart';
import '../state_notifier/transition_overlays_minimized_notifier.dart';

class TransitionOverlaysMinimizedWidget extends ConsumerWidget {
  const TransitionOverlaysMinimizedWidget({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artboard = ref.watch(transitionOverlaysMinimizedRiveProvider);
    final transitionOverlayState =
        ref.watch(transitionOverlaysMinimizedStateProvider);

    return SizedBox(
      width: screenWidth,
      height: transitionOverlayState.isOverlayActive ? 61 : 0,
      child: artboard.when(
        loading: () => const SizedBox.shrink(),
        error: (error, stack) => const Center(
            child: Text('TransitionOverlaysMinimized Artboard Error')),
        data: (artboard) {
          return Rive(
            artboard: artboard,
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }
}
