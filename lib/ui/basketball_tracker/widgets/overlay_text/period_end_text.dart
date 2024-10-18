import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';
import 'package:utils/utils.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class PeriodEndText extends ConsumerWidget {
  const PeriodEndText._({
    required this.label,
    required this.maxWidth,
  });

  final String label;
  final double maxWidth;

  factory PeriodEndText.halfTime({required double maxWidth}) {
    return PeriodEndText._(label: 'HALFTIME', maxWidth: maxWidth);
  }

  factory PeriodEndText.overTime({required double maxWidth}) {
    return PeriodEndText._(label: 'OVERTIME', maxWidth: maxWidth);
  }

  factory PeriodEndText.period(
      {required double maxWidth,
      required int period,
      required SportLeague? league}) {
    return PeriodEndText._(
        label: _setPeriodEndText(period, league), maxWidth: maxWidth);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: .6,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 4),
                    child: AutoSizeText(
                      label.toUpperCase(),
                      style: skin.textStyles.basketballHeader1Medium.copyWith(
                          letterSpacing: 3.84,
                          height: 1,
                          color: skin.colors.basketballGrey1),
                      textAlign: TextAlign.center,
                      textScaleFactor:
                          maxWidth / kBasketballTrackerBaseScreenWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String _setPeriodEndText(int period, SportLeague? league) {
  if (league.isNull) {
    return '';
  }

  /// NBA: END of 1/2/3/4, OT period - 4
  if (league == SportLeague.nba) {
    switch (period) {
      case 1:
      case 2:
      case 3:
      case 4:
        return 'END OF $period${formatOrdinalSuffix(period)} QUARTER';
      case 5:
        return 'END OF OT';
      default:
        if (period > 5) {
          return 'END OF OT${period - 4}';
        }
        return '';
    }
  }

  /// CBB: END of 1/2, OT period - 2
  switch (period) {
    case 1:
    case 2:
      return 'END OF $period${formatOrdinalSuffix(period)} HALF';
    case 3:
      return 'END OF OT';
    default:
      if (period > 3) {
        return 'END OF OT${period - 2}';
      }
      return '';
  }
}
