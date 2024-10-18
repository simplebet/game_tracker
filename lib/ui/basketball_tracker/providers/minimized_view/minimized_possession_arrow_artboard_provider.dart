// ignore_for_file: implementation_imports

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive/src/rive_core/animation/keyframe_color.dart';

import '../../notifiers/possession_arrow_state_notifier.dart';
import '../../util/constants.dart';
import '../rive_file_provider.dart';

final minimizedPossessionArrowArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file =
      await ref.read(minimizedBasketballTrackerRiveFileProvider.future);

  final artboard = file
      .artboardByName(BasketballTrackerRiveArtboards.possessionArrowMinimized)
      ?.instance();

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      BasketballTrackerRiveStateMachines.possessionArrows,
    );

    if (controller != null) {
      artboard.addController(controller);
    }

    final possessionArrowFill = artboard
        .component<Fill>(BasketballTrackerRiveArtboards.possessionArrowFill);

    KeyFrameColor? keyframe1Color, keyframe2Color;

    for (var animation in artboard.animations) {
      if (animation is LinearAnimation) {
        final keyedObject = animation.keyedObjects.firstWhere((element) {
          return element.id ==
              BasketballTrackerRiveArtboards
                  .possessionArrowMinimizedKeyedObjectID;
        });
        final keyedProperty = keyedObject.keyedProperties.firstWhere((element) {
          return element.id ==
              BasketballTrackerRiveArtboards
                      .possessionArrowMinimizedKeyedObjectID +
                  1;
        });
        final firstKeyFrame = keyedProperty.keyframes.firstWhere((element) {
          return element.id ==
              BasketballTrackerRiveArtboards
                      .possessionArrowMinimizedKeyedObjectID +
                  2;
        });
        final secondKeyFrame = keyedProperty.keyframes.firstWhere((element) {
          return element.id ==
              BasketballTrackerRiveArtboards
                      .possessionArrowMinimizedKeyedObjectID +
                  3;
        });
        if (firstKeyFrame is KeyFrameColor) {
          keyframe1Color = firstKeyFrame;
        }
        if (secondKeyFrame is KeyFrameColor) {
          keyframe2Color = secondKeyFrame;
        }
      }
    }

    if (possessionArrowFill == null) throw Exception('Fill not found');
    if (keyframe1Color == null) throw Exception('Keyframe 1 not found');
    if (keyframe2Color == null) throw Exception('Keyframe 2 not found');

    final possessionArrowStateNotifier =
        ref.read(possessionArrowStateProvider.notifier);

    possessionArrowStateNotifier.initColors(
      arrowFill: possessionArrowFill,
      keyframe1Color: keyframe1Color,
      keyframe2Color: keyframe2Color,
    );

    return artboard;
  }

  throw Exception(
      '${BasketballTrackerRiveArtboards.possessionArrowMinimized} artboard not found');
});
