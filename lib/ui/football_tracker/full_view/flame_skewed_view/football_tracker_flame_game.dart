import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/repositories/game_tracker_repository.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/constants.dart';
import '../../controllers/incident_sequence_controller.dart';
import '../../state_nofitifiers/last_play_tray_state_notifier.dart';
import '../animation_sequence/football_animation_sequence.dart';
import '../controllers/flag_controller.dart';
import '../controllers/football_controller.dart';
import '../controllers/transition_overlays_controller.dart';
import '../providers/football_tracker_rive_provider.dart';
import '../providers/transition_overlays_rive_provider.dart';
import '../rive/flag_rive_component.dart';
import '../rive/transition_overlays_rive_component.dart';
import 'football_field_component.dart';

class FootballTrackerFlameGame extends FlameGame
    with HasComponentRef, HasGameRef {
  FootballTrackerFlameGame(
    WidgetRef ref, {
    required this.skin,
  }) {
    HasComponentRef.widgetRef = ref;
  }

  final GameTrackerSkin skin;

  double get screenWidth => gameRef.size.x;
  double get screenHeight => gameRef.size.y;

  late Artboard footballArtboard;
  late Artboard flagArtboard;
  late FootballController footballController;
  late FlagController flagController;
  late TransitionOverlaysController transitionOverlaysController;
  late CameraComponent cameraComponent;
  late StateMachineController footballStateMachineController;
  late StateMachineController flagStateMachineController;
  late StateMachineController transitionOverlayStateMachineController;

  FootballAnimationSequence animationSequence = FootballAnimationSequence();

  @override
  Color backgroundColor() => Colors.transparent;

  @override
  Future<void> onLoad() async {
    Flame.images.prefix = kFlameImagesPrefixPath;

    final incidentSequenceController =
        ref.read(incidentSequenceControllerProvider);
    final lastPlayTrayStateNotifier =
        ref.read(lastPlayTrayStateProvider.notifier);

    final riveFootball = await ref.read(footballTrackerRiveProvider.future);

    footballArtboard = await loadArtboard(riveFootball, artboardName: 'Ball');

    flagArtboard = await loadArtboard(riveFootball, artboardName: 'Flag-Small');

    footballStateMachineController =
        StateMachineController.fromArtboard(footballArtboard, 'StateMachine')!;

    flagStateMachineController =
        StateMachineController.fromArtboard(flagArtboard, 'StateMachine')!;

    final transitionOverlays =
        await ref.read(transitionOverlaysRiveProvider.future);

    final transitionsArtboard =
        await loadArtboard(transitionOverlays, artboardName: 'Transitions');

    transitionOverlayStateMachineController =
        StateMachineController.fromArtboard(
            transitionsArtboard, 'StateMachine')!;

    footballController =
        FootballController(controller: footballStateMachineController);

    flagController = FlagController(controller: flagStateMachineController);

    transitionOverlaysController = TransitionOverlaysController(
        controller: transitionOverlayStateMachineController,
        artboard: transitionsArtboard);

    transitionsArtboard.addController(transitionOverlayStateMachineController);

    footballArtboard.addController(footballStateMachineController);

    flagArtboard.addController(flagStateMachineController);

    incidentSequenceController.init(this);

    add(TransitionOverlaysRiveComponent(transitionsArtboard));

    final flagRiveComponent = FlagRiveComponent(flagArtboard);

    add(flagRiveComponent);

    final stateNotifier =
        ref.read(gameTrackerScreenControllerProvider.notifier);
    final state = ref.read(gameTrackerScreenControllerProvider);
    if (state.match!.awayTeam != null && state.match!.homeTeam != null) {
      add(FootballFieldComponent(
        skin: skin,
        width: screenWidth,
        height: screenHeight,
        awayTeam: state.match!.awayTeam!,
        homeTeam: state.match!.homeTeam!,
      ));

      animationSequence.init(
          footballArtboard: footballArtboard,
          footballController: footballController,
          flagController: flagController,
          flagRiveComponent: flagRiveComponent,
          transitionOverlaysController: transitionOverlaysController,
          lastPlayTrayStateNotifier: lastPlayTrayStateNotifier,
          skin: skin,
          homeTeam: state.match!.homeTeam!,
          awayTeam: state.match!.awayTeam!,
          game: this);
    }

    /// render past incidents within the current drive
    if (state.match?.status == MatchStatus.active) {
      animationSequence
          .renderLastDriveIncidents(stateNotifier.pastDriveIncidents);
    }

    final repo = ref.read(gameTrackerRepositoryProvider).requireValue;

    /// render the upcoming incidents
    repo.footballIncidentStreamController.listen((value) {
      final incident = value as FootballMatchIncidentModel;

      /// don't render corrected incidents unless it's a drive started incident
      if (incident.event == FootballMatchIncidentEventType.driveStarted ||
          !incident.isCorrectedPlay) {
        incidentSequenceController.add(incident);
      }
    });
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
      ..transform(
          (size.x < kSmallerScreenWidth ? kSkewMatrixSmall : kSkewMatrix)
              .storage)
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
