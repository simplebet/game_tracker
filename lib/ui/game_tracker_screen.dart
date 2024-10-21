import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/repositories/game_tracker_repository.dart';
import 'package:game_tracker/core/services/socket_service.dart';
import 'package:game_tracker/init_params.dart';
import 'package:game_tracker/ui/basketball_tracker/util/helper.dart';
import 'package:game_tracker/ui/football_tracker/football_tracker.dart';
import 'package:game_tracker/ui/football_tracker/football_tracker_minimized.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:universal_html/html.dart' as html;

class GameTrackerScreen extends ConsumerStatefulWidget {
  const GameTrackerScreen({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameTrackerScreenState();
}

class _GameTrackerScreenState extends ConsumerState<GameTrackerScreen> {
  @override
  void initState() {
    super.initState();
    _sendGameTrackerReadyMessage();
  }

  void _sendGameTrackerReadyMessage() {
    final String viewMode = widget.size.height < 70 ? 'compact' : 'full';

    if (kIsWeb) {
      final tracker = jsonEncode({
        'status': 'active',
        'tray': 'closed',
        'uuid': initParameters['uuid'] ?? '',
        'view_mode': viewMode,
      });
      html.window.dispatchEvent(html.CustomEvent('tracker', detail: tracker));
      if (html.window.parent != null) {
        html.window.parent!.postMessage(tracker, '*');
      }

      // Used for communicating with native iOS
      postMessageToWebkit('tracker', tracker);
    }
  }

  bool sizeChangedNotification(SizeChangedLayoutNotification notification) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
        ..invalidate(socketServiceProvider)
        ..invalidate(gameTrackerRepositoryProvider);
    });
    _sendGameTrackerReadyMessage();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(gameTrackerScreenControllerProvider);
    final league = state.league;
    final isMinimized = widget.size.height <= 70;

    if (league != null) {
      if (league.isFootballLeagues) {
        return NotificationListener<SizeChangedLayoutNotification>(
          onNotification: sizeChangedNotification,
          child: SizeChangedLayoutNotifier(
            child: isMinimized
                ? FootballTrackerMinimized(size: widget.size)
                : FootballTracker(size: widget.size),
          ),
        );
      }

      if (league.isBasketballLeagues) {
        // return isMinimized ? BasketballTrackerMinimized(match: store.basketballMatch!, size: widget.size) : BasketballTracker(match: store.basketballMatch!, size: widget.size);
      }
    }

    return const SizedBox.shrink();
  }
}
