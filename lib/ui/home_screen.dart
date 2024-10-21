import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/game_tracker_screen.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/match_selection/match_selection_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return const MatchesScreen();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameTrackerScreenControllerProvider);

    if (state.match == null) {
      return const SizedBox.shrink();
    }

    return GameTrackerScreen(size: widget.size);
  }
}
