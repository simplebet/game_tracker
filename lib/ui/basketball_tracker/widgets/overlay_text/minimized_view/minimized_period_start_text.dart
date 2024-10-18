import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../../store/game_tracker_skin_store.dart';
import '../../../util/helper.dart';

class MinimizedPeriodStartText extends ConsumerWidget {
  const MinimizedPeriodStartText({
    super.key,
    required this.period,
    required this.league,
  });
  final int period;
  final SportLeague? league;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AutoSizeText(getPeriodStartText(period, league).toUpperCase(),
          textAlign: TextAlign.center,
          style: skin.textStyles.basketballHeader1Medium
              .copyWith(letterSpacing: 1, color: skin.colors.basketballGrey1)),
    );
  }
}
