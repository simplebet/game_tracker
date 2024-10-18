import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../notifiers/court_state_notifier.dart';
import '../providers/court_artboard_provider.dart';
import '../widgets/basketball_tracker_loading_widget.dart';

class CourtStateMachine extends ConsumerStatefulWidget {
  const CourtStateMachine({Key? key}) : super(key: key);

  @override
  ConsumerState<CourtStateMachine> createState() => _CourtStateMachineState();
}

class _CourtStateMachineState extends ConsumerState<CourtStateMachine>
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
    final artboard = ref.watch(courtArtboardProvider);

    return artboard.when(
      loading: () => const BasketballTrackerLoadingWidget(),
      error: (error, stack) =>
          const Center(child: Text('Court Artboard Error')),
      data: (artboard) {
        return Rive(artboard: artboard);
      },
    );
  }
}
