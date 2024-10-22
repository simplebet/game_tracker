import 'dart:async';

import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/controller_helper.dart';

class TransitionOverlaysController {
  TransitionOverlaysController({
    required StateMachineController controller,
    required Artboard artboard,
  }) {
    _controller = controller;
    _artboard = artboard;

    _coinTossTrigger = _controller.findInput<bool>('coin_toss')! as SMITrigger;
    _overtimeTrigger = _controller.findInput<bool>('overtime')! as SMITrigger;
    _timeOutTrigger = _controller.findInput<bool>('time_out')! as SMITrigger;
    _halfTimeTrigger = _controller.findInput<bool>('half_time')! as SMITrigger;
    _quarterEndedTrigger =
        _controller.findInput<bool>('quarter_ended')! as SMITrigger;
    _flagTrigger = _controller.findInput<bool>('flag')! as SMITrigger;
    _touchbackTrigger = _controller.findInput<bool>('touchback')! as SMITrigger;
    _twoPointConversionFailedTrigger = _controller
        .findInput<bool>('two_point_conversion_failed')! as SMITrigger;
    _twoPointConversionMadeTrigger =
        _controller.findInput<bool>('two_point_conversion_made')! as SMITrigger;
    _turnoverOnDownsTrigger =
        _controller.findInput<bool>('turnover_on_downs')! as SMITrigger;
    _touchdownTrigger = _controller.findInput<bool>('touchdown')! as SMITrigger;
    _fumbleTrigger = _controller.findInput<bool>('fumble')! as SMITrigger;
    _safetyTrigger = _controller.findInput<bool>('safety')! as SMITrigger;
    _sackTrigger = _controller.findInput<bool>('sack')! as SMITrigger;
    _interceptionTrigger =
        _controller.findInput<bool>('interception')! as SMITrigger;
    _fairCatchTrigger =
        _controller.findInput<bool>('fair_catch')! as SMITrigger;
    _fieldGoalMissedTrigger =
        _controller.findInput<bool>('field_goal_missed')! as SMITrigger;
    _fieldGoalMadeTrigger =
        _controller.findInput<bool>('field_goal_made')! as SMITrigger;
    _extraPointMissedTrigger =
        _controller.findInput<bool>('extra_point_missed')! as SMITrigger;
    _extraPointMadeTrigger =
        _controller.findInput<bool>('extra_point_made')! as SMITrigger;

    _previousPlayUnderReviewTrigger = _controller
        .findInput<bool>('previous_play_under_review')! as SMITrigger;
    _previousPlayStandsTrigger =
        _controller.findInput<bool>('previous_play_stands')! as SMITrigger;
    _previousPlayOverturnedTrigger =
        _controller.findInput<bool>('previous_play_overturned')! as SMITrigger;
    _doubleTurnoverTrigger =
        _controller.findInput<bool>('double_turnover')! as SMITrigger;
  }

  late StateMachineController _controller;
  late Artboard _artboard;

  late SMITrigger _coinTossTrigger;
  late SMITrigger _overtimeTrigger;
  late SMITrigger _timeOutTrigger;
  late SMITrigger _halfTimeTrigger;
  late SMITrigger _quarterEndedTrigger;
  late SMITrigger _flagTrigger;
  late SMITrigger _touchbackTrigger;
  late SMITrigger _twoPointConversionFailedTrigger;
  late SMITrigger _twoPointConversionMadeTrigger;
  late SMITrigger _turnoverOnDownsTrigger;
  late SMITrigger _touchdownTrigger;
  late SMITrigger _fumbleTrigger;
  late SMITrigger _safetyTrigger;
  late SMITrigger _sackTrigger;
  late SMITrigger _interceptionTrigger;
  late SMITrigger _fairCatchTrigger;
  late SMITrigger _fieldGoalMissedTrigger;
  late SMITrigger _fieldGoalMadeTrigger;
  late SMITrigger _extraPointMissedTrigger;
  late SMITrigger _extraPointMadeTrigger;
  late SMITrigger _previousPlayUnderReviewTrigger;
  late SMITrigger _previousPlayStandsTrigger;
  late SMITrigger _previousPlayOverturnedTrigger;
  late SMITrigger _doubleTurnoverTrigger;

  void setColor(Color primaryColor, Color secondaryColor) {
    final double renderOpacity = primaryColor == Colors.transparent ? 0 : 1;

    _artboard.forEachComponent((child) {
      if (child is Fill && child.name == 'Primary') {
        child.renderOpacity =
            renderOpacity; // For some reason, this is needed in order for the color change to work for the very first animation
        child.paint.color = primaryColor;
      } else if (child is Shape && child.name == 'Primary') {
        child.fills.first.renderOpacity = renderOpacity;
        child.fills.first.paint.color = primaryColor;
      } else if (child is Fill && child.name == 'Secondary') {
        child.renderOpacity = renderOpacity;
        child.paint.color = secondaryColor;
      } else if (child is Shape && child.name == 'Secondary') {
        child.fills.first.renderOpacity = renderOpacity;
        child.fills.first.paint.color = secondaryColor;
      }
    });
  }

  void clearOverlayColor() {
    setColor(Colors.transparent, Colors.transparent);
  }

  Future<void> setCoinTossColor(Color color) async {
    final Shape? backgroundShape = _artboard.component<Shape>('Background');

    if (backgroundShape != null) {
      final Fill fill = backgroundShape.fills.first..renderOpacity = 1;
      final ColorTween colorTween =
          ColorTween(begin: fill.paint.color, end: color);

      const totalDurationMillis = 250; // 60 ticks * 16 milliseconds/tick
      const tickDuration = Duration(milliseconds: 25);
      final totalTicks = totalDurationMillis ~/ tickDuration.inMilliseconds;

      await Future.delayed(const Duration(seconds: 3));

      Timer.periodic(tickDuration, (t) {
        if (t.tick >= totalTicks) {
          fill.renderOpacity = 1;
          fill.paint.color = color;
          t.cancel();
          return;
        }

        fill.renderOpacity = 1;
        fill.paint.color = colorTween.lerp(t.tick / totalTicks)!;
      });
    }
  }

  void setCoinTossText({required String teamTricode}) {
    final tricodeText = _artboard.component<TextValueRun>('Tricode');

    tricodeText?.text = teamTricode;
  }

  Future<void> coinToss() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _coinTossTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> overtime() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _overtimeTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> timeOut() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _timeOutTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> halfTime() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _halfTimeTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> quarterEnded() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _quarterEndedTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> flag() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _flagTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> touchback() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _touchbackTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> twoPointConversionFailed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _twoPointConversionFailedTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> twoPointConversionMade() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _twoPointConversionMadeTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> turnoverOnDowns() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _turnoverOnDownsTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> touchdown() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _touchdownTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> fumble() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _fumbleTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> safety() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _safetyTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> sack() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _sackTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> interception() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _interceptionTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> fairCatch() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _fairCatchTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> fieldGoalMissed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _fieldGoalMissedTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> fieldGoalMade() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _fieldGoalMadeTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> extraPointMissed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _extraPointMissedTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> extraPointMade() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _extraPointMadeTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> previousPlayUnderReview() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _previousPlayUnderReviewTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> previousPlayStands() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _previousPlayStandsTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> previousPlayOverturned() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _previousPlayOverturnedTrigger.fire();
    await waitForInactive(_controller);
  }

  Future<void> doubleTurnover() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _doubleTurnoverTrigger.fire();
    await waitForInactive(_controller);
  }
}
