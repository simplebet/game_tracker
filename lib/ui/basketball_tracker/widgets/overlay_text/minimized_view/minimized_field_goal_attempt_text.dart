import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/models.dart';
import '../../../../../store/game_tracker_skin_store.dart';
import '../../../util/enums.dart';

class MinimizedFieldGoalAttemptText extends ConsumerWidget {
  const MinimizedFieldGoalAttemptText._({
    Key? key,
    this.teamName,
    required this.type,
    required this.result,
    required this.courtSide,
  }) : super(key: key);

  final String? teamName;
  final FieldGoalAttemptType type;
  final FieldGoalAttemptResult result;
  final HomeOrAway courtSide;

  factory MinimizedFieldGoalAttemptText.fieldGoalMadeTwo({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.twoPoint,
        result: FieldGoalAttemptResult.scored,
        courtSide: courtSide);
  }

  factory MinimizedFieldGoalAttemptText.fieldGoalMissedTwo({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.twoPoint,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide);
  }

  factory MinimizedFieldGoalAttemptText.fieldGoalMadeThree({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.threePoint,
        result: FieldGoalAttemptResult.scored,
        courtSide: courtSide);
  }

  factory MinimizedFieldGoalAttemptText.fieldGoalMissedThree({
    required String teamName,
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        teamName: teamName,
        type: FieldGoalAttemptType.threePoint,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide);
  }

  factory MinimizedFieldGoalAttemptText.freeThrowMade({
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        type: FieldGoalAttemptType.freeThrow,
        result: FieldGoalAttemptResult.made,
        courtSide: courtSide);
  }

  factory MinimizedFieldGoalAttemptText.freeThrowMissed({
    required HomeOrAway courtSide,
    required double maxWidth,
  }) {
    return MinimizedFieldGoalAttemptText._(
        type: FieldGoalAttemptType.freeThrow,
        result: FieldGoalAttemptResult.missed,
        courtSide: courtSide);
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

    return AutoSizeText(
      '$fieldGoalAttemptType ${result.name}'.toUpperCase(),
      style: skin.textStyles.basketballHeader4Bold
          .copyWith(color: skin.colors.grey1, fontSize: 16),
      textAlign: courtSide == HomeOrAway.away ? TextAlign.start : TextAlign.end,
    );
  }
}
