// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:rive/src/rive_core/animation/keyframe_color.dart';

import '../../../models/models.dart';

final possessionArrowStateProvider = StateNotifierProvider.autoDispose<
    PossessionArrowStateNotifier,
    PossessionArrowState>((ref) => PossessionArrowStateNotifier());

enum PossessionArrowType {
  possession,
  defensiveRebound,
  offensiveRebound,
}

class PossessionArrowStateNotifier extends StateNotifier<PossessionArrowState> {
  PossessionArrowStateNotifier() : super(const PossessionArrowState());

  void initAnimationController(AnimationController animationController) {
    if (mounted) {
      state = state.copyWith(
        animationController: animationController,
      );
    }
  }

  void initColors({
    required Fill arrowFill,
    required KeyFrameColor keyframe1Color,
    required KeyFrameColor keyframe2Color,
  }) {
    if (mounted) {
      state = state.copyWith(
        arrowFill: arrowFill,
        keyframe1Color: keyframe1Color,
        keyframe2Color: keyframe2Color,
      );
    }
  }

  void showArrow({
    required HomeOrAway courtSide,
    required Color arrowColor,
    required String teamName,
    required PossessionArrowType arrowType,
  }) {
    if (!mounted) {
      return;
    }

    state = state.copyWith(
      showArrow: true,
      courtSide: courtSide,
      teamName: teamName,
      arrowType: arrowType,
    );
    if (state.animationController != null) {
      if (!mounted) {
        return;
      }
      final animation =
          Tween<double>(begin: .66, end: 1).animate(state.animationController!);

      animation.addListener(() {
        Fill? newFill = state.arrowFill;

        if (newFill != null) {
          newFill.paint.color = arrowColor.withOpacity(animation.value);

          newFill.paint.color =
              newFill.paint.color.withOpacity(animation.value);

          final KeyFrameColor? newKeyframe1Color = state.keyframe1Color;
          final KeyFrameColor? newKeyframe2Color = state.keyframe2Color;

          if (newKeyframe1Color != null && newKeyframe2Color != null) {
            newKeyframe1Color.value = arrowColor.withOpacity(.5).value;
            newKeyframe2Color.value = arrowColor.withOpacity(0).value;
          }

          state = state.copyWith(
            arrowFill: newFill,
            keyframe1Color: newKeyframe1Color,
            keyframe2Color: newKeyframe2Color,
          );
        }
      });

      state.animationController!.repeat(
        period: const Duration(seconds: 3),
        reverse: true,
      );
    }
  }

  void hidePossessionArrow() {
    if (mounted) {
      state = state.copyWith(
        showArrow: false,
      );
    }

    if (state.animationController != null) {
      state.animationController!.reset();
    }
  }

  void showReboundText() {
    if (mounted) {
      state = state.copyWith(
        showReboundText: true,
      );
    }
  }

  void hideReboundText() {
    if (mounted) {
      state = state.copyWith(
        showReboundText: false,
      );
    }
  }
}

class PossessionArrowState {
  const PossessionArrowState({
    this.showArrow = false,
    this.arrowType,
    this.courtSide = HomeOrAway.home,
    this.arrowFill,
    this.keyframe1Color,
    this.keyframe2Color,
    this.teamName = '',
    this.animationController,
    this.showReboundText = false,
  });

  final bool showArrow;
  final PossessionArrowType? arrowType;

  // Where to show
  final HomeOrAway courtSide;

  // Colors
  final Fill? arrowFill;
  // These are the colors of the keyframes in the Rive file. They automatically
  // animate from 50% to 0% opacity. We just need to set the correct color.
  final KeyFrameColor? keyframe1Color;
  final KeyFrameColor? keyframe2Color;

  // Text
  final String teamName;

  // Animation
  final AnimationController? animationController;

  final bool showReboundText;

  PossessionArrowState copyWith({
    bool? showArrow,
    PossessionArrowType? arrowType,
    HomeOrAway? courtSide,
    Fill? arrowFill,
    KeyFrameColor? keyframe1Color,
    KeyFrameColor? keyframe2Color,
    String? teamName,
    AnimationController? animationController,
    bool? showReboundText,
  }) {
    return PossessionArrowState(
      showArrow: showArrow ?? this.showArrow,
      arrowType: arrowType ?? this.arrowType,
      courtSide: courtSide ?? this.courtSide,
      arrowFill: arrowFill ?? this.arrowFill,
      keyframe1Color: keyframe1Color ?? this.keyframe1Color,
      keyframe2Color: keyframe2Color ?? this.keyframe2Color,
      teamName: teamName ?? this.teamName,
      animationController: animationController ?? this.animationController,
      showReboundText: showReboundText ?? this.showReboundText,
    );
  }
}
