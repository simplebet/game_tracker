import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/distance_between_rectangle_component.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/down_line_component_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/football_tracker_flame_game_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/flame_skewed_view/play_ribbon_component_minimized.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/state_notifier/transition_overlays_minimized_notifier.dart';
import 'package:game_tracker/ui/football_tracker/state_nofitifiers/last_play_tray_state_notifier.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/team_color.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:rive/rive.dart';

typedef FootballPlayAnimationMinimizedCallback = Future<void> Function(
  FootballMatchIncidentModel incident,
);

class FootballAnimationSequenceMinimized {
  FootballAnimationSequenceMinimized();

  late GameTrackerSkin _skin;
  late TeamModel _awayTeam;
  late TeamModel _homeTeam;
  late FootballTrackerFlameGameMinimized _game;
  late Artboard _artboard;
  late TransitionOverlaysMinimizedNotifier _transitionOverlaysStateNotifier;
  late LastPlayTrayStateNotifier _lastPlayTrayStateNotifier;

  void init(
    FootballTrackerFlameGameMinimized game, {
    required GameTrackerSkin skin,
    required TeamModel awayTeam,
    required TeamModel homeTeam,
    required Artboard artboard,
    required TransitionOverlaysMinimizedNotifier
        transitionOverlaysStateNotifier,
    required LastPlayTrayStateNotifier lastPlayTrayStateNotifier,
  }) {
    _skin = skin;
    _awayTeam = awayTeam;
    _homeTeam = homeTeam;
    _artboard = artboard;
    _game = game;
    _transitionOverlaysStateNotifier = transitionOverlaysStateNotifier;
    _lastPlayTrayStateNotifier = lastPlayTrayStateNotifier;
  }

  double get screenWidth => _game.screenWidth;
  double get screenHeight => _game.screenHeight;

  Color getTeamColorByPossession(HomeOrAway? possession) {
    if (possession == null) {
      return Colors.transparent;
    }

    return possession == HomeOrAway.home
        ? _homeTeam.primaryColor
        : _awayTeam.primaryColor;
  }

  Future<void> renderUpcomingIncidents(
    FootballMatchIncidentModel incident,
  ) async {
    /// clear the Components from last incident
    await clearCourt();

    /// update last play tray
    if (incident.event.isDelayingEvents) {
      Future.delayed(const Duration(seconds: 5), () {
        _lastPlayTrayStateNotifier.updateLastPlayTray(incident);
      });
    } else {
      _lastPlayTrayStateNotifier.updateLastPlayTray(incident);
    }

    /// render the down line and incident start arrow
    await renderIncidentStart(incident);

    try {
      /// clear previous incident element on the court
      /// because for some incidents we are persisting showing arrows
      final incidentMap =
          footballIncidentsToAnimationMapMinimized[incident.event];

      if (incidentMap != null) {
        if (incident.event.isDelayingEvents) {
          Future.delayed(const Duration(seconds: 5), () async {
            await incidentMap(incident);
          });
        } else {
          await incidentMap(incident);
        }
      }
    } catch (e) {
      throw Exception('Unknown football event');
    }
  }

  Future<void> clearCourt() async {
    await Future.delayed(const Duration(milliseconds: 200), () async {
      _game.removeWhere(
        (component) =>
            component is PlayRibbonComponentMinimized ||
            component is DownLineComponentMinimized ||
            component is DistanceBetweenRectangleComponent,
      );
    });
  }

  Future<void> renderIncidentStart(
    FootballMatchIncidentModel incident,
  ) async {
    if (incident.event.isIncidentStartArrowHidden) {
      return;
    }

    final startSide = incident.start!.side ?? HomeOrAway.none;
    final possession = incident.start!.possession ?? HomeOrAway.none;
    final distance = incident.start?.distance?.toDouble() ?? 0;
    final startYardline = incident.start?.yardline?.toDouble() ?? 0;
    final isPossessionSameAsSide = startSide == possession;
    final endLinePosition = isPossessionSameAsSide
        ? startYardline + distance
        : startYardline - distance;
    final yardlineLabel = startYardline > 50
        ? (100 - startYardline.toInt()).toString()
        : startYardline.toString();
    final isCFB = incident.league?.isCFB ?? false;
    final awayTeamShortName = isCFB
        ? _awayTeam.footballFieldName.formattedTeamName()
        : _awayTeam.abbrv.formattedTeamName();
    final homeTeamShortName = isCFB
        ? _homeTeam.footballFieldName.formattedTeamName()
        : _homeTeam.abbrv.formattedTeamName();
    final sideTeamAbbrv =
        (startSide == HomeOrAway.away ? awayTeamShortName : homeTeamShortName)
            .toUpperCase();

    final showDownLines = !incident.event.isDownLinesHidden;

    if (showDownLines) {
      final startDownLine = DownLineComponentMinimized.start(
        skin: _skin,
        yardline: startYardline,
        screenWidth: screenWidth,
        side: startSide,
        distanceBetween: distance,
        isHomePossession: possession == HomeOrAway.home,
      );

      final endDownLine = DownLineComponentMinimized.end(
        skin: _skin,
        screenWidth: screenWidth,
        yardline: endLinePosition,
        side: startSide,
      );

      _game
        ..add(startDownLine)
        ..add(endDownLine);
    }

    final playRibbonText = setPlayRibbonText(incident.event, yardlineLabel);
    final teamAbbrv = (incident.event.isExtraPointEvents ||
            incident.event.isTwoPointsConversionEvents ||
            incident.event.isFieldGoalEvents ||
            incident.event.isKickoffEvents ||
            incident.event ==
                FootballMatchIncidentEventType.touchdownFromReturnedFieldGoal)
        ? null
        : sideTeamAbbrv;

    final playStartArrow = PlayRibbonComponentMinimized(
      yardline: incident.start!.yardline ?? 0,
      text: playRibbonText,
      teamAbbreviation: teamAbbrv,
      side: startSide,
      color: possession == HomeOrAway.away
          ? _awayTeam.primaryColor
          : _homeTeam.primaryColor,
      direction: incident.start?.possession?.opposite ?? HomeOrAway.none,
      skin: _skin,
    );

    _game.add(playStartArrow);

    await playStartArrow.onCompleted;
  }

  void renderIncidentEnd(FootballMatchIncidentModel incident) {
    /// list of incidents we don't show incident end arrow
    if (incident.event.isIncidentEndArrowHidden) {
      return;
    }

    /// end of play arrow/line logic
    final endSide = incident.end!.side!;
    final endPossession = incident.end!.possession!;
    final distance = incident.end!.distance!.toDouble();
    final isPossessionSameAsSide = endSide == endPossession;
    final endYardline = incident.end!.yardline!;
    final endLinePosition = isPossessionSameAsSide
        ? endYardline + distance
        : endYardline - distance;

    final startDownLine = DownLineComponentMinimized.start(
      skin: _skin,
      yardline: endYardline.toDouble(),
      side: endSide,
      distanceBetween: distance,
      screenWidth: screenWidth,
      isHomePossession: endPossession == HomeOrAway.home,
      isEnd: true,
    );
    final endDownLine = DownLineComponentMinimized.end(
      skin: _skin,
      yardline: endLinePosition,
      screenWidth: screenWidth,
      side: endSide,
      isEnd: true,
    );

    _game
      ..add(startDownLine)
      ..add(endDownLine);

    final isCFB = incident.league?.isCFB ?? false;
    final awayTeamShortName = isCFB
        ? _awayTeam.footballFieldName.formattedTeamName()
        : _awayTeam.abbrv.formattedTeamName();
    final homeTeamShortName = isCFB
        ? _homeTeam.footballFieldName.formattedTeamName()
        : _homeTeam.abbrv.formattedTeamName();
    final sideTeamAbbrv =
        (endSide == HomeOrAway.away ? awayTeamShortName : homeTeamShortName)
            .toUpperCase();
    final teamColor = endPossession == HomeOrAway.away
        ? _awayTeam.primaryColor
        : _homeTeam.primaryColor;

    final playStartArrow = PlayRibbonComponentMinimized(
      yardline: endYardline,
      text: endYardline.toString(),
      teamAbbreviation: sideTeamAbbrv,
      side: endSide,
      color: teamColor,
      direction: incident.end!.possession!.opposite,
      skin: _skin,
      isEnd: true,
    );

    _game.add(playStartArrow);
  }

  Future<void> rushAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('RUSH');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerRush();
    _transitionOverlaysStateNotifier.hideOverlay();
    renderIncidentEnd(incident);
  }

  Future<void> fumbleFromRushAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    setRunPass('RUSH');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    await _transitionOverlaysStateNotifier.triggerRush();
    await _transitionOverlaysStateNotifier.triggerFumble();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromRushAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('RUSH');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerRush();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> rushThatResultedInATurnoverAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    setRunPass('RUSH');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    await _transitionOverlaysStateNotifier.triggerRush();
    await _transitionOverlaysStateNotifier.triggerTurnoverOnDowns();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> passAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('PASS');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '0');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPass();
    _transitionOverlaysStateNotifier.hideOverlay();
    renderIncidentEnd(incident);
  }

  Future<void> fumbleFromPassAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('PASS');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPass();
    await _transitionOverlaysStateNotifier.triggerFumble();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromPassAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('PASS');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPass();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> passThatResultedInATurnoverAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('PASS');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPass();
    await _transitionOverlaysStateNotifier.triggerTurnoverOnDowns();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> passIncompleteAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPassIncomplete();
    _transitionOverlaysStateNotifier.hideOverlay();
    renderIncidentEnd(incident);
  }

  Future<void> sackAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerSack();
    _transitionOverlaysStateNotifier.hideOverlay();
    renderIncidentEnd(incident);
  }

  Future<void> fieldGoalMadeAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerFieldGoalMade();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> fieldGoalMissedAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerFieldGoalMissed();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> extraPointMadeAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerExtraPointMade();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> extraPointMissedAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerExtraPointMissed();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> twoPointConversionMadeAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerTwoPointConversion();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> twoPointConversionMissedAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerTwoPointConversionFailed();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> interceptionAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerInterception();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> penaltyAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerFlag();
    _transitionOverlaysStateNotifier.hideOverlay();
    renderIncidentEnd(incident);
  }

  Future<void> timeoutAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerTimeout();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> awaitingOtAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerOvertime();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> periodEndAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    if (incident.isHalfTime) {
      await _transitionOverlaysStateNotifier.triggerHalftime();
    } else {
      await _transitionOverlaysStateNotifier.triggerQuarterEnd();
    }
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> kickoffWithTouchbackAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerKickoff();
    await _transitionOverlaysStateNotifier.triggerTouchback();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> coinTossAnimation(FootballMatchIncidentModel incident) async {
    final homeTeamWonCoinToss = incident.coinTossWinner == HomeOrAway.home;

    _transitionOverlaysStateNotifier.showOverlay();
    setCoinTossText(
      (homeTeamWonCoinToss ? _homeTeam.abbrv : _awayTeam.abbrv) ?? '',
    );
    await setCoinTossColor(
      homeTeamWonCoinToss ? _homeTeam.primaryColor : _awayTeam.primaryColor,
    );
    await _transitionOverlaysStateNotifier.triggerCoinFlip();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> previousPlayOverturnedAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerCallOverturned();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> previousPlayStandsAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPlayStands();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> previousPlayUnderReviewAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerUnderReview();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromFumbledKickoffAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerKickoff();
    await _transitionOverlaysStateNotifier.triggerFumble();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromKickoffAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPuntBlocked();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromReturnedFieldGoalAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerFieldGoalMissed();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromBlockedPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPuntBlocked();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromFumbledPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    await _transitionOverlaysStateNotifier.triggerFumble();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromScoopAndScoreAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerFumble();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> touchdownFromPickSixAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerInterception();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerTouchdown();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> fumbleFromPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    await _transitionOverlaysStateNotifier.triggerFumble();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> fumbleFromKickoffAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerKickoff();
    await _transitionOverlaysStateNotifier.triggerFumble();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> puntAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> puntFairCatchAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    await _transitionOverlaysStateNotifier.triggerFairCatch();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> puntTouchbackAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    await _transitionOverlaysStateNotifier.triggerTouchback();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> kickoffReturnAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerKickoff();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromRushAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('RUSH');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerRush();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromPassAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setRunPass('PASS');
    setRunPassYardText(incident.meta?.netYards.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerPass();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromSackAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSack();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPunt();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromBlockedPuntAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPuntBlocked();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> safetyFromKickoffAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerKickoff();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerSafety();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> defensiveTwoPointAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.end?.possession));
    await _transitionOverlaysStateNotifier.triggerDefensiveTwoPoint();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> onsideKickSucceedsAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerOnsideKick();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> onsideKickFailsAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerOnsideKickFail();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> puntBlockedAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerPuntBlocked();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> driveStartedAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    final String teamName = incident.start?.side == HomeOrAway.away
        ? _awayTeam.abbrv ?? ''
        : _homeTeam.abbrv ?? '';
    setDriveStartText(teamName, incident.start?.yardline.toString() ?? '');
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerDriveStart();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> driveEndedAnimation(FootballMatchIncidentModel incident) async {
    _transitionOverlaysStateNotifier.showOverlay();
    setBackgroundColor(getTeamColorByPossession(incident.start?.possession));
    await _transitionOverlaysStateNotifier.triggerDriveEnd();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  Future<void> doubleTurnoverAnimation(
    FootballMatchIncidentModel incident,
  ) async {
    _transitionOverlaysStateNotifier.showOverlay();
    await _transitionOverlaysStateNotifier.triggerDoubleTurnover();
    _transitionOverlaysStateNotifier.hideOverlay();
  }

  void setCoinTossText(String teamTricode) {
    final tricodeText = _artboard.component<TextValueRun>('Tricode');
    tricodeText?.text = '$teamTricode RECEIVES';
  }

  void setRunPassYardText(String yards) {
    final tricodeText = _artboard.component<TextValueRun>('YardGain');
    tricodeText?.text =
        int.parse(yards) < 0 ? '$yards YD LOSS' : '$yards YD GAIN';
  }

  void setRunPass(String text) {
    final rushPassText = _artboard.component<TextValueRun>('RushPass');
    rushPassText?.text = text;
  }

  void setDriveStartText(String teamName, String yards) {
    final tricodeText = _artboard.component<TextValueRun>('DriveStartYard');
    tricodeText?.text = 'DRIVE START AT $teamName $yards';
  }

  void setBackgroundColor(Color color) {
    final double renderOpacity = color == Colors.transparent ? 0 : 1;

    _artboard.forEachComponent((component) {
      if (component is Shape &&
          (component.name == 'Background' ||
              component.name == 'BackgroundL' ||
              component.name == 'BackgroundR')) {
        component.fills.first.renderOpacity = renderOpacity;
        component.fills.first.paint.color = color;
      }
    });
  }

  Future<void> setCoinTossColor(Color color) async {
    await Future.delayed(const Duration(seconds: 3));

    final double renderOpacity = color == Colors.transparent ? 0 : 1;

    _artboard.forEachComponent((component) {
      if (component is Shape && component.name == 'Background') {
        component.fills.first.renderOpacity = renderOpacity;
        component.fills.first.paint.color = color;
      }
    });
  }

  Map<FootballMatchIncidentEventType, FootballPlayAnimationMinimizedCallback>
      get footballIncidentsToAnimationMapMinimized => {
            FootballMatchIncidentEventType.coinToss: coinTossAnimation,
            FootballMatchIncidentEventType.fieldGoalMade:
                fieldGoalMadeAnimation,
            FootballMatchIncidentEventType.fieldGoalMissed:
                fieldGoalMissedAnimation,
            FootballMatchIncidentEventType.extraPointMade:
                extraPointMadeAnimation,
            FootballMatchIncidentEventType.extraPointMissed:
                extraPointMissedAnimation,
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
                passThatResultedInATurnoverAnimation,
            FootballMatchIncidentEventType.postSnapFlag: penaltyAnimation,
            FootballMatchIncidentEventType.preSnapFlag: penaltyAnimation,
            FootballMatchIncidentEventType.puntBlocked: puntBlockedAnimation,
            FootballMatchIncidentEventType.puntFairCatch:
                puntFairCatchAnimation,
            FootballMatchIncidentEventType.puntReturn: puntAnimation,
            FootballMatchIncidentEventType.puntTouchback:
                puntTouchbackAnimation,
            FootballMatchIncidentEventType.rushThatGainsYards: rushAnimation,
            FootballMatchIncidentEventType.rushThatLosesYards: rushAnimation,
            FootballMatchIncidentEventType.rushThatResultedInAFirstDown:
                rushAnimation,
            FootballMatchIncidentEventType.rushThatResultedInATurnover:
                rushThatResultedInATurnoverAnimation,
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
                twoPointConversionMadeAnimation,
            FootballMatchIncidentEventType.twoPointConversionMissed:
                twoPointConversionMissedAnimation,
            FootballMatchIncidentEventType.safetyFromKickoff:
                safetyFromKickoffAnimation,
            FootballMatchIncidentEventType.safetyFromPunt:
                safetyFromPuntAnimation,
            FootballMatchIncidentEventType.safetyFromPass:
                safetyFromPassAnimation,
            FootballMatchIncidentEventType.safetyFromRush:
                safetyFromRushAnimation,
            FootballMatchIncidentEventType.safetyFromSack:
                safetyFromSackAnimation,
            FootballMatchIncidentEventType.driveStarted: driveStartedAnimation,
            FootballMatchIncidentEventType.driveEnded: driveEndedAnimation,
            FootballMatchIncidentEventType.timeout: timeoutAnimation,
            FootballMatchIncidentEventType.periodEnd: periodEndAnimation,
            FootballMatchIncidentEventType.awaitingOt: awaitingOtAnimation,
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
