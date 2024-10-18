import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';
import '../../util/helper.dart';

class PeriodStartText extends ConsumerWidget {
  const PeriodStartText({
    super.key,
    required this.period,
    required this.maxWidth,
    required this.league,
  });
  final int period;
  final double maxWidth;
  final SportLeague? league;

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
                      getPeriodStartText(period, league).toUpperCase(),
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
