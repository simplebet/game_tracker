import 'dart:async';

import 'package:flutter/material.dart';

import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';
import 'package:utils/utils.dart';

import '../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../shared/constants.dart';
import '../notifiers/backboard_state_notifier.dart';
import '../notifiers/ball_movement_state_notifier.dart';
import '../notifiers/court_overlay_state_notifier.dart';
import '../notifiers/court_state_notifier.dart';
import '../notifiers/field_goal_state_notifier.dart';
import '../notifiers/free_throw_state_notifier.dart';
import '../notifiers/possession_arrow_state_notifier.dart';
import '../notifiers/slide_in_arrow_state_notifier.dart';

final animationSequenceProvider =
    Provider.autoDispose<BasketballAnimationSequenceController>((ref) {
  final courtState = ref.watch(courtStateProvider);

  final fieldGoalStateNotifier = ref.read(fieldGoalStateProvider.notifier);
  final courtStateNotifier = ref.read(courtStateProvider.notifier);
  final possessionArrowStateNotifier =
      ref.read(possessionArrowStateProvider.notifier);
  final courtOverlayStateNotifier =
      ref.read(courtOverlayStateProvider.notifier);
  final ballMovementstateNotifer = ref.read(ballMovementStateProvider.notifier);
  final slideInArrowStateNotifier =
      ref.read(slideInArrowStateProvider.notifier);
  final backboardStateNotifier = ref.read(backboardStateProvider.notifier);
  final freeThrowStateNotifier = ref.read(freeThrowStateProvider.notifier);

  return BasketballAnimationSequenceController(
    fieldGoalStateNotifier: fieldGoalStateNotifier,
    courtStateNotifier: courtStateNotifier,
    possessionArrowStateNotifier: possessionArrowStateNotifier,
    courtOverlayStateNotifier: courtOverlayStateNotifier,
    courtState: courtState,
    ballMovementStateNotifier: ballMovementstateNotifer,
    slideInArrowStateNotifier: slideInArrowStateNotifier,
    backboardStateNotifier: backboardStateNotifier,
    freeThrowStateNotifier: freeThrowStateNotifier,
  );
});

class BasketballAnimationSequenceController {
  BasketballAnimationSequenceController({
    required FieldGoalStateNotifier fieldGoalStateNotifier,
    required CourtStateNotifier courtStateNotifier,
    required CourtOverlayStateNotifier courtOverlayStateNotifier,
    required PossessionArrowStateNotifier possessionArrowStateNotifier,
    required CourtState courtState,
    required BallMovementStateNotifier ballMovementStateNotifier,
    required SlideInArrowStateNotifier slideInArrowStateNotifier,
    required BackboardStateNotifier backboardStateNotifier,
    required FreeThrowStateNotifier freeThrowStateNotifier,
  }) : super() {
    _fieldGoalStateNotifier = fieldGoalStateNotifier;
    _courtStateNotifier = courtStateNotifier;
    _possessionArrowStateNotifier = possessionArrowStateNotifier;
    _courtOverlayStateNotifier = courtOverlayStateNotifier;
    _courtState = courtState;
    _ballMovementStateNotifier = ballMovementStateNotifier;
    _slideInArrowStateNotifier = slideInArrowStateNotifier;
    _backboardStateNotifier = backboardStateNotifier;
    _freeThrowStateNotifier = freeThrowStateNotifier;
  }

  late FieldGoalStateNotifier _fieldGoalStateNotifier;
  late CourtStateNotifier _courtStateNotifier;
  late CourtOverlayStateNotifier _courtOverlayStateNotifier;
  late PossessionArrowStateNotifier _possessionArrowStateNotifier;
  late CourtState _courtState;
  late BallMovementStateNotifier _ballMovementStateNotifier;
  late SlideInArrowStateNotifier _slideInArrowStateNotifier;
  late BackboardStateNotifier _backboardStateNotifier;
  late FreeThrowStateNotifier _freeThrowStateNotifier;

  SportLeague get league => _courtState.awayTeam?.league ?? SportLeague.unknown;

  String get awayTeamFranchiseName => _courtState.awayTeam?.franchiseName ?? '';

  String get homeTeamFranchiseName => _courtState.homeTeam?.franchiseName ?? '';

  String get awayTeamAbbrv => _courtState.awayTeam?.abbrv ?? '';

  String get homeTeamAbbrv => _courtState.homeTeam?.abbrv ?? '';

  String get awayTeamName =>
      (league == SportLeague.nba
          ? awayTeamFranchiseName
          : _courtState.awayTeam?.shortName) ??
      '';

  String get homeTeamName =>
      (league == SportLeague.nba
          ? homeTeamFranchiseName
          : _courtState.homeTeam?.shortName) ??
      '';

  HomeOrAway _courtSide(BasketballMatchIncidentStateMetaData meta) =>
      meta.side ?? HomeOrAway.home;

  HomeOrAway _oppositeCourtSide(BasketballMatchIncidentStateMetaData meta) =>
      meta.side == HomeOrAway.away ? HomeOrAway.home : HomeOrAway.away;

  HomeOrAway _ballPossession(BasketballMatchIncidentStateMetaData meta) =>
      meta.possession ?? HomeOrAway.home;

  HomeOrAway _oppositeBallPossession(
          BasketballMatchIncidentStateMetaData meta) =>
      meta.possession == HomeOrAway.away ? HomeOrAway.home : HomeOrAway.away;

  Color _courtSideColor(BasketballMatchIncidentStateMetaData meta) =>
      meta.side == HomeOrAway.away
          ? _courtState.awayTeamColor
          : _courtState.homeTeamColor;

  Color _ballPossessionTeamColor(BasketballMatchIncidentStateMetaData meta) =>
      meta.possession == HomeOrAway.away
          ? _courtState.awayTeamColor
          : _courtState.homeTeamColor;

  Color _oppositeBallPossessionTeamColor(
          BasketballMatchIncidentStateMetaData meta) =>
      meta.possession == HomeOrAway.away
          ? _courtState.homeTeamColor
          : _courtState.awayTeamColor;

  String _courtSideTeamName(BasketballMatchIncidentStateMetaData meta) =>
      meta.side == HomeOrAway.away ? awayTeamName : homeTeamName;

  String _courtSideTeamAbbrv(BasketballMatchIncidentStateMetaData meta) =>
      meta.side == HomeOrAway.away ? awayTeamAbbrv : homeTeamAbbrv;

  String _ballPossessionTeamName(BasketballMatchIncidentStateMetaData meta) =>
      meta.possession == HomeOrAway.away ? awayTeamName : homeTeamName;

  String _oppositeBallPossessionTeamName(
          BasketballMatchIncidentStateMetaData meta) =>
      meta.possession == HomeOrAway.away ? homeTeamName : awayTeamName;

  final StreamController<BasketballMatchIncidentModel> _streamController =
      StreamController.broadcast();

  StreamQueue<BasketballMatchIncidentModel> _queue =
      StreamQueue(const Stream.empty());

  bool _queueIsCancelled = false;

  bool get mounted {
    return _fieldGoalStateNotifier.mounted &&
        _courtStateNotifier.mounted &&
        _possessionArrowStateNotifier.mounted &&
        _courtOverlayStateNotifier.mounted &&
        _ballMovementStateNotifier.mounted &&
        _slideInArrowStateNotifier.mounted &&
        _backboardStateNotifier.mounted &&
        _freeThrowStateNotifier.mounted;
  }

  void add(BasketballMatchIncidentModel incident) {
    _streamController.sink.add(incident);
    if (_queue.isNullOrEmpty) {
      startQueue();
    }
  }

  /// clear all the data that's already in this stream
  void clearStream() {
    _streamController.stream.drain();
  }

  void startQueue() {
    _queue = StreamQueue(_streamController.stream);
    _runNextInQueue();
  }

  Future<void> _runNextInQueue() async {
    try {
      if (!_queueIsCancelled && mounted) {
        final hasNext = await _queue.hasNext;

        if (hasNext) {
          final incident = await _queue.next;

          await _runIncident(incident);
          await _runNextInQueue();
        }
      }
    } catch (e) {
      throw Exception('BasketballAnimationSequenceController $e');
    }
  }

  Future<void> _runIncident(
    BasketballMatchIncidentModel incident,
  ) async {
    final BasketballMatchIncidentEventType eventType = incident.event;

    if (_animationSequenceMap[eventType] != null) {
      final List<Function> Function(BasketballMatchIncidentModel)
          animationSequence = _animationSequenceMap[eventType]!;

      final List<Function> sequence = animationSequence(incident);

      _runPreSequence(incident);
      for (var animation in sequence) {
        await animation();
      }
    }
  }

  /// Function to run before sequence of animations. Currently, clears the court and hides the free throw panel if needed.
  void _runPreSequence(BasketballMatchIncidentModel nextIncident) {
    // Clear court before each incident. Exception is for free throw awarded events because
    // we animate a transition from the current overlay and do not want to clear that.
    if (!nextIncident.event.isFreeThrowAwardedEvents) {
      _clearCourtAnimations();
    }

    // Edge case to hide free throw panel if the next incident is not a free throw. For example, this can happen
    // if there's a match state correction in the middle of a free throw sequence.
    bool nextIncidentIsFreeThrow = nextIncident.event.isFreeThrowResultEvents;
    if (_freeThrowStateNotifier.isActive && !nextIncidentIsFreeThrow) {
      _freeThrowStateNotifier.hideFreeThrowsAnimation();
      _freeThrowStateNotifier.hideFreeThrowInfoPanel();
    }
  }

  void dispose() {
    _queue.cancel(immediate: true);
    _queueIsCancelled = true;
    _streamController.close();
  }

  Map<
      BasketballMatchIncidentEventType,
      List<Function> Function(
          BasketballMatchIncidentModel)> get _animationSequenceMap => {
        BasketballMatchIncidentEventType.fieldGoalMadeTwo:
            buildFieldGoalAttemptAnimationSequence,
        BasketballMatchIncidentEventType.fieldGoalMadeThree:
            buildFieldGoalAttemptAnimationSequence,
        BasketballMatchIncidentEventType.fieldGoalMissedTwo:
            buildFieldGoalAttemptAnimationSequence,
        BasketballMatchIncidentEventType.fieldGoalMissedThree:
            buildFieldGoalAttemptAnimationSequence,
        BasketballMatchIncidentEventType.foulFloor: buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulOffensive:
            buildOffensiveFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulShootingTwo:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulShootingThree:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulTechnicalA:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulTechnicalB:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulFlagrant:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulUnknown:
            buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.foulTake: buildFoulAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowAwardedOne:
            buildFreeThrowAwardedAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowAwardedTwo:
            buildFreeThrowAwardedAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowAwardedThree:
            buildFreeThrowAwardedAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne:
            buildFreeThrowAwardedAnimationSequence,
        BasketballMatchIncidentEventType.defensiveRebound:
            reboundAnimationSequence,
        BasketballMatchIncidentEventType.offensiveRebound:
            reboundAnimationSequence,
        BasketballMatchIncidentEventType.timeoutOfficial:
            timeoutAnimationSequence,
        BasketballMatchIncidentEventType.timeoutTeam: timeoutAnimationSequence,
        BasketballMatchIncidentEventType.periodStart:
            periodStartAnimationSequence,
        BasketballMatchIncidentEventType.periodEnd: periodEndAnimationSequence,
        BasketballMatchIncidentEventType.awaitingOt: overtimeAnimationSequence,
        BasketballMatchIncidentEventType.tipOff: tipOffAnimationSequence,
        BasketballMatchIncidentEventType.matchEnded: endGameAnimationSequence,
        BasketballMatchIncidentEventType.jumpBall: jumpBallAnimationSequence,
        BasketballMatchIncidentEventType.possessionChange:
            possessionChangeAnimationSequence,
        BasketballMatchIncidentEventType.turnover: turnoverAnimationSequence,
        BasketballMatchIncidentEventType.playerAtLine:
            buildPlayerAtLineAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowMade:
            buildFreeThrowResultAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowMissed:
            buildFreeThrowResultAnimationSequence,
        BasketballMatchIncidentEventType.freeThrowEnded:
            buildFreeThrowEndedAnimationSequence,
        BasketballMatchIncidentEventType.clockStarted:
            buildClockStartedAnimationSequence,
      };

  List<Function> buildFieldGoalAttemptAnimationSequence(
    BasketballMatchIncidentModel incident,
  ) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildFieldGoalAttemptAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _fieldGoalStateNotifier.startFieldGoalAnimation(_courtSide(meta)),
      () => _possessionArrowStateNotifier.showArrow(
          arrowType: PossessionArrowType.possession,
          courtSide: _courtSide(meta),
          arrowColor: _courtSideColor(meta),
          teamName: _courtSideTeamName(meta)),
      () => Future.delayed(
            const Duration(milliseconds: 1500),
          ),
      if (incident.event.isTwoPointFieldGoalEvents) ...[
        if (incident.event ==
            BasketballMatchIncidentEventType.fieldGoalMadeTwo) ...[
          () => _fieldGoalStateNotifier.show2PointMade(_courtSide(meta)),
        ],
        if (incident.event ==
            BasketballMatchIncidentEventType.fieldGoalMissedTwo) ...[
          () => _fieldGoalStateNotifier.show2PointDefensiveRebound(
                _courtSide(meta),
              ),
        ],
        () => _possessionArrowStateNotifier.hidePossessionArrow(),
        () => _courtStateNotifier.showFill2PointZones(_oppositeCourtSide(meta)),
      ],
      if (incident.event.isThreePointFieldGoalEvents) ...[
        if (incident.event ==
            BasketballMatchIncidentEventType.fieldGoalMadeThree) ...[
          () => _fieldGoalStateNotifier.show3PointMade(_courtSide(meta)),
        ],
        if (incident.event ==
            BasketballMatchIncidentEventType.fieldGoalMissedThree) ...[
          () => _fieldGoalStateNotifier
              .show3PointDefensiveRebound(_courtSide(meta)),
        ],
        () => _possessionArrowStateNotifier.hidePossessionArrow(),
        () => _courtStateNotifier.showFill3PointZones(_oppositeCourtSide(meta)),
      ],
      () => Future.delayed(
            const Duration(milliseconds: 3000),
          ),
      () => _courtOverlayStateNotifier.showHalfCourtOverlay(
          teamName: _courtSideTeamName(meta),
          overlayColor: _courtSideColor(meta),
          courtSide: _courtSide(meta),
          halfCourtOverlayType: incident.event),
      if (incident.event ==
          BasketballMatchIncidentEventType.fieldGoalMissedThree) ...[
        () => _courtStateNotifier
            .showFill3PointMissedZones(_oppositeCourtSide(meta)),
      ],
      () => _fieldGoalStateNotifier.endFieldGoalAnimation(),
      () => Future.delayed(
            const Duration(milliseconds: 2000),
          ),
      () => _courtOverlayStateNotifier.hideHalfCourtOverlay(),
      if (incident.event.isTwoPointFieldGoalEvents) ...[
        () => _courtStateNotifier.hideFill2PointZones(_oppositeCourtSide(meta)),
      ],
      if (incident.event.isThreePointFieldGoalEvents) ...[
        () => _courtStateNotifier.hideFill3PointZones(_oppositeCourtSide(meta)),
      ],

      /// explicitly adding the delay to prevent ball movement freeze on field goal attempts artboard
      () => Future.delayed(
            const Duration(milliseconds: 100),
          ),
    ];
  }

  List<Function> buildFoulAnimationSequence(
    BasketballMatchIncidentModel incident,
  ) {
    BasketballMatchIncidentEventType? foulRewardType;

    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildFoulAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    bool teamBonus = _ballPossession(meta) == HomeOrAway.home
        ? incident.meta!.homeTeamBonus ?? false
        : incident.meta!.awayTeamBonus ?? false;

    bool teamDoubleBonus = _ballPossession(meta) == HomeOrAway.home
        ? incident.meta!.homeTeamDoubleBonus ?? false
        : incident.meta!.awayTeamDoubleBonus ?? false;

    switch (incident.event) {
      case BasketballMatchIncidentEventType.foulFloor:

        /// in CBB, there are two types of bonus
        /// one-and-one: meaning the other team committed 7-9 fouls
        /// double bonus: meaning the other team committed 10 or more fouls
        if (incident.league == SportLeague.cbb) {
          if (teamBonus) {
            foulRewardType =
                BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne;
          }
          if (teamDoubleBonus) {
            foulRewardType =
                BasketballMatchIncidentEventType.freeThrowAwardedTwo;
          }
        } else if (incident.league == SportLeague.nba) {
          /// in NBA, when a team is in a
          /// bonus (meaning the other team committed 5 or more fouls as a team)
          /// they always get 2 fts awarded
          if (teamBonus) {
            foulRewardType =
                BasketballMatchIncidentEventType.freeThrowAwardedTwo;
          }
        } else {
          foulRewardType = null;
        }
        break;
      case BasketballMatchIncidentEventType.foulShootingTwo:
        foulRewardType = BasketballMatchIncidentEventType.freeThrowAwardedTwo;
        break;
      case BasketballMatchIncidentEventType.foulShootingThree:
        foulRewardType = BasketballMatchIncidentEventType.freeThrowAwardedThree;
        break;
      case BasketballMatchIncidentEventType.foulTechnicalA:
        foulRewardType = BasketballMatchIncidentEventType.freeThrowAwardedTwo;
        break;
      case BasketballMatchIncidentEventType.foulTechnicalB:
      case BasketballMatchIncidentEventType.foulTake:
      case BasketballMatchIncidentEventType.foulFlagrant:
        foulRewardType = BasketballMatchIncidentEventType.freeThrowAwardedOne;
        break;
      case BasketballMatchIncidentEventType.foulUnknown:
        foulRewardType = BasketballMatchIncidentEventType.unknown;
        break;
      default:
        foulRewardType = null;
    }

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            teamName: _courtSideTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            fullCourtOverlayType: incident.event,
            foulRewardType: foulRewardType,
            overlayColor: _courtSideColor(meta),
          ),
      () => Future.delayed(
            const Duration(milliseconds: 3000),
          ),
      // We use a separate event `buildFoulRewardAnimationSequence()` to trigger the foul reward animation.
      // Not all fouls have a reward, so we should hide the overlay if there is no reward.
      if (foulRewardType == null)
        () => _courtOverlayStateNotifier.hideFullCourtOverlay(),

      /// when a team is in a bonus (meaning the other team committed 5 or more fouls as a team)
      /// they always get 2 fts awarded
      if (incident.event == BasketballMatchIncidentEventType.foulFloor) ...[
        if (!teamBonus) ...[
          () => _backboardStateNotifier
              .showBackboard(_oppositeBallPossession(meta)),
          () => _possessionArrowStateNotifier.showArrow(
              arrowType: PossessionArrowType.possession,
              courtSide: _ballPossession(meta),
              arrowColor: _ballPossessionTeamColor(meta),
              teamName: _ballPossessionTeamName(meta)),
          () => Future.delayed(const Duration(milliseconds: 200)),
          () => _ballMovementStateNotifier
              .startPossessionChange(_ballPossession(meta)),
          () => Future.delayed(const Duration(milliseconds: 3800)),
          () => _backboardStateNotifier.hideAllBackboards(),
          () => _ballMovementStateNotifier.endBallMovementAnimation(),
          () => _fieldGoalStateNotifier
              .startFieldGoalAnimation(_ballPossession(meta)),
        ],
      ]
    ];
  }

  List<Function> buildOffensiveFoulAnimationSequence(
    BasketballMatchIncidentModel incident,
  ) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildOffensiveFoulAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            teamName: _ballPossessionTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            fullCourtOverlayType: incident.event,
            foulRewardType: BasketballMatchIncidentEventType.passIn,
            overlayColor: _ballPossessionTeamColor(meta),
          ),
      () => Future.delayed(
            const Duration(milliseconds: 3000),
          ),
    ];
  }

  List<Function> buildFreeThrowAwardedAnimationSequence(
    BasketballMatchIncidentModel incident,
  ) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildFreeThrowAwardedAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _courtOverlayStateNotifier.animateFullCourtOverlayChange(
            teamName: _courtSideTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            overlayType: incident.event,
            overlayColor: _courtSideColor(meta),
          ),
      () => Future.delayed(
            const Duration(milliseconds: 3000),
          ),
    ];
  }

  List<Function> reboundAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.reboundAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _fieldGoalStateNotifier
          .startFieldGoalAnimation(_ballPossession(meta)),
      () => _possessionArrowStateNotifier.showReboundText(),
      () => _possessionArrowStateNotifier.showArrow(
            arrowType: incident.event ==
                    BasketballMatchIncidentEventType.offensiveRebound
                ? PossessionArrowType.offensiveRebound
                : PossessionArrowType.defensiveRebound,
            courtSide: _ballPossession(meta),
            arrowColor: _ballPossessionTeamColor(meta),
            teamName: _ballPossessionTeamName(meta),
          ),
      () => Future.delayed(
            const Duration(milliseconds: 2500),
          ),
      () => _possessionArrowStateNotifier.hideReboundText(),
    ];
  }

  List<Function> timeoutAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.timeoutAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            teamName: _courtSideTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            fullCourtOverlayType: incident.event,
            overlayColor: incident.event ==
                    BasketballMatchIncidentEventType.timeoutOfficial
                ? darkGrey
                : _courtSideColor(meta),
          ),
    ];
  }

  List<Function> periodStartAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.periodStartAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    if (meta.period == null) {
      return [];
    }

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            fullCourtOverlayType: incident.event,
            overlayColor:
                darkGrey, // Not ideal, but we don't have access to context in these sequences, so would be a pain to grab the gameskin here.
            period: meta.period,
          ),
      () => Future.delayed(const Duration(milliseconds: 1000)),
    ];
  }

  List<Function> periodEndAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.periodEndAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;
    final period = meta.period;

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            teamName: _courtSideTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            period: period,
            fullCourtOverlayType: incident.event,
            overlayColor:
                darkGrey, // Not ideal, but we don't have access to context in these sequences, so would be a pain to grab the gameskin here.
          ),

      /// second overlay "Halftime" for
      /// CBB: end of period 1
      /// NBA: end of period 2
      if ((league == SportLeague.cbb && period == 1) ||
          (league == SportLeague.nba && period == 2)) ...[
        () => Future.delayed(const Duration(milliseconds: 3000)),
        () => _courtOverlayStateNotifier.animateFullCourtOverlayChange(
              teamName: _courtSideTeamName(meta),
              teamAbbrv: _courtSideTeamAbbrv(meta),
              overlayType: incident.event,
              isHalfTime: true,
              overlayColor: darkGrey,
            ),
      ],
      () => Future.delayed(const Duration(milliseconds: 1000)),
    ];
  }

  List<Function> overtimeAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.overtimeAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            teamName: _courtSideTeamName(meta),
            teamAbbrv: _courtSideTeamAbbrv(meta),
            fullCourtOverlayType: incident.event,
            overlayColor:
                darkGrey, // Not ideal, but we don't have access to context in these sequences, so would be a pain to grab the gameskin here.
          ),
    ];
  }

  List<Function> tipOffAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.tipOffAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _backboardStateNotifier.showAllBackboards(),
      () => _ballMovementStateNotifier.startTipOff(_courtSide(meta)),
      () => Future.delayed(const Duration(milliseconds: 3500)),
      () => _backboardStateNotifier.hideBackboard(_courtSide(meta)),
      () => _courtOverlayStateNotifier.showHalfCourtOverlay(
            halfCourtOverlayType: BasketballMatchIncidentEventType.tipOff,
            courtSide: _courtSide(meta),
            teamName: _courtSideTeamName(meta),
            overlayColor: _courtSideColor(meta),
          ),
      () => Future.delayed(const Duration(milliseconds: 2000)),
      () => _courtOverlayStateNotifier.hideHalfCourtOverlay(),
      () => _possessionArrowStateNotifier.showArrow(
          arrowType: PossessionArrowType.possession,
          courtSide: _courtSide(meta),
          arrowColor: _courtSideColor(meta),
          teamName: _courtSideTeamName(meta)),
      () => Future.delayed(const Duration(milliseconds: 2200)),
      () => _backboardStateNotifier.hideAllBackboards(),
      () => _ballMovementStateNotifier.endBallMovementAnimation(),

      /// explicitly adding the delay to prevent ball movement freeze on ball movement artboard
      () => Future.delayed(const Duration(milliseconds: 100)),
      () => _fieldGoalStateNotifier.startFieldGoalAnimation(_courtSide(meta)),
    ];
  }

  List<Function> endGameAnimationSequence(
      BasketballMatchIncidentModel incident) {
    return [
      () => _courtStateNotifier.showFillLanes(),
      () => _backboardStateNotifier.showAllBackboards(),
    ];
  }

  List<Function> jumpBallAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.jumpBallAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _ballMovementStateNotifier.startJumpBall(_oppositeCourtSide(meta)),
      () => Future.delayed(const Duration(milliseconds: 1000)),
      () => _courtOverlayStateNotifier.showFullCourtOverlay(
            overlayColor: _courtSideColor(meta),
            fullCourtOverlayType: BasketballMatchIncidentEventType.jumpBall,
          ),
      () => _slideInArrowStateNotifier.showJumpBall(_oppositeCourtSide(meta)),
      () => Future.delayed(const Duration(milliseconds: 3800)),
      () => _courtOverlayStateNotifier.hideFullCourtOverlay(),
      () => _possessionArrowStateNotifier.showArrow(
            arrowType: PossessionArrowType.possession,
            courtSide: _courtSide(meta),
            arrowColor: _courtSideColor(meta),
            teamName: _courtSideTeamName(meta),
          ),
      () => Future.delayed(const Duration(milliseconds: 1000)),
      () => _ballMovementStateNotifier.endBallMovementAnimation(),
      () => _slideInArrowStateNotifier.hideSlideInArrow(),
      () => Future.delayed(const Duration(milliseconds: 100)),
      () => _fieldGoalStateNotifier.startFieldGoalAnimation(_courtSide(meta)),

      /// explicitly adding the delay to prevent ball movement freeze on field goal attempts artboard
      () => Future.delayed(const Duration(milliseconds: 100)),
    ];
  }

  List<Function> possessionChangeAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.possessionChangeAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      if (meta.reason != "period_end") ...[
        () => _backboardStateNotifier
            .showBackboard(_oppositeBallPossession(meta)),
        () => _possessionArrowStateNotifier.showArrow(
            arrowType: PossessionArrowType.possession,
            courtSide: _ballPossession(meta),
            arrowColor: _ballPossessionTeamColor(meta),
            teamName: _ballPossessionTeamName(meta)),
        () => Future.delayed(const Duration(milliseconds: 200)),
        () => _ballMovementStateNotifier
            .startPossessionChange(_ballPossession(meta)),
        () => Future.delayed(const Duration(milliseconds: 3800)),
        () => _backboardStateNotifier.hideAllBackboards(),
        () => _ballMovementStateNotifier.endBallMovementAnimation(),
        () => _fieldGoalStateNotifier
            .startFieldGoalAnimation(_ballPossession(meta)),

        /// explicitly adding the delay to prevent ball movement freeze on field goal attempts
        () => Future.delayed(const Duration(milliseconds: 100)),
      ]
    ];
  }

  List<Function> turnoverAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.turnoverAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _possessionArrowStateNotifier.showArrow(
          arrowType: PossessionArrowType.possession,
          courtSide: _oppositeBallPossession(meta),
          arrowColor: _oppositeBallPossessionTeamColor(meta),
          teamName: _oppositeBallPossessionTeamName(meta)),
      () => _backboardStateNotifier.showBackboard(_ballPossession(meta)),
      () => _ballMovementStateNotifier
          .startTurnover(_oppositeBallPossession(meta)),
      () => Future.delayed(const Duration(milliseconds: 1000)),
      () => _backboardStateNotifier.hideAllBackboards(),
      () => _possessionArrowStateNotifier.hidePossessionArrow(),
      () => Future.delayed(const Duration(milliseconds: 300)),
      () =>
          _backboardStateNotifier.showBackboard(_oppositeBallPossession(meta)),
      () => _slideInArrowStateNotifier.showTurnover(_ballPossession(meta)),
      () => Future.delayed(const Duration(milliseconds: 3900)),
      () => _possessionArrowStateNotifier.showArrow(
          arrowType: PossessionArrowType.possession,
          courtSide: _ballPossession(meta),
          arrowColor: _ballPossessionTeamColor(meta),
          teamName: _ballPossessionTeamName(meta)),
      () => Future.delayed(const Duration(milliseconds: 1800)),
      () => _ballMovementStateNotifier.endBallMovementAnimation(),
      () => _backboardStateNotifier.hideAllBackboards(),
      () => _slideInArrowStateNotifier.hideSlideInArrow(),
      () => Future.delayed(const Duration(milliseconds: 100)),
      () => _fieldGoalStateNotifier
          .startFieldGoalAnimation(_ballPossession(meta)),

      /// explicitly adding the delay to prevent ball movement freeze on field goal attempts
      () => Future.delayed(const Duration(milliseconds: 100)),
    ];
  }

  List<Function> buildFreeThrowResultAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildFreeThrowsAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _freeThrowStateNotifier.resetFreeThrowInputs(),
      () => Future.delayed(const Duration(milliseconds: 1000)),
      if (incident.event == BasketballMatchIncidentEventType.freeThrowMade) ...[
        () => _freeThrowStateNotifier.showFreeThrowMade(_courtSide(meta)),
      ] else ...[
        () => _freeThrowStateNotifier.showFreeThrowMissed(_courtSide(meta)),
      ],
      // Wait for free throw animation to finish before showing half court overlay
      () => Future.delayed(const Duration(milliseconds: 1600)),
      () => _freeThrowStateNotifier.setFreeThrowIncident(incident),
      () => _freeThrowStateNotifier.setFreeThrowAttemptResult(incident),
      () => _courtOverlayStateNotifier.showHalfCourtOverlay(
            teamName: _courtSideTeamName(meta),
            overlayColor: _courtSideColor(meta),
            courtSide: _courtSide(meta),
            halfCourtOverlayType: incident.event,
          ),
      () => Future.delayed(
            const Duration(milliseconds: 2000),
          ),
      // Allows basketball to bounce on line in between shots
      () => _freeThrowStateNotifier.resetFreeThrowInputs(),
      () => _courtOverlayStateNotifier.hideHalfCourtOverlay(),
      // Add small delay to prevent ball from not showing.
      () => Future.delayed(
            const Duration(milliseconds: 100),
          ),
    ];
  }

  List<Function> buildPlayerAtLineAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildPlayerAtLineAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      () => _freeThrowStateNotifier.setPlayerAtLine(incident),
      () => _freeThrowStateNotifier.startFreeThrowsAnimation(_courtSide(meta)),
    ];
  }

  List<Function> buildFreeThrowEndedAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildFreeThrowEndedAnimationSequence: incident.meta is null');
    }

    return [
      () => _freeThrowStateNotifier.setFreeThrowEnded(incident),
    ];
  }

  List<Function> buildClockStartedAnimationSequence(
      BasketballMatchIncidentModel incident) {
    if (incident.meta == null) {
      throw Exception(
          'BasketballAnimationSequenceController.buildClockStartAnimationSequence: incident.meta is null');
    }

    final meta = incident.meta!;

    return [
      /// if meta.reason is timeout_over
      /// clear the court and show possession arrow for team in possession
      /// start ball bouncing animation
      if (meta.reason == 'timeout_over') ...[
        () => _possessionArrowStateNotifier.showArrow(
            arrowType: PossessionArrowType.possession,
            courtSide: _ballPossession(meta),
            arrowColor: _ballPossessionTeamColor(meta),
            teamName: _ballPossessionTeamName(meta)),
        () => _fieldGoalStateNotifier
            .startFieldGoalAnimation(_ballPossession(meta)),
      ],
    ];
  }

  void _clearCourtAnimations() {
    final animationList = [
      () => _fieldGoalStateNotifier.endFieldGoalAnimation(),
      () => _fieldGoalStateNotifier.hideFieldGoalAttemptAnimation(),
      () => _possessionArrowStateNotifier.hidePossessionArrow(),
      () => _courtOverlayStateNotifier.hideFullCourtOverlay(),
      () => _ballMovementStateNotifier.endBallMovementAnimation(),
      () => _slideInArrowStateNotifier.hideSlideInArrow(),

      /// explicitly adding the delay to prevent ball movement freeze on field goal attempts artboard
      () => Future.delayed(
            const Duration(milliseconds: 100),
          ),
    ];

    for (final animation in animationList) {
      animation();
    }
  }
}
