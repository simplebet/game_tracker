import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../notifiers/court_state_notifier.dart';
import '../../providers/minimized_view/minimized_court_artboard_provider.dart';

class MinimizedCourtStateMachine extends ConsumerStatefulWidget {
  const MinimizedCourtStateMachine({
    Key? key,
    required this.maxWidth,
  }) : super(key: key);

  final double maxWidth;

  @override
  ConsumerState<MinimizedCourtStateMachine> createState() =>
      _MinimizedCourtStateMachineState();
}

class _MinimizedCourtStateMachineState
    extends ConsumerState<MinimizedCourtStateMachine>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(courtStateProvider.notifier)
          .setAnimationController(_animationController);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final artboard = ref.watch(minimizedCourtArtboardProvider);

    return artboard.when(
      loading: () => const SizedBox.shrink(),
      error: (error, stack) =>
          Center(child: Text('Minimized Court Artboard Error $error')),
      data: (artboard) {
        return Rive(
          artboard: artboard,
          fit: BoxFit.fill,
        );
      },
    );
  }
}
