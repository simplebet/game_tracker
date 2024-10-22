import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/repositories/game_tracker_repository.dart';
import 'package:game_tracker/ui/football_tracker/controllers/incident_sequence_controller.dart';
import 'package:game_tracker/ui/football_tracker/full_view/providers/transition_overlays_minimized_rive_provider.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/animation_sequence/football_animation_sequence_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/football_field_component_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/state_notifier/transition_overlays_minimized_notifier.dart';
import 'package:game_tracker/ui/football_tracker/state_nofitifiers/last_play_tray_state_notifier.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballTrackerFlameGameMinimized extends FlameGame
    with HasComponentRef, HasGameRef {
  FootballTrackerFlameGameMinimized(
    WidgetRef ref, {
    required this.skin,
    required this.incidentSequenceController,
  }) {
    HasComponentRef.widgetRef = ref;
  }

  final GameTrackerSkin skin;
  final IncidentSequenceController incidentSequenceController;

  double get screenWidth => gameRef.size.x;
  double get screenHeight => kFootballTrackerMinimizedHeight;

  @override
  Color backgroundColor() => Colors.transparent;

  FootballAnimationSequenceMinimized animationSequence =
      FootballAnimationSequenceMinimized();

  @override
  Future<void> onLoad() async {
    Flame.images.prefix = kFlameImagesPrefixPath;

    final state = ref.read(gameTrackerScreenControllerProvider);
    final repo = ref.read(gameTrackerRepositoryProvider).requireValue;
    final transitionStateNotifier =
        ref.read(transitionOverlaysMinimizedStateProvider.notifier);
    final lastPlayTrayStateNotifier =
        ref.read(lastPlayTrayStateProvider.notifier);

    incidentSequenceController.init(this);

    final transitionsArtboard =
        await ref.read(transitionOverlaysMinimizedRiveProvider.future);

    final homeTeam = state.match?.homeTeam;
    final awayTeam = state.match?.awayTeam;

    if (homeTeam != null && awayTeam != null) {
      // draw football field
      add(
        FootballFieldComponentMinimized(
          skin: skin,
          width: screenWidth,
          awayTeam: awayTeam,
          homeTeam: homeTeam,
        ),
      );
      animationSequence.init(
        this,
        skin: skin,
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        artboard: transitionsArtboard,
        transitionOverlaysStateNotifier: transitionStateNotifier,
        lastPlayTrayStateNotifier: lastPlayTrayStateNotifier,
      );
    }

    /// add upcoming incidents to the match stream
    repo.footballIncidentStreamController.listen((incident) {
      // if (repo.footballIncidentStreamController.) {
      /// don't render corrected incidents unless it's a drive started incident
      if (incident.event == FootballMatchIncidentEventType.driveStarted ||
          !incident.isCorrectedPlay) {
        /// don't animate the last one. only animate new ones
        incidentSequenceController.add(incident);
        // }
      }
    });

    await super.onLoad();
  }

  /// throw away any `dt` values that are too large
  /// the time since the last time update ran in seconds
  @override
  void updateTree(double dt) {
    if (dt > 4) {
      return;
    }

    super.updateTree(dt);
  }

  @override
  void render(Canvas canvas) {
    canvas
      ..save()
      // Move the canvas to the center of the screen.
      ..translate(size.x / 2, size.y / 2)
      ..transform(kSkewMatrixMinimized.storage)
      // Move the canvas back to the top left corner.
      ..translate(-size.x / 2, -size.y / 2);

    super.render(canvas);
    canvas.restore();
  }

  @override
  void onRemove() {
    processLifecycleEvents();
    Flame.images.clearCache();
    Flame.assets.clearCache();
    super.onRemove();
  }
}
