import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/util.dart';

MoveAlongPathEffect createFootballArcEffect({
  required int startingYardline,
  required int endingYardline,
  required HomeOrAway startingSide,
  required HomeOrAway endingSide,
  required double screenWidth,
  VoidCallback? onComplete,
  bool oriented = true,
  double startDelay = 0,
  VoidCallback? afterDelay,
}) {
  double deltaX = getDeltaX(
    startingYardline,
    endingYardline,
    startingSide,
    endingSide,
    screenWidth,
  );

  final double yardsTraveled = getYardsTraveled(deltaX, screenWidth);
  final double duration = 1 + (yardsTraveled.abs() / 10) * 0.15;

  if (deltaX == 0) {
    deltaX = .1;
  }

  Future.delayed(
    Duration(milliseconds: (startDelay * 1000).toInt()),
    afterDelay,
  );
  final effect = MoveAlongPathEffect(
    Path()..quadraticBezierTo(deltaX / 2, -yardsTraveled * 1.5, deltaX, 0),
    EffectController(
      duration: duration,
      curve: Curves.easeIn,
      startDelay: startDelay,
    ),
    oriented: oriented,
    onComplete: onComplete,
  );

  return effect;
}

MoveAlongPathEffect createFootballHalfArcEffect({
  required int startingYardline,
  required int endingYardline,
  required HomeOrAway startingSide,
  required HomeOrAway endingSide,
  required double screenWidth,
  VoidCallback? onComplete,
  double startDelay = 0,
  VoidCallback? afterDelay,
}) {
  double deltaX = getDeltaX(
    startingYardline,
    endingYardline,
    startingSide,
    endingSide,
    screenWidth,
  );

  final double yardsTraveled = getYardsTraveled(deltaX, screenWidth);

  final double duration = 1 + (yardsTraveled.abs() / 10) * 0.15;

  if (deltaX == 0) {
    deltaX = .1;
  }

  Future.delayed(Duration(seconds: startDelay.toInt()), afterDelay);
  final effect = MoveAlongPathEffect(
    Path()..lineTo(deltaX, -yardsTraveled * 2),
    EffectController(
      duration: duration,
      curve: Curves.easeInOut,
      startDelay: startDelay,
    ),
    oriented: true,
    onComplete: onComplete,
  );

  return effect;
}

MoveAlongPathEffect createFootballStraightLineEffect({
  required int startingYardline,
  required int endingYardline,
  required HomeOrAway startingSide,
  required HomeOrAway endingSide,
  required double screenWidth,
  double? fixedDuration,
  VoidCallback? onComplete,
}) {
  double deltaX = getDeltaX(
    startingYardline,
    endingYardline,
    startingSide,
    endingSide,
    screenWidth,
  );

  final double yardsTraveled = getYardsTraveled(deltaX, screenWidth);

  final double duration = fixedDuration ?? 1 + (yardsTraveled.abs() / 10);

  if (deltaX == 0) {
    deltaX = .1;
  }

  final effect = MoveAlongPathEffect(
    Path()..lineTo(deltaX, 0),
    EffectController(duration: duration, curve: Curves.easeInOut),
    onComplete: onComplete,
  );

  return effect;
}

MoveEffect verticalBobbingEffect({double height = 10, double startDelay = 0}) {
  return MoveEffect.by(
    Vector2(0, 10),
    EffectController(
      duration: .75,
      startDelay: startDelay,
      curve: Curves.easeInOut,
      infinite: true,
      alternate: true,
    ),
  );
}

final riseEffect = MoveEffect.by(
  Vector2(0, -10),
  EffectController(duration: kRiseAndFallEffectDuration),
);

final fallEffect = MoveEffect.by(
  Vector2(0, 10),
  EffectController(duration: kRiseAndFallEffectDuration),
);

Effect createSackEffect({
  required int startingYardline,
  required int endingYardline,
  required HomeOrAway startingSide,
  required HomeOrAway endingSide,
  required double screenWidth,
}) {
  final moveEffect = createFootballStraightLineEffect(
    startingYardline: startingYardline,
    endingYardline: endingYardline,
    startingSide: startingSide,
    endingSide: endingSide,
    screenWidth: screenWidth,
    fixedDuration: kSackEffectMoveDuration,
  );

  final effect = SequenceEffect([
    riseEffect,
    moveEffect,
    fallEffect,
  ]);

  return effect;
}
