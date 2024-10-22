import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/full_view/controllers/football_controller.dart';
import 'package:game_tracker/ui/football_tracker/full_view/effects/football_movement_effects.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/opacity_provider_mixin.dart';
import 'package:game_tracker/ui/football_tracker/full_view/flame_skewed_view/sprites/star_sprite.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/util.dart';

class FootballRiveComponent extends RiveComponent
    with HasGameRef, HasOpacityProvider, Completable {
  factory FootballRiveComponent.arc(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required double screenWidth,
  }) {
    return FootballRiveComponent._(
      artboard,
      effect: createFootballArcEffect(
        startingYardline: startingYardline,
        endingYardline: endingYardline,
        startingSide: startingSide,
        endingSide: endingSide,
        screenWidth: screenWidth,
      ),
      startingYardline: startingYardline,
      startingSide: startingSide,
    );
  }

  factory FootballRiveComponent.passIncomplete(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleForward();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(endingYardline, endingSide, screenWidth),
            screenHeight * kStarSpriteYFactor,
          ),
        );
      },
    );

    final halfArcEndYardline = endingYardline +
        kPassIncompleteNetYards ~/
            2 *
            (startingSide != endingSide || startingSide != possession ? -1 : 1);

    final halfArcEffect = createFootballHalfArcEffect(
      startDelay: 0.1,
      startingYardline: endingYardline,

      /// half arc will move towards other direction
      /// with the length half of the full arc
      endingYardline: halfArcEndYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
    );

    final sequenceEffect = SequenceEffect([arcEffect, halfArcEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    return footballComponent;
  }

  factory FootballRiveComponent.fieldGoalMade(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required double screenWidth,
  }) {
    return FootballRiveComponent._(
      artboard,
      effect: createFootballArcEffect(
        startingYardline: startingYardline,
        endingYardline: -12,
        startingSide: startingSide,
        endingSide: endingSide,
        screenWidth: screenWidth,
        oriented: false,
      ),
      startingYardline: startingYardline,
      startingSide: startingSide,
    );
  }

  factory FootballRiveComponent.kickoff(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required int endingYardline,
    required double screenWidth,
    required FootballController footballController,
  }) {
    footballController.idleVertical();

    final footballArc = FootballRiveComponent._(
      artboard,
      effect: createFootballArcEffect(
        startingYardline: startingYardline,
        endingYardline: endingYardline,
        startingSide: startingSide,
        endingSide: endingSide,
        screenWidth: screenWidth,
        oriented: false,
        startDelay: kKickoffDelay,
        afterDelay: () => footballController.flip(),
      ),
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    return footballArc;
  }

  factory FootballRiveComponent.fieldGoalMissed(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: -12,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      oriented: false,
      onComplete: () {
        controller.idleHorizontal();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(-12, endingSide, screenWidth),
            screenHeight * kGoalPostYFactor + 15,
          ),
        );
      },
    );

    final rotateAngle =
        endingSide == HomeOrAway.home ? math.pi / 4 : -math.pi / 4;

    final rotateEffect = RotateEffect.to(
      rotateAngle,
      EffectController(duration: 0),
    );

    // Move up and to the left
    final Vector2 moveVector =
        endingSide == HomeOrAway.home ? Vector2.all(-50) : Vector2(50, -50);

    final straightLineEffect =
        MoveByEffect(moveVector, EffectController(duration: 0.5));

    final sequenceEffect =
        SequenceEffect([arcEffect, rotateEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (endingSide == HomeOrAway.home) {
      footballComponent.flipHorizontally();
    }

    return footballComponent;
  }

  factory FootballRiveComponent.rushEffect(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required double screenWidth,
  }) {
    final component = FootballRiveComponent._(
      artboard,
      effect: createFootballStraightLineEffect(
        startingYardline: startingYardline,
        endingYardline: endingYardline,
        startingSide: startingSide,
        endingSide: endingSide,
        screenWidth: screenWidth,
        fixedDuration: 2,
      ),
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (possession == HomeOrAway.home) {
      component.flipHorizontally();
    }

    component.add(verticalBobbingEffect());

    return component;
  }

  factory FootballRiveComponent.sackEffect(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required double screenWidth,
  }) {
    return FootballRiveComponent._(
      artboard,
      effect: createSackEffect(
        startingYardline: startingYardline,
        endingYardline: endingYardline,
        startingSide: startingSide,
        endingSide: endingSide,
        screenWidth: screenWidth,
      ),
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));
  }

  factory FootballRiveComponent.interception(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final netYardsFactor = possession != startingSide ? -1 : 1;
    final straightLineStartYardline =
        (startingYardline + kInterceptionNetYards * netYardsFactor).toInt();

    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: straightLineStartYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleForward();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(
              straightLineStartYardline + 2 * netYardsFactor,
              endingSide,
              screenWidth,
            ),
            screenHeight * kGoalPostYFactor + 32,
          ),
        );
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: straightLineStartYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      fixedDuration: 1.5,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    if (endingSide == HomeOrAway.home) {
      footballComponent.flipHorizontally();
    }

    return footballComponent;
  }

  factory FootballRiveComponent.puntBlocked(
    Artboard artboard, {
    required int startingYardline,
    required int endingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final netYardsFactor = possession != startingSide ? -1 : 1;
    final straightLineStartYardline =
        (startingYardline + kInterceptionNetYards * netYardsFactor).toInt();

    final halfArcEffect = createFootballHalfArcEffect(
      startingYardline: startingYardline,

      /// half arc will move towards other direction
      /// with the length half of the full arc
      endingYardline: straightLineStartYardline,
      startingSide: startingSide,
      endingSide: startingSide,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleForward();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(
              startingYardline + 5 * netYardsFactor,
              possession,
              screenWidth,
            ),
            screenHeight * kStarSpriteYFactor - 16,
          ),
        );
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: straightLineStartYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      fixedDuration: 1.5,
    );

    final sequenceEffect = SequenceEffect([halfArcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    if (endingSide == HomeOrAway.home) {
      footballComponent.flipHorizontally();
    }

    return footballComponent;
  }

  factory FootballRiveComponent.touchdownFromPickSix(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final endingYardline = (startingYardline +
            (startingSide != possession
                ? -kInterceptionNetYards
                : kInterceptionNetYards))
        .toInt();

    controller.spiral(); // Start with spiral for the arc from pass

    late FootballRiveComponent footballComponent;

    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: startingSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballComponent.angle =
            0; // Since the ball is stopped partially through its arc, reset angle to 0.
        controller.idleAngled();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(endingYardline, startingSide, screenWidth),
            screenHeight * kGoalPostYFactor + 32,
          ),
        );
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: endingYardline,
      endingYardline: -5,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    if (possession == HomeOrAway.away) {
      footballComponent.flipHorizontally();
    }

    return footballComponent;
  }

  factory FootballRiveComponent.touchdownFromKickoff(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required double screenWidth,
    required FootballController controller,
  }) {
    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: -5,
      startingSide: startingSide,
      endingSide: startingSide.opposite,
      screenWidth: screenWidth,
      onComplete: () => controller.idleForward(),
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: -5,
      endingYardline: -5,
      startingSide: startingSide.opposite,
      endingSide: startingSide,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    return footballComponent;
  }

  factory FootballRiveComponent.kickoffReturn(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required int endingYardline,
    required double screenWidth,
    required FootballController controller,
  }) {
    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: -5,
      startingSide: startingSide,
      endingSide: startingSide.opposite,
      screenWidth: screenWidth,
      oriented: false,
      startDelay: kKickoffDelay,
      afterDelay: () => controller.spiral(),
      onComplete: () => controller.idleForward(),
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: -5,
      endingYardline: endingYardline,
      startingSide: startingSide.opposite,
      endingSide: startingSide.opposite,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    return footballComponent;
  }

  factory FootballRiveComponent.touchdownFromBlockedPunt(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final endingYardline = (startingYardline +
            (startingSide != possession
                ? -kInterceptionNetYards
                : kInterceptionNetYards))
        .toInt();

    final netYardsFactor = startingSide == possession ? 1 : -1;

    final halfArcEndYardline = endingYardline + kPassIncompleteNetYards ~/ 2;

    final halfArcEffect = createFootballHalfArcEffect(
      startingYardline: startingYardline,

      /// half arc will move towards other direction
      /// with the length half of the full arc
      endingYardline: halfArcEndYardline,
      startingSide: startingSide,
      endingSide: startingSide,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleForward();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(
              startingYardline + 8 * netYardsFactor,
              possession,
              screenWidth,
            ),
            screenHeight * kStarSpriteYFactor - 16,
          ),
        );
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: endingYardline,
      endingYardline: -5,
      startingSide: startingSide,
      endingSide: possession,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([halfArcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    return footballComponent;
  }

  factory FootballRiveComponent.touchdownFromPunt(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController controller,
    required StarSprite starSprite,
  }) {
    final arcEndingYardline =
        ((100 - startingYardline) - kTouchdownFromPuntEndYardline).toInt();

    final netYardsFactor = startingSide == possession ? 1 : -1;

    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: 20,
      startingSide: startingSide,
      endingSide: startingSide.opposite,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleForward();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(
              startingYardline + arcEndingYardline + 2 * netYardsFactor,
              possession,
              screenWidth,
            ),
            screenHeight * kGoalPostYFactor + 32,
          ),
        );
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: 20,
      endingYardline: -5,
      startingSide: startingSide.opposite,
      endingSide: startingSide,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    return footballComponent;
  }

  factory FootballRiveComponent.safetyFromKickoff(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required double screenWidth,
    required FootballController controller,
  }) {
    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: -6,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      onComplete: () {
        controller.idleVertical();
      },
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: -6,
      endingYardline: -4,
      startingSide: endingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      fixedDuration: 2,
    );

    final sequenceEffect = SequenceEffect([arcEffect, straightLineEffect]);

    final footballComponent = FootballRiveComponent._(
      artboard,
      effect: sequenceEffect,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..add(verticalBobbingEffect(startDelay: 1));

    controller.idleAngled();

    return footballComponent;
  }

  factory FootballRiveComponent.fumbleFromPass(
    Artboard artboard, {
    required int passingStartYardline,
    required int passingEndYardline,
    required HomeOrAway passingStartSide,
    required HomeOrAway passingEndSide,
    required HomeOrAway possession,
    required double screenWidth,
    required FootballController footballController,
  }) {
    final pass = createFootballArcEffect(
      startingYardline: passingStartYardline,
      endingYardline: passingEndYardline,
      startingSide: passingStartSide,
      endingSide: passingEndSide,
      screenWidth: screenWidth,
      oriented: false,
      onComplete: () {
        footballController.fumble();
      },
    );

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        pass,
        delay,
      ],
    );

    final component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: passingStartYardline,
      startingSide: passingStartSide,
    );

    if (possession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.fumbleFromPassWithRun(
    Artboard artboard, {
    required int passingStartYardline,
    required int rushingEndYardline,
    required HomeOrAway passingStartSide,
    required HomeOrAway rushingEndSide,
    required HomeOrAway possession,
    required double screenWidth,
    required double screenHeight,
    required FootballController footballController,
    StarSprite? starSprite,
  }) {
    int passOffset;

    if (possession == HomeOrAway.away) {
      if (passingStartSide == HomeOrAway.away) {
        passOffset = 5;
      } else {
        passOffset = -5;
      }
    } else {
      if (passingStartSide == HomeOrAway.away) {
        passOffset = -5;
      } else {
        passOffset = 5;
      }
    }

    footballController.spiral();

    final (passingEndSide, passingEndYardline) = getSideAndYardlineIfPast50(
      passingStartSide,
      passingStartYardline + passOffset,
    );
    final pass = createFootballArcEffect(
      startingYardline: passingStartYardline,
      endingYardline: passingEndYardline,
      startingSide: passingStartSide,
      endingSide: passingEndSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
        if (starSprite != null) {
          starSprite.scaleInOut(
            position: Vector2(
              getXPosition(passingEndYardline, passingEndSide, screenWidth),
              screenHeight * kGoalPostYFactor + 32,
            ),
          );
        }
      },
    );

    late FootballRiveComponent component;

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: passingStartYardline,
      endingYardline: rushingEndYardline -
          passOffset, // The fumble animation offsets our ball by roughly 5 yards, so we can account for this by using the passOffset
      startingSide: passingEndSide,
      endingSide: rushingEndSide,
      screenWidth: screenWidth,
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        pass,
        delay,
        rush,
      ],
    );

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: passingStartYardline,
      startingSide: passingStartSide,
    );

    if (possession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.fumbleFromRush(
    Artboard artboard, {
    required int rushingStartYardline,
    required int rushingEndYardline,
    required HomeOrAway rushingStartSide,
    required HomeOrAway rushingEndSide,
    required HomeOrAway possession,
    required double screenWidth,
    required FootballController footballController,
  }) {
    late FootballRiveComponent component;

    final pass = createFootballStraightLineEffect(
      startingYardline: rushingStartYardline,
      endingYardline: rushingEndYardline,
      startingSide: rushingStartSide,
      endingSide: rushingEndSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
      },
    );

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        pass,
        delay,
      ],
    );

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: rushingStartYardline,
      startingSide: rushingStartSide,
    );

    footballController.idleAngled();

    component.add(verticalBobbingEffect());

    if (possession == HomeOrAway.away) {
      component.flipHorizontally();
    }

    return component;
  }

  factory FootballRiveComponent.fumbleFromRushWithRun(
    Artboard artboard, {
    required int rushingStartYardline,
    required int finalEndYardline,
    required HomeOrAway rushingStartSide,
    required HomeOrAway finalEndSide,
    required HomeOrAway possession,
    required double screenWidth,
    required FootballController footballController,
  }) {
    int rushOffset;

    if (possession == HomeOrAway.away) {
      if (rushingStartSide == HomeOrAway.away) {
        rushOffset = 5;
      } else {
        rushOffset = -5;
      }
    } else {
      if (rushingStartSide == HomeOrAway.away) {
        rushOffset = -5;
      } else {
        rushOffset = 5;
      }
    }

    final (rushingEndSide, rushingEndYardline) = getSideAndYardlineIfPast50(
      rushingStartSide,
      rushingStartYardline + rushOffset,
    );
    final run = createFootballStraightLineEffect(
      startingYardline: rushingStartYardline,
      endingYardline: rushingEndYardline,
      startingSide: rushingStartSide,
      endingSide: rushingEndSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
      },
    );

    late FootballRiveComponent component;

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: rushingStartYardline,
      endingYardline: finalEndYardline,
      startingSide: rushingStartSide,
      endingSide: finalEndSide,
      screenWidth: screenWidth,
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        run,
        delay,
        rush,
      ],
    );

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: rushingStartYardline,
      startingSide: rushingStartSide,
    );

    footballController.idleAngled();

    if (possession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.fumbleFromKickoff(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required int endingYardline,
    required double screenWidth,
    required FootballController footballController,
  }) {
    final kickoff = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: endingYardline,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      oriented: false,
      startDelay: kKickoffDelay,
      afterDelay: () => footballController.flip(),
      onComplete: () => footballController.fumble(),
    );

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        kickoff,
        delay,
      ],
    );

    return FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    )..flipHorizontally();
  }

  factory FootballRiveComponent.fumbleFromPunt(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required int endingYardline,
    required double screenWidth,
    required FootballController footballController,
  }) {
    late FootballRiveComponent component;

    final (kickToSide, kickToYardline) = getSideAndYardlineIfPast50(
      endingSide,
      startingSide == endingSide ? endingYardline - 10 : endingYardline + 10,
    );

    final punt = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: kickToYardline,
      startingSide: startingSide,
      endingSide: kickToSide,
      screenWidth: screenWidth,
      oriented: false,
      startDelay: kKickoffDelay,
      afterDelay: () => footballController.flip(),
      onComplete: () => footballController.fumble(),
    );

    final fumbleDelay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
      },
    );

    final (rushStartSide, rushStartYardline) = getSideAndYardlineIfPast50(
      kickToSide,
      endingSide == kickToSide ? kickToYardline + 5 : kickToYardline - 5,
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: rushStartYardline,
      endingYardline: endingYardline,
      startingSide: rushStartSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        punt,
        fumbleDelay,
        rush,
      ],
    );

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (startingSide == HomeOrAway.away) {
      component.flipHorizontally();
    }

    return component;
  }

  factory FootballRiveComponent.touchdownFromScoopAndScore(
    Artboard artboard, {
    required int startYardline,
    required HomeOrAway startSide,
    required HomeOrAway endSide,
    required HomeOrAway possession,
    required double screenWidth,
    required FootballController footballController,
  }) {
    int rushOffset;

    if (possession == HomeOrAway.away) {
      if (startSide == HomeOrAway.away) {
        rushOffset = 5;
      } else {
        rushOffset = -5;
      }
    } else {
      if (startSide == HomeOrAway.away) {
        rushOffset = -5;
      } else {
        rushOffset = 5;
      }
    }

    final (rushingEndSide, rushingEndYardline) =
        getSideAndYardlineIfPast50(startSide, startYardline + rushOffset);
    final run = createFootballStraightLineEffect(
      startingYardline: startYardline,
      endingYardline: rushingEndYardline,
      startingSide: startSide,
      endingSide: rushingEndSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
      },
    );

    late FootballRiveComponent component;

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: startYardline,
      endingYardline: -5,
      startingSide: startSide,
      endingSide: endSide,
      screenWidth: screenWidth,
      fixedDuration: 1.5,
    );

    final SequenceEffect sequence = SequenceEffect(
      [
        run,
        delay,
        rush,
      ],
    );

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startYardline,
      startingSide: startSide,
    );

    footballController.idleAngled();

    if (possession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.defensiveTwoPoint(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required FootballController footballController,
    required StarSprite starSprite,
    required double screenWidth,
  }) {
    late FootballRiveComponent component;

    // Initial pass to endzone
    final pass = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: 0,
      startingSide: startingSide,
      endingSide: startingSide,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.idleAngled();
        component
          ..angle = 0
          ..add(verticalBobbingEffect());
        final double starSpriteOffset = getDeltaX(
          0,
          3,
          startingSide,
          startingSide,
          screenWidth,
        ); // show star sprite animation ~3 yards away from ball
        final factor = startingSide == HomeOrAway.away ? -1 : 1;

        starSprite.scaleInOut(
          position: component.position + Vector2(starSpriteOffset * factor, 0),
        );
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: startingYardline,
      endingYardline: -5,
      startingSide: startingSide,
      endingSide: startingSide.opposite,
      fixedDuration: 2,
      screenWidth: screenWidth,
    );

    final sequence = SequenceEffect([
      pass,
      rush,
    ]);

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    return component;
  }

  factory FootballRiveComponent.touchdownFromReturnedFieldGoal(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway endingSide,
    required HomeOrAway possession,
    required FootballController footballController,
    required StarSprite starSprite,
    required double screenWidth,
    required double screenHeight,
  }) {
    late FootballRiveComponent component;

    final arcEffect = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: -12,
      startingSide: startingSide,
      endingSide: endingSide,
      screenWidth: screenWidth,
      oriented: false,
      onComplete: () {
        footballController.idleHorizontal();
        starSprite.scaleInOut(
          position: Vector2(
            getXPosition(-12, endingSide, screenWidth),
            screenHeight * kGoalPostYFactor + 15,
          ),
        );
      },
    );

    final rotateAngle =
        endingSide == HomeOrAway.home ? math.pi / 4 : -math.pi / 4;

    final rotateEffect = RotateEffect.to(
      rotateAngle,
      EffectController(duration: 0),
    );

    final straightLineEffect = createFootballStraightLineEffect(
      startingYardline: -10,
      endingYardline: -10,
      startingSide: startingSide,
      endingSide: startingSide.opposite,
      fixedDuration: 3,
      screenWidth: screenWidth,
    );

    final sequence =
        SequenceEffect([arcEffect, rotateEffect, straightLineEffect]);

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (possession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.touchdownFromFumbledPunt(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway startPossession,
    required HomeOrAway endSide,
    required FootballController footballController,
    required double screenWidth,
  }) {
    late FootballRiveComponent component;

    final punt = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: 15,
      startingSide: startingSide,
      endingSide: startPossession.opposite,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
        component.angle = 0;
      },
    );

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
        // Ideally, we could call footballController.idleAngled() here, but this currently would reset the balls position because of the fumble animation
        // footballController.idleAngled();
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: 25,
      endingYardline: -5,
      startingSide: startPossession.opposite,
      endingSide: endSide,
      fixedDuration: 2,
      screenWidth: screenWidth,
    );

    final sequence = SequenceEffect([
      punt,
      delay,
      rush,
    ]);

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (startPossession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }

  factory FootballRiveComponent.touchdownFromFumbledKickoff(
    Artboard artboard, {
    required int startingYardline,
    required HomeOrAway startingSide,
    required HomeOrAway startPossession,
    required HomeOrAway endSide,
    required FootballController footballController,
    required double screenWidth,
  }) {
    late FootballRiveComponent component;

    final punt = createFootballArcEffect(
      startingYardline: startingYardline,
      endingYardline: 15,
      startingSide: startingSide,
      endingSide: startPossession.opposite,
      screenWidth: screenWidth,
      onComplete: () {
        footballController.fumble();
        component.angle = 0;
      },
    );

    final delay = MoveByEffect(
      Vector2.zero(),
      EffectController(duration: kFumbleDuration),
      onComplete: () {
        component.add(verticalBobbingEffect());
      },
    );

    final rush = createFootballStraightLineEffect(
      startingYardline: 25,
      endingYardline: -8,
      startingSide: startPossession.opposite,
      endingSide: endSide,
      fixedDuration: 2,
      screenWidth: screenWidth,
    );

    final sequence = SequenceEffect([
      punt,
      delay,
      rush,
    ]);

    component = FootballRiveComponent._(
      artboard,
      effect: sequence,
      startingYardline: startingYardline,
      startingSide: startingSide,
    );

    if (startPossession == HomeOrAway.away) {
      component.flipHorizontallyAroundCenter();
    }

    return component;
  }
  FootballRiveComponent._(
    Artboard artboard, {
    required this.effect,
    required this.startingYardline,
    required this.startingSide,
  }) : super(
          artboard: artboard,
        );
  final int startingYardline;
  final HomeOrAway startingSide;
  final Effect effect;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size * .06;
  }

  @override
  void render(Canvas canvas) {
    canvas.save();

    final Matrix4 skewMatrix = Matrix4.inverted(kSkewMatrixSmall.clone());

    if (angle > -math.pi / 2 && angle < math.pi / 2) {
      skewMatrix.setRotationX(math.pi / 3);
    } else {
      skewMatrix.setRotationX(-math.pi / 3);
    }

    // Apply the inverse transformation
    canvas.transform(skewMatrix.storage);

    super.render(canvas);
    canvas.restore();
  }

  @override
  void onLoad() {
    priority = 10;
    anchor = Anchor.center;

    final screenWidth = gameRef.size.x;
    final screenHeight = gameRef.size.y;

    x = getXPosition(startingYardline, startingSide, screenWidth);
    y = screenHeight * kFootballComponentHeightFactor;

    opacity = 0;

    add(OpacityEffect.fadeIn(EffectController(duration: 0.5)));

    add(
      effect
        ..onComplete = () {
          add(
            OpacityEffect.fadeOut(
              EffectController(duration: .5),
              onComplete: () {
                complete();
                removeFromParent();
              },
            ),
          );
        },
    );
  }
}
