import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';
import '../../util/enums.dart';

class FieldGoalAttemptText extends ConsumerWidget {
  const FieldGoalAttemptText._({
    Key? key,
    this.teamName,
    required this.type,
    required this.result,
    required this.courtSide,
    required this.maxWidth,
  }) : super(key: key);

  final String? teamName;
  final FieldGoalAttemptType type;
  final FieldGoalAttemptResult result;
  final HomeOrAway courtSide;
  final double maxWidth;

  factory FieldGoalAttemptText.fieldGoalMadeTwo({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.twoPoint,
        result: FieldGoalAttemptResult.scored,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  factory FieldGoalAttemptText.fieldGoalMissedTwo({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.twoPoint,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  factory FieldGoalAttemptText.fieldGoalMadeThree({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.threePoint,
        result: FieldGoalAttemptResult.scored,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  factory FieldGoalAttemptText.fieldGoalMissedThree({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.threePoint,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  factory FieldGoalAttemptText.freeThrowMade({
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        type: FieldGoalAttemptType.freeThrow,
        result: FieldGoalAttemptResult.made,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  factory FieldGoalAttemptText.freeThrowMissed({
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return FieldGoalAttemptText._(
        type: FieldGoalAttemptType.freeThrow,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide,
        maxWidth: maxWidth);
  }

  String get fieldGoalAttemptType {
    switch (type) {
      case FieldGoalAttemptType.twoPoint:
        return '2 POINTS';
      case FieldGoalAttemptType.threePoint:
        return '3 POINTS';
      case FieldGoalAttemptType.freeThrow:
        return 'FREE THROW';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return AutoSizeText.rich(
      TextSpan(
        children: [
          if (teamName != null)
            TextSpan(
              text: teamName?.toUpperCase(),
              style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                  height: 1.6, letterSpacing: 1.68, color: skin.colors.grey1),
            ),
          TextSpan(
            text: "\n$fieldGoalAttemptType\n".toUpperCase(),
            style: teamName != null
                ? skin.textStyles.basketballHeader2Medium.copyWith(
                    height: 0.85, letterSpacing: 1.6, color: skin.colors.grey1)
                : skin.textStyles.basketballHeader3Extrabold.copyWith(
                    height: 1.6, letterSpacing: 1.68, color: skin.colors.grey1),
          ),
          TextSpan(
            text: result.name.toUpperCase(),
            style: skin.textStyles.basketballHeader1Medium.copyWith(
                height: .93,
                letterSpacing: 3.84,
                color: skin.colors.basketballGrey1),
          ),
        ],
      ),
      textAlign: courtSide == HomeOrAway.away ? TextAlign.start : TextAlign.end,
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }
}
