import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/palette.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/flag_controller.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/football_controller.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/transition_overlays_controller.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/cross_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/custom_text_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/dashed_arc_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/dashed_double_arc_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/down_line_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/drive_container_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/drive_start_line_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/football_tracker_flame_game.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/penalty_flag_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/play_ribbon_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/solid_arc_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/solid_line_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/sprites/goal_post_sprite.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/sprites/star_sprite.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/sprites/x_icon_sprite.dart';
import 'package:game_tracker/ui/football_tracker/full_view/rive/flag_rive_component.dart';
import 'package:game_tracker/ui/football_tracker/full_view/rive/football_rive_component.dart';
import 'package:game_tracker/ui/football_tracker/state_nofitifiers/last_play_tray_state_notifier.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/team_color.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:rive/rive.dart';

typedef FootballPlayAnimationCallback = Future<void> Function(
  FootballMatchIncidentModel incident,
  double driveComponentHeight,
);

class FootballAnimationSequence {
  FootballAnimationSequence();

  late GameTrackerSkin _skin;
  late Artboard _footballArtboard;

  late TeamModel _awayTeam;
  late TeamModel _homeTeam;
  late FootballTrackerFlameGame _game;
  late FootballController _footballController;
  late FlagController _flagController;
  late FlagRiveComponent _flagRiveComponent;
  late TransitionOverlaysController _transitionOverlaysController;
  late LastPlayTrayStateNotifier _lastPlayTrayStateNotifier;

  void init({
    required GameTrackerSkin skin,
    required Artboard footballArtboard,
    required TeamModel awayTeam,
    required TeamModel homeTeam,
    required FootballTrackerFlameGame game,
    required FootballController footballController,
    required FlagController flagController,
    required FlagRiveComponent flagRiveComponent,
    required TransitionOverlaysController transitionOverlaysController,
    required LastPlayTrayStateNotifier lastPlayTrayStateNotifier,
  }) {
    _skin = skin;
    _footballArtboard = footballArtboard;
    _flagRiveComponent = flagRiveComponent;
    _awayTeam = awayTeam;
    _homeTeam = homeTeam;
    _game = game;
    _footballController = footballController;
    _flagController = flagController;
    _transitionOverlaysController = transitionOverlaysController;
    _lastPlayTrayStateNotifier = lastPlayTrayStateNotifier;
  }

  double get screenWidth => _game.screenWidth;

  double get screenHeight => _game.screenHeight;

  DriveContainerComponent driveComponent = DriveContainerComponent();

  double driveComponentHeight = 0;

  void renderLastDriveIncidents(List<FootballMatchIncidentModel>? incidents) {
    if (incidents != null && incidents.isNotEmpty) {
      for (var incident in incidents) {
        /// position past plays vertically renders on the field
        if (incident.event.isPersistingEvent) {
          driveComponentHeight += kComponentMoveUpDistance;
        }

        /// check if its rush, pass, penalty, fumble, sack, interception,
        /// field goal made/missed, punt and safety incidents
        /// then render the SolidLine/DashedArc/PenaltyFlag
        if (incident.event.isPassEvent) {
          passEventsDashedArc(incident, driveComponentHeight);
        }

        if (incident.event.isRushEvent) {
          rushEventsSolidLine(incident, driveComponentHeight);
        }

        if (incident.event.isPenaltyEvent) {
          penaltyFlag(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.fumbleFromPass ||
            incident.event == FootballMatchIncidentEventType.fumbleFromRush) {
          fumbleDashedDoubleArc(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.sack) {
          sackSolidLine(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.interception) {
          interceptionDashedArcLine(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.fieldGoalMade ||
            incident.event == FootballMatchIncidentEventType.extraPointMade) {
          fieldGoalMadeSolidArc(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.fieldGoalMissed ||
            incident.event == FootballMatchIncidentEventType.extraPointMissed) {
          fieldGoalMissedSolidArc(incident, driveComponentHeight);
        }

        if (incident.event.isPuntEvents) {
          if (incident.event == FootballMatchIncidentEventType.puntBlocked) {
            puntBlockedDashedArcLine(incident, driveComponentHeight);
          } else {
            puntDashedArc(incident, driveComponentHeight);
          }
        }

        if (incident.event.isSafetyEvents) {
          if (incident.event == FootballMatchIncidentEventType.safetyFromPunt) {
            safetyFromPuntDashedArc(incident, driveComponentHeight);
          } else {
            safetyFromRushOrPassLine(incident, driveComponentHeight);
          }
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromBlockedPunt) {
          touchdownFromBlockedPuntDashedArcLine(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromPunt) {
          touchdownFromPuntDashedArcLine(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromRush) {
          touchdownFromRushLine(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromPass) {
          touchdownFromPassDashedArc(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromPickSix) {
          touchdownFromPickSixDashedArcLine(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromScoopAndScore) {
          touchdownFromScoopAndScoreDashedArcLine(
            incident,
            driveComponentHeight,
          );
        }

        if (incident.event ==
            FootballMatchIncidentEventType.twoPointConversionMade) {
          twoPointConversionMadeLine(incident, driveComponentHeight);
        }

        if (incident.event ==
            FootballMatchIncidentEventType.twoPointConversionMissed) {
          twoPointConversionMissedCross(incident, driveComponentHeight);
        }

        if (incident.event == FootballMatchIncidentEventType.driveStarted) {
          renderDriveStartLine(incident);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.fumbleFromKickoff) {
          fumbleFromKickoffArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.safetyFromKickoff) {
          safetyFromKickoffArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.kickoffWithTouchback) {
          kickoffWithTouchbackArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromKickoff) {
          touchdownFromKickoffArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.onsideKickSucceeds) {
          onsideKickSucceedsArc(incident, driveComponentHeight);
        }
        if (incident.event == FootballMatchIncidentEventType.onsideKickFails) {
          onsideKickFailsArc(incident, driveComponentHeight);
        }
        if (incident.event == FootballMatchIncidentEventType.kickoffReturn) {
          kickoffReturnArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal) {
          touchdownFromReturnedFieldGoalArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromFumbledPunt) {
          touchdownFromFumbledPuntArc(incident, driveComponentHeight);
        }
        if (incident.event ==
            FootballMatchIncidentEventType.touchdownFromFumbledKickoff) {
          touchdownFromFumbledKickoffArc(incident, driveComponentHeight);
        }
      }

      /// on load when the past incidents filled up the field
      /// move DriveComponent up
      final isSmallerScreen = screenWidth < kSmallerScreenWidth;
      final driveComponentMoveUpHeightFactor = isSmallerScreen
          ? kFootballYardLineHeightFactorSmall
          : kFootballYardLineHeightFactor;

      if (driveComponentHeight >=
          screenHeight * driveComponentMoveUpHeightFactor) {
        driveComponent.y = -(driveComponentHeight -
            (screenHeight * kDriveComponentMaxHeightFactor));
      }

      /// if the last incident from past incidents list is drive ended, clear the field
      if (incidents.last.event.isDriveEndedOrMatchEnded ||
          incidents.last.isEvenPeriodEnd) {
        clearDrive();
      }
    }

    _game.add(driveComponent);
  }

  Future<void> renderUpcomingIncidents(
    FootballMatchIncidentModel incident,
  ) async {
    /// update last play tray
    if (incident.event.isDelayingEvents) {
      Future.delayed(const Duration(seconds: 5), () {
        _lastPlayTrayStateNotifier.updateLastPlayTray(incident);
      });
    } else {
      _lastPlayTrayStateNotifier.updateLastPlayTray(incident);
    }

    if (driveComponentHeight >= screenHeight * kDriveComponentMaxHeightFactor) {
      /// only move up the DriveComponent when there's a new persisted event added to the drive
      if (incident.event.isPersistingEvent) {
        final driveComponentOffset = (driveComponentHeight -
                (screenHeight * kDriveComponentMaxHeightFactor))
            .round()
            .abs();
        final driveComponentYCoordinate =
            driveComponent.position.y.round().abs();

        /// reset the DriveComponent to its original position if user scrolled
        if (driveComponentOffset != driveComponentYCoordinate) {
          driveComponent.add(
            MoveEffect.to(
              Vector2(0, -(driveComponentOffset + kComponentMoveUpDistance)),
              LinearEffectController(kDriveScrollUpSpeed),
            ),
          );
        } else {
          /// move the whole drive component up after each new incident animation sequence finish
          driveComponent.add(
            MoveEffect.by(
              Vector2(0, -kComponentMoveUpDistance),
              LinearEffectController(kDriveScrollUpSpeed),
            ),
          );
        }
      }
    }

    /// render the down line and incident start arrow
    await renderIncidentStart(incident);

    try {
      final incidentMap = footballIncidentsToAnimationMap[incident.event];

      if (incidentMap != null) {
        if (incident.event.isDelayingEvents) {
          Future.delayed(const Duration(seconds: 5), () async {
            await incidentMap(incident, driveComponentHeight);
          });
        } else {
          await incidentMap(incident, driveComponentHeight);
        }
      }

      /// increase the driveComponentHeight factor after each incident is rendered
      if (incident.event.isPersistingEvent) {
        driveComponentHeight += kComponentMoveUpDistance;
      }
    } catch (e) {
      throw Exception('Unknown football event');
    }
  }

  Future<void> coinTossAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final homeTeamWonCoinToss = incident.coinTossWinner == HomeOrAway.home;

    _transitionOverlaysController.setCoinTossColor(
      homeTeamWonCoinToss ? _homeTeam.primaryColor : _awayTeam.primaryColor,
    );
    _transitionOverlaysController.setCoinTossText(
      teamTricode:
          (homeTeamWonCoinToss ? _homeTeam.abbrv : _awayTeam.abbrv) ?? '',
    );

    await _transitionOverlaysController.coinToss();
  }

  Future<void> touchdownFromReturnedFieldGoalAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final endingSide = incident.start!.possession!.opposite;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;
    final startingYardline = incident.start!.yardline!;
    final startingSide = incident.start!.side!;

    final playRibbon = PlayRibbonComponent(
      text: 'FG ATT',
      color: incident.start!.possession == HomeOrAway.home
          ? _homeTeam.primaryColor
          : _awayTeam.primaryColor,
      yardline: incident.start!.yardline!,
      side: incident.start!.side!,
      direction: incident.start!.possession!.opposite,
      skin: _skin,
    );

    _game.add(playRibbon);

    await playRibbon.onCompleted;

    _footballController.flip();

    final GoalPostSprite goalPost = GoalPostSprite(side: endingSide);

    _game.add(goalPost);

    await Future.delayed(const Duration(milliseconds: 500));

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    final footballAnimation =
        FootballRiveComponent.touchdownFromReturnedFieldGoal(
      _footballArtboard,
      startingYardline: startingYardline,
      startingSide: startingSide,
      possession: startPossession,
      footballController: _footballController,
      starSprite: starSprite,
      screenWidth: screenWidth,
      endingSide: endingSide,
      screenHeight: screenHeight,
    );

    _game.add(footballAnimation);

    await footballAnimation.onCompleted;

    await Future.delayed(const Duration(milliseconds: 500));

    goalPost.fadeOut();

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fieldGoalMissed();

    final teamColor = endPossession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    _transitionOverlaysController.setColor(teamColor, teamColor);

    await _transitionOverlaysController.touchdown();

    await Future.delayed(const Duration(milliseconds: 500));

    final solidArc = SolidArcComponent.cross(
      skin: _skin,
      distance: 0,
      screenWidth: screenWidth,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    final distanceFromEndzone =
        getYardageInBetween(startingSide.opposite, -5, endingSide, -5)
            .toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: distanceFromEndzone - 5,
      distance: distanceFromEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startingSide.opposite,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      bottomPadding: 36,
    );

    driveComponent.add(solidArc);
    driveComponent.add(solidLineComponent);

    await Future.wait([solidArc.onCompleted, solidLineComponent.onCompleted]);
  }

  Future<void> touchdownFromFumbledPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startingYardline = incident.start!.yardline!;
    final startingSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;
    final endYardline = incident.end!.yardline!;
    final endSide = incident.end!.side!;

    _footballController.flip();
    final footballAnimation = FootballRiveComponent.touchdownFromFumbledPunt(
      _footballArtboard,
      startingYardline: startingYardline,
      startingSide: startingSide,
      startPossession: startPossession,
      endPossession: endPossession,
      endSide: endSide,
      footballController: _footballController,
      screenWidth: screenWidth,
    );

    _game.add(footballAnimation);
    await footballAnimation.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    final touchdownColor = incident.start!.possession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    _transitionOverlaysController.setColor(touchdownColor, touchdownColor);

    await _transitionOverlaysController.touchdown();

    await Future.delayed(const Duration(milliseconds: 500));

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endSide,
      endYardline,
    ).toDouble();

    final dashedArc = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance,
      side: startingSide,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    final fumbleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble() + 12,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      paint: BasicPalette.white.paint(),
      driveComponentHeight: driveComponentHeight + 16,
    );

    final distanceToEndzone =
        getYardageInBetween(endSide, endYardline + 12, endSide, -5).toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endYardline.toDouble() + 14,
      distance: distanceToEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      possession: endSide,
      driveComponentHeight: driveComponentHeight,
      extraPaddingForMoveUpDistance: 18,
      bottomPadding: 7,
    );

    driveComponent.add(dashedArc);
    driveComponent.add(fumbleArc);
    driveComponent.add(solidLineComponent);

    await Future.wait([
      dashedArc.onCompleted,
      fumbleArc.onCompleted,
      solidLineComponent.onCompleted,
    ]);
  }

  Future<void> touchdownFromFumbledKickoffAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startingYardline = incident.start!.yardline!;
    final startingSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;
    final endYardline = incident.end!.yardline!;
    final endSide = incident.end!.side!;

    _footballController.flip();
    final footballAnimation = FootballRiveComponent.touchdownFromFumbledKickoff(
      _footballArtboard,
      startingYardline: startingYardline,
      startingSide: startingSide,
      startPossession: startPossession,
      endPossession: endPossession,
      endSide: endSide,
      footballController: _footballController,
      screenWidth: screenWidth,
    );

    _game.add(footballAnimation);
    await footballAnimation.onCompleted;

    final fumbleColor = incident.start!.possession!.opposite == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    _transitionOverlaysController.setColor(fumbleColor, fumbleColor);

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    final touchdownColor = incident.start!.possession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    _transitionOverlaysController.setColor(touchdownColor, touchdownColor);

    await _transitionOverlaysController.touchdown();

    await Future.delayed(const Duration(milliseconds: 500));

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endSide,
      endYardline,
    ).toDouble();

    final dashedArc = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance,
      side: startingSide,
      possession: incident.start!.possession!,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final fumbleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble() + 12,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      paint: BasicPalette.white.paint(),
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight + 16,
    );

    final distanceToEndzone =
        getYardageInBetween(endSide, endYardline + 12, endSide, -8).toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endYardline.toDouble() + 14,
      distance: distanceToEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      possession: endSide,
      driveComponentHeight: driveComponentHeight,
      extraPaddingForMoveUpDistance: 18,
      shouldMoveUp: false,
      bottomPadding: 7,
    );

    driveComponent.add(dashedArc);
    driveComponent.add(fumbleArc);
    driveComponent.add(solidLineComponent);

    await Future.wait([
      dashedArc.onCompleted,
      fumbleArc.onCompleted,
      solidLineComponent.onCompleted,
    ]);
  }

  Future<void> safetyFromBlockedPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await puntBlockedAnimation(incident, driveComponentHeight);
    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.safety();
  }

  Future<void> awaitinOtAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await _transitionOverlaysController.overtime();
  }

  Future<void> timeoutAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await _transitionOverlaysController.timeOut();
  }

  Future<void> periodEndAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final period = incident.meta!.period;

    switch (period) {
      case 2:
        await _transitionOverlaysController.halfTime();
        break;
      case 1:
      case 3:
      default:
        await _transitionOverlaysController.quarterEnded();
        break;
    }

    if (incident.isEvenPeriodEnd) {
      clearDrive();
    }
  }

  Future<void> doubleTurnoverAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final starSprite = StarSprite();

    final startYardline = incident.start!.yardline!;
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;

    await _transitionOverlaysController.doubleTurnover();

    final pass = FootballRiveComponent.fumbleFromPassWithRun(
      _footballArtboard,
      passingStartYardline: startYardline,
      rushingEndYardline: incident.end!.yardline!,
      passingStartSide: startSide,
      rushingEndSide: incident.end!.side!,
      possession: possession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      footballController: _footballController,
      starSprite: starSprite,
    );

    _game.add(pass);
    _game.add(starSprite);

    await pass.onCompleted;

    final solidLine = SolidLineComponent.regular(
      skin: _skin,
      yardline: startYardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
    );

    _game.add(solidLine);

    await solidLine.onCompleted;
  }

  Future<void> driveStartedAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    /// clear the drive if the new drive comes in before the 10 seconds drive ended delay
    // clearDrive();

    _game.add(
      TimerComponent(
        period: 0.1,
        onTick: () {
          renderDriveStartLine(incident);

          /// reset driveComponentHeight value to 0 when drive start
          driveComponentHeight = 0;

          driveComponent.y = 0;
        },
      ),
    );
  }

  void renderDriveStartLine(FootballMatchIncidentModel incident) {
    final isCFB = incident.league?.isCFB ?? false;
    final driveStartLineComponent = DriveStartLineComponent(
      skin: _skin,
      yardline: incident.end!.yardline!.toDouble(),
      side: incident.end!.side!,
      possession: incident.end!.possession!,
      awayTeamName: isCFB
          ? _awayTeam.footballFieldName.formattedTeamName()
          : _awayTeam.abbrv.formattedTeamName(),
      homeTeamName: isCFB
          ? _homeTeam.footballFieldName.formattedTeamName()
          : _homeTeam.abbrv.formattedTeamName(),
    );

    final Component? latestDriveStartLine = _game.children.firstWhereOrNull(
      (component) => component.runtimeType == DriveStartLineComponent,
    );

    if (latestDriveStartLine != null) {
      _game.remove(latestDriveStartLine);
    }
    _game.add(driveStartLineComponent);
  }

  Future<void> driveEndedAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    /// clear past drive incidents on field after 20 seconds
    _game.add(
      TimerComponent(
        period: 20,
        onTick: () {
          clearDrive();
        },
      ),
    );
  }

  void clearDrive() {
    /// clear the Components from past drive on the field
    driveComponent.removeWhere(
      (component) =>
          component is SolidLineComponent ||
          component is SolidArcComponent ||
          component is DashedArcComponent ||
          component is PenaltyFlagArrowComponent ||
          component is DashedDoubleArcComponent ||
          component is CrossComponent,
    );

    _game.removeWhere((component) => component is DriveStartLineComponent);

    /// reset driveComponentHeight value to 0 when drive end
    driveComponentHeight = 0;

    driveComponent.y = 0;
  }

  Future<void> renderIncidentStart(
    FootballMatchIncidentModel incident,
  ) async {
    final showIncidentStart = !(incident.event.isKickoffEvents ||
        incident.event.isTwoPointsConversionEvents ||
        incident.event.isDriveStartOrEnd ||
        incident.event.isPeriodEndOrOverTime ||
        incident.event.isExtraPointEvents ||
        incident.event.isPenaltyEvent ||
        incident.event.isUnderReviewEvent ||
        incident.event ==
            FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal ||
        incident.event == FootballMatchIncidentEventType.timeout ||
        incident.event == FootballMatchIncidentEventType.coinToss ||
        incident.event == FootballMatchIncidentEventType.matchEnded ||
        incident.event == FootballMatchIncidentEventType.unknown);

    if (!showIncidentStart) {
      return;
    }

    final side = incident.start!.side ?? HomeOrAway.none;
    final possession = incident.start!.possession ?? HomeOrAway.none;
    final distance = incident.start?.distance?.toDouble() ?? 0;
    final startYardline = incident.start?.yardline?.toDouble() ?? 0;
    final isPossessionSameAsSide = side == possession;
    final endYardLine = isPossessionSameAsSide
        ? startYardline + distance
        : startYardline - distance;

    final startDownLine = DownLineComponent.start(
      skin: _skin,
      yardline: startYardline,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: side,
    );
    final endDownLine = DownLineComponent.end(
      skin: _skin,
      yardline: endYardLine,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: side,
    );

    _game.add(startDownLine);
    _game.add(endDownLine);

    final String yardlineLabel = startYardline > 50
        ? (100 - startYardline.toInt()).toString()
        : startYardline.toString();

    final isCFB = incident.league?.isCFB ?? false;

    final awayTeamShortName = isCFB
        ? _awayTeam.footballFieldName.formattedTeamName()
        : _awayTeam.abbrv.formattedTeamName();

    final homeTeamShortName = isCFB
        ? _homeTeam.footballFieldName.formattedTeamName()
        : _homeTeam.abbrv.formattedTeamName();

    final String sideTeamAbbrv =
        (side == HomeOrAway.away ? awayTeamShortName : homeTeamShortName);

    final showPlayStartRibbon = !(incident.event.isFieldGoalEvents ||
        incident.event.isExtraPointEvents);

    if (showPlayStartRibbon) {
      final playRibbonComponent = PlayRibbonComponent(
        yardline: incident.start!.yardline ?? 0,
        text: yardlineLabel.toUpperCase(),
        teamAbbreviation: sideTeamAbbrv.toUpperCase(),
        side: side,
        color: possession == HomeOrAway.away
            ? _awayTeam.primaryColor
            : _homeTeam.primaryColor,
        direction: incident.start?.possession?.opposite ?? HomeOrAway.none,
        skin: _skin,
      );
      _game.add(playRibbonComponent);
      await playRibbonComponent.onCompleted;
    }
  }

  Future<void> passAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.spiral();

    final startingSide = incident.start!.side!;
    final endingSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final footballArc = FootballRiveComponent.arc(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: endYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    if (incident.event ==
        FootballMatchIncidentEventType.passThatResultedInATurnover) {
      setTransitionOverlayColor(incident);
      await _transitionOverlaysController.turnoverOnDowns();
    }

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: incident.event.isPassIncompleteEvent
          ? kPassIncompleteNetYards
          : incident.meta!.netYards!.toDouble(),
      side: startingSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: incident.event.isPassIncompleteEvent
          ? ArrowHeadType.cross
          : ArrowHeadType.arrow,
    );

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;

    if (!incident.event.isPassIncompleteEvent) {
      final direction =
          incident.event.isLosesYardEvent ? possession : possession.opposite;

      final arrowPath = PlayRibbonComponent(
        side: startingSide,
        color: possession == HomeOrAway.away
            ? _awayTeam.primaryColor
            : _homeTeam.primaryColor,
        yardline: startYardline,
        text: '${incident.meta?.netYards ?? 0}YD',
        playType: convertTypeToRushOrPass(incident.event),
        direction: direction,
        skin: _skin,
      );

      _game.add(arrowPath);

      await arrowPath.onCompleted;
    }
  }

  void passEventsDashedArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final side = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.event.isPassIncompleteEvent
          ? kPassIncompleteNetYards
          : incident.meta!.netYards!.toDouble(),
      side: side,
      possession: possession,
      arrowHeadType: incident.event.isPassIncompleteEvent
          ? ArrowHeadType.cross
          : ArrowHeadType.arrow,
    );

    dashedArcComponent.y = driveComponentHeight - 4;

    driveComponent.add(dashedArcComponent);
  }

  Future<void> passIncompleteAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = startYardline +
        (kPassIncompleteNetYards.toInt() *
            (startSide != startPossession ? -1 : 1));
    final footballEndYardline =
        endYardline > 50 ? 100 - endYardline : endYardline;
    final endSide = endYardline > 50 ? startSide.opposite : startSide;

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    _footballController.spiral();

    final footballArc = FootballRiveComponent.passIncomplete(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: footballEndYardline,
      startingSide: startSide,
      endingSide: endSide,
      possession: startPossession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      controller: _footballController,
      starSprite: starSprite,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: kPassIncompleteNetYards,
      side: startSide,
      possession: startPossession,
      arrowHeadType: ArrowHeadType.cross,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;
  }

  Future<void> rushAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.idleAngled();

    final side = incident.start!.side!;
    final endSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final footballArc = FootballRiveComponent.rushEffect(
      _footballArtboard,
      startingYardline: yardline,
      endingYardline: endYardline,
      possession: possession,
      startingSide: side,
      endingSide: endSide,
      screenWidth: screenWidth,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      side: side,
      possession: possession,
      arrowHeadType: ArrowHeadType.arrow,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;

    final direction =
        incident.event.isLosesYardEvent ? possession : possession.opposite;

    final arrowPath = PlayRibbonComponent(
      color: possession == HomeOrAway.away
          ? _awayTeam.primaryColor
          : _homeTeam.primaryColor,
      side: side,
      yardline: yardline,
      direction: direction,
      text: '${incident.meta?.netYards ?? 0}YD',
      playType: convertTypeToRushOrPass(incident.event),
      skin: _skin,
    );

    _game.add(arrowPath);

    await arrowPath.onCompleted;
  }

  void rushEventsSolidLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final side = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      side: side,
      possession: possession,
      arrowHeadType: ArrowHeadType.arrow,
    );

    solidLineComponent.y = driveComponentHeight - 16;

    driveComponent.add(solidLineComponent);
  }

  FootballRiveComponent buildBaseKickoff({
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
  }) {
    final kickoff = FootballRiveComponent.kickoff(
      _footballArtboard,
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      footballController: _footballController,
    );

    if (possession == HomeOrAway.away) {
      kickoff.flipHorizontallyAroundCenter();
    }

    return kickoff;
  }

  Future<void> kickoffWithTouchbackAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    const int kickToYardline = -5;
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final int distance = 105 - startYardline;

    final kickoff = buildBaseKickoff(
      startingYardline: incident.start!.yardline!,
      endingYardline: kickToYardline,
      startingSide: incident.start!.side!,
      endingSide: incident.end!.side!,
      possession: incident.start!.possession!,
    );

    _game.add(kickoff);

    await kickoff.onCompleted;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: distance.toDouble(),
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      arrowHeadType: ArrowHeadType.arrow,
    );

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchback();

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;
  }

  Future<void> kickoffReturnAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final footballComponent = FootballRiveComponent.kickoffReturn(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: endYardline,
      startingSide: startSide,
      possession: possession,
      screenWidth: screenWidth,
      controller: _footballController,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 5).toDouble(),
      side: startSide,
      possession: possession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final distanceFromEndzone =
        getYardageInBetween(startSide.opposite, -5, endSide, endYardline)
            .toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -5,
      distance: distanceFromEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startSide.opposite,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);

    await Future.wait(
      [dashedArcComponent.onCompleted, solidLineComponent.onCompleted],
    );
  }

  Future<void> onsideKickFailsAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final endingYardline = incident.end!.yardline!;
    final startingSide = incident.start!.side!;
    final endingSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startingYardline = incident.start!.yardline!;

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endingSide,
      endingYardline,
    ).toDouble();

    final kickoff = buildBaseKickoff(
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      possession: startPossession,
    );

    _game.add(kickoff);

    await kickoff.onCompleted;

    final xIcon = XIconSprite();

    _game.add(xIcon);

    await xIcon.trigger(
      position: Vector2(kickoff.x, kickoff.y + kickoff.height),
      duration: 1,
    );

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance + 2,
      side: startingSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endingYardline.toDouble() + 2,
      distance: 2,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endingSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: ArrowHeadType.arrow,
      shouldMoveUp: false,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);

    await Future.wait(
      [dashedArcComponent.onCompleted, solidLineComponent.onCompleted],
    );
  }

  Future<void> onsideKickSucceedsAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final endingYardline = incident.end!.yardline!;
    final startingSide = incident.start!.side!;
    final endingSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startingYardline = incident.start!.yardline!;

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endingSide,
      endingYardline,
    ).toDouble();

    final kickoff = buildBaseKickoff(
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      possession: startPossession,
    );

    _game.add(kickoff);

    await kickoff.onCompleted;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance - 2,
      side: startingSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endingYardline.toDouble() - 2,
      distance: -2,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endingSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: ArrowHeadType.arrow,
      shouldMoveUp: false,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);

    await Future.wait(
      [dashedArcComponent.onCompleted, solidLineComponent.onCompleted],
    );
  }

  Future<void> fieldGoalMadeAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final playRibbon = PlayRibbonComponent(
      text: incident.event.isExtraPointEvents ? 'PAT' : 'FG ATT',
      color: incident.start!.possession == HomeOrAway.home
          ? _homeTeam.primaryColor
          : _awayTeam.primaryColor,
      yardline: incident.start!.yardline!,
      side: incident.start!.side!,
      direction: incident.start!.possession!.opposite,
      skin: _skin,
    );

    _game.add(playRibbon);

    await playRibbon.onCompleted;

    _footballController.flip();

    final HomeOrAway endingSide = incident.start!.possession!.opposite;

    final GoalPostSprite goalPost = GoalPostSprite(side: endingSide);

    _game.add(goalPost);

    await Future.delayed(const Duration(milliseconds: 500));

    final fieldGoal = FootballRiveComponent.fieldGoalMade(
      _footballArtboard,
      startingYardline: incident.start!.yardline!,
      startingSide: incident.start!.side!,
      endingSide: endingSide,
      screenWidth: screenWidth,
    );

    _game.add(fieldGoal);

    await fieldGoal.onCompleted;

    await Future.delayed(const Duration(milliseconds: 500));

    goalPost.fadeOut();

    setTransitionOverlayColor(incident);
    if (incident.event.isExtraPointEvents) {
      await _transitionOverlaysController.extraPointMade();
    } else {
      await _transitionOverlaysController.fieldGoalMade();
    }

    final solidArc = SolidArcComponent(
      skin: _skin,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidArc);

    await solidArc.onCompleted;
  }

  void fieldGoalMadeSolidArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final solidArc = SolidArcComponent(
      skin: _skin,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
    );

    solidArc.y = driveComponentHeight;

    driveComponent.add(solidArc);
  }

  Future<void> fieldGoalMissedAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final playRibbon = PlayRibbonComponent(
      text: incident.event.isExtraPointEvents ? 'PAT' : 'FG ATT',
      color: incident.start!.possession == HomeOrAway.home
          ? _homeTeam.primaryColor
          : _awayTeam.primaryColor,
      yardline: incident.start!.yardline!,
      side: incident.start!.side!,
      direction: incident.start!.possession!.opposite,
      skin: _skin,
    );

    _game.add(playRibbon);

    await playRibbon.onCompleted;

    _footballController.flip();

    final HomeOrAway endingSide = incident.start!.possession!.opposite;

    final GoalPostSprite goalPost = GoalPostSprite(side: endingSide);

    _game.add(goalPost);

    await Future.delayed(const Duration(milliseconds: 500));

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    final fieldGoal = FootballRiveComponent.fieldGoalMissed(
      _footballArtboard,
      startingYardline: incident.start!.yardline!,
      startingSide: incident.start!.side!,
      endingSide: endingSide,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      controller: _footballController,
      starSprite: starSprite,
    );

    _game.add(fieldGoal);

    await fieldGoal.onCompleted;

    await Future.delayed(const Duration(milliseconds: 500));

    goalPost.fadeOut();

    setTransitionOverlayColor(incident);
    if (incident.event.isExtraPointEvents) {
      await _transitionOverlaysController.extraPointMissed();
    } else {
      await _transitionOverlaysController.fieldGoalMissed();
    }

    final solidArc = SolidArcComponent.cross(
      skin: _skin,
      distance: 0,
      screenWidth: screenWidth,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidArc);

    await solidArc.onCompleted;
  }

  void fieldGoalMissedSolidArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final solidArc = SolidArcComponent.cross(
      skin: _skin,
      distance: 0,
      screenWidth: screenWidth,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
    );

    solidArc.y = driveComponentHeight;

    driveComponent.add(solidArc);
  }

  Future<void> penaltyAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final side = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;
    final netYards = incident.meta!.netYards!;

    await Future.delayed(const Duration(milliseconds: 500));

    _flagRiveComponent.x = getXPosition(yardline, side, screenWidth);
    _flagRiveComponent.y =
        (screenHeight * kPenaltyFlagHeightFactor) - _flagRiveComponent.height;

    //Flag must animate in the opposite start possession direction.
    //By default the flag animates in the home direction.
    if (possession == HomeOrAway.home) {
      _flagRiveComponent.flipHorizontally();
    }

    await _flagController.flagThrow();

    await _transitionOverlaysController.flag();

    final penaltyFlagArrow = PenaltyFlagArrowComponent(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      side: side,
      possession: possession,
      netYards: netYards.toDouble(),
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(penaltyFlagArrow);

    await penaltyFlagArrow.onCompleted;
  }

  void penaltyFlag(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final side = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;
    final netYards = incident.meta!.netYards!;

    final penaltyFlag = PenaltyFlagArrowComponent(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      side: side,
      possession: possession,
      netYards: netYards.toDouble(),
    );

    penaltyFlag.y = driveComponentHeight;

    driveComponent.add(penaltyFlag);
  }

  Future<void> sackAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.idleAngled();

    final int endYardline =
        incident.event == FootballMatchIncidentEventType.safetyFromSack
            ? -5
            : incident.end!.yardline!;

    final footballAnimation = FootballRiveComponent.sackEffect(
      _footballArtboard,
      startingYardline: incident.start!.yardline!,
      endingYardline: endYardline,
      startingSide: incident.start!.side!,
      endingSide: incident.end!.side!,
      screenWidth: screenWidth,
    );

    _game.add(footballAnimation);

    final starSprite = StarSprite();

    _game.add(starSprite);

    final startPossession = incident.start!.possession!;

    final Vector2 starOffset =
        startPossession == HomeOrAway.home ? Vector2(-5, -20) : Vector2(5, -20);

    final Vector2 starPosition = footballAnimation.position + starOffset;

    final Vector2 textOffset =
        startPossession == HomeOrAway.home ? Vector2(-25, -5) : Vector2(25, 0);

    final Vector2 textPosition = starPosition + textOffset;

    final text = CustomTextComponent(
      text: 'SACK',
      position: textPosition,
      angle: startPossession == HomeOrAway.home ? -math.pi / 6 : math.pi / 6,
    );
    _game.add(text);

    text.scaleIn();

    starSprite.scaleInOut(position: starPosition);

    final timer = TimerComponent(
      period: 1.5,
      onTick: text.scaleOut,
      removeOnFinish: true,
    );
    _game.add(timer);

    await footballAnimation.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.sack();

    final side = incident.start!.side!;
    final yardline = incident.start!.yardline!;

    double distance = incident.meta!.netYards!.toDouble();

    if (incident.event == FootballMatchIncidentEventType.safetyFromSack) {
      distance -= 5;
    }

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: distance,
      side: side,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void sackSolidLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final side = incident.start!.side!;
    final yardline = incident.start!.yardline!;
    final possession = incident.start!.possession!;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      side: side,
      possession: possession,
    );

    solidLineComponent.y = driveComponentHeight;

    driveComponent.add(solidLineComponent);
  }

  Future<void> touchdownFromPassAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    FootballRiveComponent footballArc;

    _footballController.spiral();

    footballArc = FootballRiveComponent.arc(
      _footballArtboard,
      startingSide: startSide,
      endingSide: endSide,
      startingYardline: yardline,
      endingYardline: -5,
      screenWidth: screenWidth,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;
  }

  void touchdownFromPassDashedArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble(),
      side: startSide,
      possession: possession,
    );

    dashedArcComponent.y = driveComponentHeight;

    driveComponent.add(dashedArcComponent);
  }

  Future<void> touchdownFromRushAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    _footballController.idleAngled();
    FootballRiveComponent footballArc;

    footballArc = FootballRiveComponent.rushEffect(
      _footballArtboard,
      startingSide: startSide,
      endingSide: endSide,
      startingYardline: yardline,
      endingYardline: -5,
      possession: possession,
      screenWidth: screenWidth,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble() + 5,
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void touchdownFromRushLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final yardline = incident.start!.yardline!;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: yardline.toDouble(),
      distance: incident.meta!.netYards!.toDouble() + 5,
      side: startSide,
      possession: possession,
    );

    solidLineComponent.y = driveComponentHeight;

    driveComponent.add(solidLineComponent);
  }

  Future<void> puntBlockedAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    var endYardline = incident.end!.yardline!;

    if (incident.event ==
        FootballMatchIncidentEventType.safetyFromBlockedPunt) {
      // Safety from blocked punt always ends in the middle of the endzone
      endYardline = -5;
    }

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    _footballController.spiral();

    final footballComponent = FootballRiveComponent.puntBlocked(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: endYardline,
      startingSide: startSide,
      endingSide: endSide,
      possession: startPossession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      controller: _footballController,
      starSprite: starSprite,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: (endYardline - startYardline).abs().toDouble() + 5,
      side: endSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void puntBlockedDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: startPossession,
    );

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: (endYardline - startYardline).abs().toDouble() + 5,
      side: endSide,
      possession: startPossession,
    );

    dashedArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight + 16;

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  Future<void> puntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.spiral();

    int puntToYardline;

    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;
    int distance;

    switch (incident.event) {
      case FootballMatchIncidentEventType.puntTouchback:
        puntToYardline = -5;
        distance = 105 -
            startYardline; // TODO: This only works if the punt is on the other side of the field
        break;
      default:
        puntToYardline = endYardline;
        distance = incident.meta!.netYards!.abs();
        break;
    }

    final footballArc = FootballRiveComponent.arc(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: puntToYardline,
      startingSide: startSide,
      endingSide: endSide,
      screenWidth: screenWidth,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    switch (incident.event) {
      case FootballMatchIncidentEventType.puntTouchback:
        setTransitionOverlayColor(incident);
        await _transitionOverlaysController.touchback();
        break;
      case FootballMatchIncidentEventType.puntFairCatch:
        setTransitionOverlayColor(incident);
        await _transitionOverlaysController.fairCatch();
        break;
      default:
        break;
    }

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: distance.toDouble(),
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: ArrowHeadType.arrow,
    );

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;
  }

  void puntDashedArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final netYards = incident.meta!.netYards!.abs().toDouble();

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: netYards,
      side: startSide,
      possession: possession,
      arrowHeadType: ArrowHeadType.arrow,
    );

    final yAxisPosition = netYards >= kLargeDashedArcThreshold ? 22 : 0;

    dashedArcComponent.y = driveComponentHeight + yAxisPosition;

    driveComponent.add(dashedArcComponent);
  }

  Future<void> touchdownFromBlockedPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final netYards =
        startSide != startPossession ? 100 - startYardline : startYardline;

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    _footballController.spiral();

    final footballComponent = FootballRiveComponent.touchdownFromBlockedPunt(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      endingSide: endSide,
      possession: startPossession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      starSprite: starSprite,
      controller: _footballController,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() + 10,
      side: endSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void touchdownFromBlockedPuntDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final netYards =
        startSide != startPossession ? 100 - startYardline : startYardline;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: startPossession,
    );

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() + 10,
      side: endSide,
      possession: startPossession,
    );

    dashedArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight + 16;

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  Future<void> touchdownFromPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    _footballController.spiral();

    final footballComponent = FootballRiveComponent.touchdownFromPunt(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      possession: startPossession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      starSprite: starSprite,
      controller: _footballController,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    /// end of the arc will be startPossession opposite team's 20 yardline
    final arcLength = (100 - startYardline) - kTouchdownFromPuntEndYardline;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: arcLength,
      side: startSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline + arcLength,
      distance: (100 - kTouchdownFromPuntEndYardline) + 5,
      side: endSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void touchdownFromPuntDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final arcLength = (100 - startYardline) - kTouchdownFromPuntEndYardline;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: arcLength,
      side: startSide,
      possession: startPossession,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline + arcLength,
      distance: (100 - kTouchdownFromPuntEndYardline) + 5,
      side: endSide,
      possession: startPossession,
    );

    dashedArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight + 16;

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  Future<void> interceptionAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;
    final netYards = incident.meta!.netYards!.abs().toDouble();

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    final footballComponent = FootballRiveComponent.interception(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: endYardline,
      startingSide: startSide,
      endingSide: endSide,
      possession: startPossession,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      controller: _footballController,
      starSprite: starSprite,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.interception();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: endSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards + kInterceptionNetYards,
      side: endSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void interceptionDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final netYards = incident.meta!.netYards!.abs().toDouble();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: endSide,
      possession: startPossession,
    );

    final solidLineStartYardline = startYardline +
        (startSide != startPossession
            ? -kInterceptionNetYards
            : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards + kInterceptionNetYards,
      side: endSide,
      possession: startPossession,
    );

    dashedArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight + 16;

    driveComponent.add(solidLineComponent);
    driveComponent.add(dashedArcComponent);
  }

  Future<void> touchdownFromPickSixAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startYardline = incident.start!.yardline!;

    /// possession.opposite is which team made touchdown happened
    final endZone = incident.end!.possession!.opposite;
    final netYards = startSide != endZone ? 100 - startYardline : startYardline;

    final StarSprite starSprite = StarSprite();

    _game.add(starSprite);

    final footballComponent = FootballRiveComponent.touchdownFromPickSix(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      endingSide: endSide,
      possession: endZone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      controller: _footballController,
      starSprite: starSprite,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: endZone,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    final solidLineStartYardline = startYardline +
        (startSide != endZone ? -kInterceptionNetYards : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() + 10,
      side: startSide,
      possession: endZone,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void touchdownFromPickSixDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;

    /// possession.opposite is which team made touchdown happened
    final endZone = incident.end!.possession!.opposite;
    final netYards = startSide != endZone ? 100 - startYardline : startYardline;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),

      /// use a fixed number since we don't get yards for interception
      distance: kInterceptionNetYards,
      side: startSide,
      possession: endZone,
    );

    final solidLineStartYardline = startYardline +
        (startSide != endZone ? -kInterceptionNetYards : kInterceptionNetYards);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() + 10,
      side: startSide,
      possession: endZone,
    );

    dashedArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight + 16;

    driveComponent.add(solidLineComponent);
    driveComponent.add(dashedArcComponent);
  }

  Future<void> touchdownFromKickoffAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;

    _footballController.flip();

    final footballComponent = FootballRiveComponent.touchdownFromKickoff(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      screenWidth: screenWidth,
      controller: _footballController,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 5).toDouble(),
      side: startSide,
      possession: possession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -5,
      distance: 110,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startSide.opposite,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      bottomPadding: 12,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);

    await Future.wait(
      [dashedArcComponent.onCompleted, solidLineComponent.onCompleted],
    );
  }

  Future<void> touchdownFromScoopAndScoreAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final endSide = incident.end!.side!;
    final startYardline = incident.start!.yardline!;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession;

    /// possession.opposite is which team made touchdown happened
    final endZone = endPossession!.opposite;
    final netYards =
        startSide != endPossession ? startYardline : 100 - startYardline;

    final riveComponent = FootballRiveComponent.touchdownFromScoopAndScore(
      _footballArtboard,
      startYardline: startYardline,
      startSide: startSide,
      endSide: endSide,
      possession: startPossession,
      screenWidth: screenWidth,
      footballController: _footballController,
    );

    _game.add(riveComponent);

    await riveComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.touchdown();

    final dashedDoubleArcComponent = DashedDoubleArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      netYards: kDoubleArcWidth,
      side: startSide,
      possession: endPossession,
      driveComponentHeight: driveComponentHeight,
    );

    if (endZone == HomeOrAway.away) {
      dashedDoubleArcComponent.flipHorizontally();
    }

    driveComponent.add(dashedDoubleArcComponent);

    final solidLineStartYardline = startYardline +
        (startSide != endZone ? kDoubleArcWidth : -kDoubleArcWidth);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() - 5,
      side: startSide,
      possession: endZone,
      driveComponentHeight: driveComponentHeight - 16,
    );

    solidLineComponent.y -= 16;

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void touchdownFromScoopAndScoreDashedArcLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;
    final endPossession = incident.end!.possession;

    /// possession.opposite is which team made touchdown happened
    final endZone = endPossession!.opposite;
    final netYards =
        startSide != endPossession ? startYardline : 100 - startYardline;

    final dashedDoubleArcComponent = DashedDoubleArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      netYards: kDoubleArcWidth,
      side: startSide,
      possession: endPossession,
    );

    if (endZone == HomeOrAway.away) {
      dashedDoubleArcComponent.flipHorizontally();
    }

    final solidLineStartYardline = startYardline +
        (startSide != endZone ? kDoubleArcWidth : -kDoubleArcWidth);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: solidLineStartYardline,
      distance: netYards.toDouble() - 5,
      side: startSide,
      possession: endZone,
    );

    // solidLineComponent.y -= 16;

    dashedDoubleArcComponent.y = driveComponentHeight;
    solidLineComponent.y = driveComponentHeight;

    driveComponent.add(solidLineComponent);
    driveComponent.add(dashedDoubleArcComponent);
  }

  Future<void> twoPointConversionAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final isMadeIncident =
        incident.event == FootballMatchIncidentEventType.twoPointConversionMade;

    final ribbonPath = PlayRibbonComponent(
      text: '2PT ATT',
      color: startPossession == HomeOrAway.home
          ? _homeTeam.primaryColor
          : _awayTeam.primaryColor,
      yardline: startYardline,
      side: startSide,
      direction: startPossession.opposite,
      skin: _skin,
    );

    _game.add(ribbonPath);

    await ribbonPath.onCompleted;

    _footballController.idleAngled();

    final footballComponent = FootballRiveComponent.rushEffect(
      _footballArtboard,
      startingYardline: startYardline,
      endingYardline: isMadeIncident ? -5 : 0,
      possession: startPossession,
      startingSide: startSide,
      endingSide: startSide,
      screenWidth: screenWidth,
    );

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    if (isMadeIncident) {
      final solidLineComponent = SolidLineComponent.regular(
        skin: _skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: startYardline.toDouble(),
        distance: startYardline.toDouble() + 5,
        side: startSide,
        possession: startPossession,
        driveComponentHeight: driveComponentHeight,
      );

      driveComponent.add(solidLineComponent);

      await solidLineComponent.onCompleted;
    } else {
      final crossComponent = CrossComponent(
        skin: _skin,
        side: startSide,
        yardline: startYardline.toDouble(),
        driveComponentHeight: driveComponentHeight,
      );

      driveComponent.add(crossComponent);

      await crossComponent.onCompleted;
    }

    setTransitionOverlayColor(incident);

    if (isMadeIncident) {
      await _transitionOverlaysController.twoPointConversionMade();
    } else {
      await _transitionOverlaysController.twoPointConversionFailed();
    }
  }

  void twoPointConversionMadeLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: startYardline.toDouble() + 5,
      side: startSide,
      possession: startPossession,
    );

    solidLineComponent.y = driveComponentHeight;

    driveComponent.add(solidLineComponent);
  }

  void twoPointConversionMissedCross(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;

    final crossComponent = CrossComponent(
      skin: _skin,
      side: startSide,
      yardline: startYardline.toDouble(),
    );

    crossComponent.y = driveComponentHeight;

    driveComponent.add(crossComponent);
  }

  Future<void> safetyFromKickoffAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.flip();

    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;
    final endZone = incident.end!.possession!;
    final startYardline = incident.start!.yardline!;

    final footballArc = FootballRiveComponent.safetyFromKickoff(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      endingSide: endZone,
      possession: startPossession,
      screenWidth: screenWidth,
      controller: _footballController,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    final teamColor = endPossession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    setTransitionOverlayColor(incident);
    _transitionOverlaysController.setColor(teamColor, teamColor);

    await _transitionOverlaysController.safety();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 2).toDouble(),
      side: startSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -2,
      distance: -3,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endZone,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: ArrowHeadType.arrow,
      shouldMoveUp: false,
      bottomPadding: 0,
    );

    driveComponent.add(solidLineComponent);
    driveComponent.add(dashedArcComponent);

    await Future.wait(
      [solidLineComponent.onCompleted, dashedArcComponent.onCompleted],
    );
  }

  Future<void> safetyFromPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.flip();

    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;
    final endZone = incident.end!.possession!;
    final startYardline = incident.start!.yardline!;

    final footballArc = FootballRiveComponent.safetyFromKickoff(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      endingSide: endZone,
      possession: startPossession,
      screenWidth: screenWidth,
      controller: _footballController,
    );

    _game.add(footballArc);

    await footballArc.onCompleted;

    final teamColor = endPossession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    _transitionOverlaysController.setColor(teamColor, teamColor);

    await _transitionOverlaysController.safety();

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 5).toDouble(),
      side: startSide,
      possession: startPossession,
      arrowHeadType: ArrowHeadType.arrow,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArcComponent);

    await dashedArcComponent.onCompleted;
  }

  void safetyFromPuntDashedArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline - 5).toDouble(),
      side: startSide,
      possession: startPossession,
      arrowHeadType: ArrowHeadType.arrow,
    );

    dashedArcComponent.y = driveComponentHeight;

    driveComponent.add(dashedArcComponent);
  }

  Future<void> safetyFromRushOrPassAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endZone = incident.end!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    FootballRiveComponent footballComponent;

    if (incident.event == FootballMatchIncidentEventType.safetyFromPass) {
      _footballController.spiral();
      footballComponent = FootballRiveComponent.arc(
        _footballArtboard,
        startingYardline: startYardline,
        endingYardline: -5,
        startingSide: startSide,
        endingSide: endZone,
        screenWidth: screenWidth,
      );
    } else {
      _footballController.idleAngled();
      footballComponent = FootballRiveComponent.rushEffect(
        _footballArtboard,
        startingYardline: startYardline,
        endingYardline: -5,
        startingSide: startSide,
        endingSide: endZone,
        possession: startPossession,
        screenWidth: screenWidth,
      );
      footballComponent.flipHorizontally();
    }

    _game.add(footballComponent);

    await footballComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.safety();

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: -((endYardline - startYardline).abs().toDouble() - 5),
      side: startSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(solidLineComponent);

    await solidLineComponent.onCompleted;
  }

  void safetyFromRushOrPassLine(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final solidLineComponent = SolidLineComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: -((endYardline - startYardline).abs().toDouble() - 5),
      side: startSide,
      possession: startPossession,
    );

    solidLineComponent.y = driveComponentHeight;

    driveComponent.add(solidLineComponent);
  }

  Future<void> safetyFromSackAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await sackAnimation(incident, driveComponentHeight);

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.safety();
  }

  Future<void> fumbleFromPassAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.spiral();

    final HomeOrAway resultingStartSide = incident.start!.side!;
    final int resultingStartYardline = incident.start!.yardline!;

    final HomeOrAway endSide = incident.end!.side!;
    final HomeOrAway startSide = incident.start!.side!;
    final int endYardline = incident.end!.yardline!;
    final int startYardline = incident.start!.yardline!;

    FootballRiveComponent riveComponent;

    var (HomeOrAway resultingEndSide, int resultingEndYardline) =
        (endSide, incident.end!.yardline!);

    if (incident.start!.possession == HomeOrAway.home) {
      if ((startSide == HomeOrAway.home &&
              endSide == HomeOrAway.home &&
              startYardline > endYardline) ||
          (startSide == HomeOrAway.away &&
              endSide == HomeOrAway.away &&
              startYardline < endYardline) ||
          (startSide == HomeOrAway.away && endSide == HomeOrAway.home)) {
        riveComponent = FootballRiveComponent.fumbleFromPassWithRun(
          _footballArtboard,
          passingStartYardline: startYardline,
          rushingEndYardline: endYardline,
          passingStartSide: startSide,
          rushingEndSide: endSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          footballController: _footballController,
        );
      } else {
        final int passOffset = endSide == HomeOrAway.home ? 5 : -5;

        // ignore: unnecessary_statements
        (resultingEndSide, resultingEndYardline) = getSideAndYardlineIfPast50(
          endSide,
          incident.end!.yardline! + passOffset,
        );

        riveComponent = FootballRiveComponent.fumbleFromPass(
          _footballArtboard,
          passingStartYardline: resultingStartYardline,
          passingEndYardline: resultingEndYardline,
          passingStartSide: resultingStartSide,
          passingEndSide: resultingEndSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      }
    } else {
      if ((startSide == HomeOrAway.away &&
              endSide == HomeOrAway.away &&
              startYardline > endYardline) ||
          (startSide == HomeOrAway.home &&
              endSide == HomeOrAway.home &&
              startYardline < endYardline) ||
          (startSide == HomeOrAway.home && endSide == HomeOrAway.away)) {
        riveComponent = FootballRiveComponent.fumbleFromPassWithRun(
          _footballArtboard,
          passingStartYardline: startYardline,
          rushingEndYardline: endYardline,
          passingStartSide: startSide,
          rushingEndSide: endSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          footballController: _footballController,
        );
      } else {
        final int passOffset = endSide == HomeOrAway.away ? 5 : -5;

        // ignore: unnecessary_statements
        (resultingEndSide, resultingEndYardline) = getSideAndYardlineIfPast50(
          endSide,
          incident.end!.yardline! + passOffset,
        );

        riveComponent = FootballRiveComponent.fumbleFromPass(
          _footballArtboard,
          passingStartYardline: resultingStartYardline,
          passingEndYardline: resultingEndYardline,
          passingStartSide: resultingStartSide,
          passingEndSide: resultingEndSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      }
    }

    _game.add(riveComponent);

    await riveComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    final doubleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble(),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(doubleArc);

    await doubleArc.onCompleted;
  }

  void fumbleDashedDoubleArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final endSide = incident.end!.side!;
    final endYardline = incident.end!.yardline!;

    final doubleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble(),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
    );

    doubleArc.y = driveComponentHeight;

    driveComponent.add(doubleArc);
  }

  Future<void> fumbleFromRushAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.idleAngled();

    final HomeOrAway resultingStartSide = incident.start!.side!;
    final int resultingStartYardline = incident.start!.yardline!;

    final HomeOrAway endSide = incident.end!.side!;
    final HomeOrAway startSide = incident.start!.side!;
    final int endYardline = incident.end!.yardline!;
    final int startYardline = incident.start!.yardline!;

    FootballRiveComponent riveComponent;

    var (HomeOrAway resultingEndSide, int resultingEndYardline) =
        (endSide, incident.end!.yardline!);

    if (incident.start!.possession == HomeOrAway.home) {
      if ((startSide == HomeOrAway.home &&
              endSide == HomeOrAway.home &&
              startYardline > endYardline) ||
          (startSide == HomeOrAway.away &&
              endSide == HomeOrAway.away &&
              startYardline < endYardline) ||
          (startSide == HomeOrAway.away && endSide == HomeOrAway.home)) {
        riveComponent = FootballRiveComponent.fumbleFromRushWithRun(
          _footballArtboard,
          rushingStartYardline: startYardline,
          finalEndYardline: endYardline,
          rushingStartSide: startSide,
          finalEndSide: endSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      } else {
        final int passOffset = endSide == HomeOrAway.home ? 5 : -5;

        // ignore: unnecessary_statements
        (resultingEndSide, resultingEndYardline) = getSideAndYardlineIfPast50(
          endSide,
          incident.end!.yardline! + passOffset,
        );

        riveComponent = FootballRiveComponent.fumbleFromRush(
          _footballArtboard,
          rushingStartYardline: resultingStartYardline,
          rushingEndYardline: resultingEndYardline,
          rushingStartSide: resultingStartSide,
          rushingEndSide: resultingEndSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      }
    } else {
      if ((startSide == HomeOrAway.away &&
              endSide == HomeOrAway.away &&
              startYardline > endYardline) ||
          (startSide == HomeOrAway.home &&
              endSide == HomeOrAway.home &&
              startYardline < endYardline) ||
          (startSide == HomeOrAway.home && endSide == HomeOrAway.away)) {
        riveComponent = FootballRiveComponent.fumbleFromRushWithRun(
          _footballArtboard,
          rushingStartYardline: startYardline,
          finalEndYardline: endYardline,
          rushingStartSide: startSide,
          finalEndSide: endSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      } else {
        final int passOffset = endSide == HomeOrAway.away ? 5 : -5;

        // ignore: unnecessary_statements
        (resultingEndSide, resultingEndYardline) = getSideAndYardlineIfPast50(
          endSide,
          incident.end!.yardline! + passOffset,
        );

        riveComponent = FootballRiveComponent.fumbleFromRush(
          _footballArtboard,
          rushingStartYardline: resultingStartYardline,
          rushingEndYardline: resultingEndYardline,
          rushingStartSide: resultingStartSide,
          rushingEndSide: resultingEndSide,
          possession: incident.start!.possession!,
          screenWidth: screenWidth,
          footballController: _footballController,
        );
      }
    }

    _game.add(riveComponent);

    await riveComponent.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    final doubleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble(),
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(doubleArc);

    await doubleArc.onCompleted;
  }

  Future<void> fumbleFromKickoffAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.idleVertical();

    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;
    final endSide = incident.end!.side!;
    final endYardline = incident.end!.yardline!;
    final distance =
        getYardageInBetween(startSide, startYardline, endSide, endYardline)
            .toDouble();

    final possession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;

    late HomeOrAway firstArcEndSide;
    late int firstArcEndYardline;

    // ignore: unnecessary_statements
    (firstArcEndSide, firstArcEndYardline) = getSideAndYardlineIfPast50(
      startSide,
      (startYardline + distance - 10).toInt(),
    );

    final kickoff = FootballRiveComponent.fumbleFromKickoff(
      _footballArtboard,
      footballController: _footballController,
      startingYardline: startYardline,
      endingYardline: firstArcEndYardline,
      startingSide: startSide,
      endingSide: firstArcEndSide,
      screenWidth: screenWidth,
    );

    _game.add(kickoff);

    await kickoff.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    if (distance < 15) {
      final dashedArcComponent = DashedArcComponent.combo(
        skin: _skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: startYardline.toDouble(),
        distance: (100 - startYardline + 5).toDouble(),
        side: startSide,
        possession: possession,
        shouldMoveUp: false,
        driveComponentHeight: driveComponentHeight,
      );

      final distanceFromEndzone =
          getYardageInBetween(startSide.opposite, -5, endSide, endYardline)
              .toDouble();

      final solidLineComponent = SolidLineComponent.combo(
        skin: _skin,
        yardline: -5,
        distance: distanceFromEndzone,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: endPossession.opposite,
        possession: endPossession,
        driveComponentHeight: driveComponentHeight,
        shouldMoveUp: false,
        bottomPadding: 0,
      );

      driveComponent.add(dashedArcComponent);
      driveComponent.add(solidLineComponent);

      await Future.wait(
        [dashedArcComponent.onCompleted, solidLineComponent.onCompleted],
      );
    } else {
      final dashedArc = DashedArcComponent.combo(
        skin: _skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: startYardline.toDouble(),
        distance: distance - 12,
        side: startSide,
        possession: incident.start!.possession!,
        shouldMoveUp: false,
        driveComponentHeight: driveComponentHeight,
      );

      final fumbleArc = DashedDoubleArcComponent.fumble(
        skin: _skin,
        yardline: startYardline + distance - 2,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: startSide,
        netYards: 10,
        shouldMoveUp: false,
        paint: BasicPalette.white.paint(),
        driveComponentHeight: driveComponentHeight,
      );

      final solidLineComponent = SolidLineComponent.combo(
        skin: _skin,
        yardline: startYardline + distance - 2,
        distance: -2,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: startSide,
        possession: startSide,
        driveComponentHeight: driveComponentHeight,
        arrowHeadType: ArrowHeadType.arrow,
        shouldMoveUp: false,
        bottomPadding: 10,
      );

      driveComponent.add(dashedArc);
      driveComponent.add(fumbleArc);
      driveComponent.add(solidLineComponent);

      await Future.wait([
        dashedArc.onCompleted,
        fumbleArc.onCompleted,
        solidLineComponent.onCompleted,
      ]);
    }
  }

  Future<void> fumbleFromPuntAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    _footballController.idleVertical();

    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;
    final endSide = incident.end!.side!;
    final endYardline = incident.end!.yardline!;

    final punt = FootballRiveComponent.fumbleFromPunt(
      _footballArtboard,
      footballController: _footballController,
      startingYardline: startYardline,
      endingYardline: endYardline,
      startingSide: startSide,
      endingSide: endSide,
      screenWidth: screenWidth,
    );

    _game.add(punt);
    await punt.onCompleted;

    setTransitionOverlayColor(incident);
    await _transitionOverlaysController.fumble();

    final dashedArc = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance:
          getYardageInBetween(startSide, startYardline, endSide, endYardline)
              .toDouble(),
      side: startSide,
      possession: incident.start!.possession!,
      arrowHeadType: ArrowHeadType.arrow,
      delay: 2,
      driveComponentHeight: driveComponentHeight,
    );

    final fumbleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble() + 10,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      delay: 2,
      driveComponentHeight: driveComponentHeight,
    );

    driveComponent.add(dashedArc);
    driveComponent.add(fumbleArc);

    await Future.wait([dashedArc.onCompleted, fumbleArc.onCompleted]);
  }

  Future<void> defensiveTwoPointAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;

    final starSprite = StarSprite();

    _footballController.spiral();
    final ballAnimation = FootballRiveComponent.defensiveTwoPoint(
      _footballArtboard,
      startingYardline: startYardline,
      startingSide: startSide,
      footballController: _footballController,
      starSprite: starSprite,
      screenWidth: screenWidth,
    );

    _game.add(ballAnimation);
    _game.add(starSprite);
    await ballAnimation.onCompleted;
  }

  void setTransitionOverlayColor(FootballMatchIncidentModel incident) {
    HomeOrAway possession;

    possession = incident.event.isUseEndPossessionEvents
        ? incident.end!.possession!
        : incident.start!.possession!;

    final primaryColor = (possession == HomeOrAway.home)
        ? _homeTeam.primaryColor
        : _awayTeam.primaryColor;

    final secondaryColor = (possession == HomeOrAway.home)
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    if (incident.event.isUseFieldColorEvents) {
      _transitionOverlaysController.setColor(
        footballFieldColor,
        footballFieldColor,
      );
    } else {
      _transitionOverlaysController.setColor(primaryColor, secondaryColor);
    }
  }

  Future<void> previousPlayUnderReviewAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await _transitionOverlaysController.previousPlayUnderReview();
  }

  Future<void> previousPlayStandsAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await _transitionOverlaysController.previousPlayStands();
  }

  Future<void> previousPlayOverturnedAnimation(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) async {
    await _transitionOverlaysController.previousPlayOverturned();
  }

  void fumbleFromKickoffArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startYardline = incident.start!.yardline!;
    final endSide = incident.end!.side!;
    final endYardline = incident.end!.yardline!;
    final distance =
        getYardageInBetween(startSide, startYardline, endSide, endYardline)
            .toDouble();
    final possession = incident.start!.possession!;
    final endPossession = incident.end!.possession!;

    if (distance < 15) {
      final dashedArcComponent = DashedArcComponent.combo(
        skin: _skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: startYardline.toDouble(),
        distance: (100 - startYardline + 5).toDouble(),
        side: startSide,
        possession: possession,
        shouldMoveUp: false,
        driveComponentHeight: driveComponentHeight,
      );

      final distanceFromEndzone =
          getYardageInBetween(startSide.opposite, -5, endSide, endYardline)
              .toDouble();

      final solidLineComponent = SolidLineComponent.combo(
        skin: _skin,
        yardline: -5,
        distance: distanceFromEndzone,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: endPossession.opposite,
        possession: endPossession,
        driveComponentHeight: driveComponentHeight,
        shouldMoveUp: false,
        bottomPadding: 0,
      );

      driveComponent.add(dashedArcComponent);
      driveComponent.add(solidLineComponent);
    } else {
      final dashedArc = DashedArcComponent.combo(
        skin: _skin,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        yardline: startYardline.toDouble(),
        distance: distance - 12,
        side: startSide,
        possession: incident.start!.possession!,
        shouldMoveUp: false,
        driveComponentHeight: driveComponentHeight,
      );

      final fumbleArc = DashedDoubleArcComponent.fumble(
        skin: _skin,
        yardline: startYardline + distance - 2,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: startSide,
        netYards: 10,
        paint: BasicPalette.white.paint(),
        shouldMoveUp: false,
        driveComponentHeight: driveComponentHeight,
      );

      final solidLineComponent = SolidLineComponent.combo(
        skin: _skin,
        yardline: startYardline + distance - 2,
        distance: -2,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        side: startSide,
        possession: startSide,
        driveComponentHeight: driveComponentHeight,
        arrowHeadType: ArrowHeadType.arrow,
        shouldMoveUp: false,
        bottomPadding: 10,
      );

      driveComponent.add(dashedArc);
      driveComponent.add(fumbleArc);
      driveComponent.add(solidLineComponent);
    }
  }

  void safetyFromKickoffArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final startPossession = incident.start!.possession!;
    final endZone = incident.end!.possession!;
    final startYardline = incident.start!.yardline!;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 2).toDouble(),
      side: startSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -2,
      distance: -3,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endZone,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      arrowHeadType: ArrowHeadType.arrow,
      shouldMoveUp: false,
      bottomPadding: 0,
    );

    driveComponent.add(solidLineComponent);
    driveComponent.add(dashedArcComponent);
  }

  void kickoffWithTouchbackArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final int distance = 105 - startYardline;

    final dashedArcComponent = DashedArcComponent.regular(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: distance.toDouble(),
      side: startSide,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      arrowHeadType: ArrowHeadType.arrow,
    );

    driveComponent.add(dashedArcComponent);
  }

  void touchdownFromKickoffArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 5).toDouble(),
      side: startSide,
      possession: possession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -5,
      distance: 110,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startSide.opposite,
      possession: possession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      bottomPadding: 12,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  void onsideKickSucceedsArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final endingYardline = incident.end!.yardline!;
    final startingSide = incident.start!.side!;
    final endingSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startingYardline = incident.start!.yardline!;

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endingSide,
      endingYardline,
    ).toDouble();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance - 2,
      side: startingSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    late HomeOrAway solidLineSide;
    late int solidLineYardline;

    // ignore: unnecessary_statements
    (solidLineSide, solidLineYardline) =
        getSideAndYardlineIfPast50(startingSide, endingYardline - 2);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: solidLineYardline.toDouble(),
      distance: -2,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: solidLineSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      arrowHeadType: ArrowHeadType.arrow,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  void onsideKickFailsArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final endingYardline = incident.end!.yardline!;
    final startingSide = incident.start!.side!;
    final endingSide = incident.end!.side!;
    final startPossession = incident.start!.possession!;
    final startingYardline = incident.start!.yardline!;

    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endingSide,
      endingYardline,
    ).toDouble();

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance + 2,
      side: startingSide,
      possession: startPossession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    late HomeOrAway solidLineSide;
    late int solidLineYardline;

    // ignore: unnecessary_statements
    (solidLineSide, solidLineYardline) =
        getSideAndYardlineIfPast50(startingSide, endingYardline + 2);

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: solidLineYardline.toDouble(),
      distance: 2,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: solidLineSide,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      shouldMoveUp: false,
      arrowHeadType: ArrowHeadType.arrow,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  void kickoffReturnArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final endSide = incident.end!.side!;
    final startSide = incident.start!.side!;
    final possession = incident.start!.possession!;
    final startYardline = incident.start!.yardline!;
    final endYardline = incident.end!.yardline!;

    final dashedArcComponent = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startYardline.toDouble(),
      distance: (100 - startYardline + 5).toDouble(),
      side: startSide,
      possession: possession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final distanceFromEndzone =
        getYardageInBetween(startSide.opposite, -5, endSide, endYardline)
            .toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: -5,
      distance: distanceFromEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startSide.opposite,
      possession: possession,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
      bottomPadding: 0,
    );

    driveComponent.add(dashedArcComponent);
    driveComponent.add(solidLineComponent);
  }

  void touchdownFromReturnedFieldGoalArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final endingSide = incident.start!.possession!.opposite;
    final startPossession = incident.start!.possession!;

    final startingSide = incident.start!.side!;

    final solidArc = SolidArcComponent.cross(
      skin: _skin,
      distance: 0,
      screenWidth: screenWidth,
      yardline: incident.start!.yardline!.toDouble(),
      side: incident.start!.side!,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    final distanceFromEndzone =
        getYardageInBetween(startingSide.opposite, -5, endingSide, -5)
            .toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: distanceFromEndzone - 5,
      distance: distanceFromEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: startingSide.opposite,
      possession: startPossession,
      driveComponentHeight: driveComponentHeight,
      bottomPadding: 36,
    );

    driveComponent.add(solidArc);
    driveComponent.add(solidLineComponent);
  }

  void touchdownFromFumbledPuntArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startingYardline = incident.start!.yardline!;
    final startingSide = incident.start!.side!;
    final endYardline = incident.end!.yardline!;
    final endSide = incident.end!.side!;
    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endSide,
      endYardline,
    ).toDouble();

    final dashedArc = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance,
      side: startingSide,
      possession: incident.start!.possession!,
      driveComponentHeight: driveComponentHeight,
    );

    final fumbleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble() + 12,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      paint: BasicPalette.white.paint(),
      driveComponentHeight: driveComponentHeight + 16,
    );

    final distanceToEndzone =
        getYardageInBetween(endSide, endYardline + 12, endSide, -5).toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endYardline.toDouble() + 14,
      distance: distanceToEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      possession: endSide,
      driveComponentHeight: driveComponentHeight,
      extraPaddingForMoveUpDistance: 18,
      bottomPadding: 7,
    );

    driveComponent.add(dashedArc);
    driveComponent.add(fumbleArc);
    driveComponent.add(solidLineComponent);
  }

  void touchdownFromFumbledKickoffArc(
    FootballMatchIncidentModel incident,
    double driveComponentHeight,
  ) {
    final startingYardline = incident.start!.yardline!;
    final startingSide = incident.start!.side!;
    final endYardline = incident.end!.yardline!;
    final endSide = incident.end!.side!;
    final distance = getYardageInBetween(
      startingSide,
      startingYardline,
      endSide,
      endYardline,
    ).toDouble();

    final dashedArc = DashedArcComponent.combo(
      skin: _skin,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      yardline: startingYardline.toDouble(),
      distance: distance,
      side: startingSide,
      possession: incident.start!.possession!,
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight,
    );

    final fumbleArc = DashedDoubleArcComponent.fumble(
      skin: _skin,
      yardline: endYardline.toDouble() + 12,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      netYards: 10,
      paint: BasicPalette.white.paint(),
      shouldMoveUp: false,
      driveComponentHeight: driveComponentHeight + 16,
    );

    final distanceToEndzone =
        getYardageInBetween(endSide, endYardline + 12, endSide, -5).toDouble();

    final solidLineComponent = SolidLineComponent.combo(
      skin: _skin,
      yardline: endYardline.toDouble() + 14,
      distance: distanceToEndzone,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      side: endSide,
      possession: endSide,
      driveComponentHeight: driveComponentHeight,
      extraPaddingForMoveUpDistance: 18,
      shouldMoveUp: false,
      bottomPadding: 7,
    );

    driveComponent.add(dashedArc);
    driveComponent.add(fumbleArc);
    driveComponent.add(solidLineComponent);
  }

  Map<FootballMatchIncidentEventType, FootballPlayAnimationCallback>
      get footballIncidentsToAnimationMap => {
            FootballMatchIncidentEventType.coinToss: coinTossAnimation,
            FootballMatchIncidentEventType.fieldGoalMade:
                fieldGoalMadeAnimation,
            FootballMatchIncidentEventType.fieldGoalMissed:
                fieldGoalMissedAnimation,
            FootballMatchIncidentEventType.extraPointMade:
                fieldGoalMadeAnimation,
            FootballMatchIncidentEventType.extraPointMissed:
                fieldGoalMissedAnimation,
            FootballMatchIncidentEventType.fumbleFromPass:
                fumbleFromPassAnimation,
            FootballMatchIncidentEventType.fumbleFromRush:
                fumbleFromRushAnimation,
            FootballMatchIncidentEventType.fumbleFromKickoff:
                fumbleFromKickoffAnimation,
            FootballMatchIncidentEventType.fumbleFromPunt:
                fumbleFromPuntAnimation,
            FootballMatchIncidentEventType.kickoffReturn:
                kickoffReturnAnimation,
            FootballMatchIncidentEventType.kickoffWithTouchback:
                kickoffWithTouchbackAnimation,
            FootballMatchIncidentEventType.sack: sackAnimation,
            FootballMatchIncidentEventType.doubleTurnover:
                doubleTurnoverAnimation,
            FootballMatchIncidentEventType.interception: interceptionAnimation,
            FootballMatchIncidentEventType.passIncomplete:
                passIncompleteAnimation,
            FootballMatchIncidentEventType.passThatGainsYards: passAnimation,
            FootballMatchIncidentEventType.passThatLosesYards: passAnimation,
            FootballMatchIncidentEventType.passThatResultedInAFirstDown:
                passAnimation,
            FootballMatchIncidentEventType.passThatResultedInATurnover:
                passAnimation,
            FootballMatchIncidentEventType.postSnapFlag: penaltyAnimation,
            FootballMatchIncidentEventType.preSnapFlag: penaltyAnimation,
            FootballMatchIncidentEventType.puntBlocked: puntBlockedAnimation,
            FootballMatchIncidentEventType.puntFairCatch: puntAnimation,
            FootballMatchIncidentEventType.puntReturn: puntAnimation,
            FootballMatchIncidentEventType.puntTouchback: puntAnimation,
            FootballMatchIncidentEventType.rushThatGainsYards: rushAnimation,
            FootballMatchIncidentEventType.rushThatLosesYards: rushAnimation,
            FootballMatchIncidentEventType.rushThatResultedInAFirstDown:
                rushAnimation,
            FootballMatchIncidentEventType.rushThatResultedInATurnover:
                rushAnimation,
            FootballMatchIncidentEventType.touchdownFromBlockedPunt:
                touchdownFromBlockedPuntAnimation,
            FootballMatchIncidentEventType.touchdownFromPass:
                touchdownFromPassAnimation,
            FootballMatchIncidentEventType.touchdownFromPickSix:
                touchdownFromPickSixAnimation,
            FootballMatchIncidentEventType.touchdownFromKickoff:
                touchdownFromKickoffAnimation,
            FootballMatchIncidentEventType.touchdownFromPunt:
                touchdownFromPuntAnimation,
            FootballMatchIncidentEventType.touchdownFromRush:
                touchdownFromRushAnimation,
            FootballMatchIncidentEventType.touchdownFromScoopAndScore:
                touchdownFromScoopAndScoreAnimation,
            FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal:
                touchdownFromReturnedFieldGoalAnimation,
            FootballMatchIncidentEventType.touchdownFromFumbledPunt:
                touchdownFromFumbledPuntAnimation,
            FootballMatchIncidentEventType.touchdownFromFumbledKickoff:
                touchdownFromFumbledKickoffAnimation,
            FootballMatchIncidentEventType.safetyFromBlockedPunt:
                safetyFromBlockedPuntAnimation,
            FootballMatchIncidentEventType.twoPointConversionMade:
                twoPointConversionAnimation,
            FootballMatchIncidentEventType.twoPointConversionMissed:
                twoPointConversionAnimation,
            FootballMatchIncidentEventType.safetyFromKickoff:
                safetyFromKickoffAnimation,
            FootballMatchIncidentEventType.safetyFromPunt:
                safetyFromPuntAnimation,
            FootballMatchIncidentEventType.safetyFromPass:
                safetyFromRushOrPassAnimation,
            FootballMatchIncidentEventType.safetyFromRush:
                safetyFromRushOrPassAnimation,
            FootballMatchIncidentEventType.safetyFromSack:
                safetyFromSackAnimation,
            FootballMatchIncidentEventType.driveStarted: driveStartedAnimation,
            FootballMatchIncidentEventType.driveEnded: driveEndedAnimation,
            FootballMatchIncidentEventType.timeout: timeoutAnimation,
            FootballMatchIncidentEventType.periodEnd: periodEndAnimation,
            FootballMatchIncidentEventType.awaitingOt: awaitinOtAnimation,
            FootballMatchIncidentEventType.onsideKickSucceeds:
                onsideKickSucceedsAnimation,
            FootballMatchIncidentEventType.onsideKickFails:
                onsideKickFailsAnimation,
            FootballMatchIncidentEventType.defensiveTwoPoint:
                defensiveTwoPointAnimation,
            FootballMatchIncidentEventType.previousPlayUnderReview:
                previousPlayUnderReviewAnimation,
            FootballMatchIncidentEventType.previousPlayStands:
                previousPlayStandsAnimation,
            FootballMatchIncidentEventType.previousPlayOverturned:
                previousPlayOverturnedAnimation,
          };
}
