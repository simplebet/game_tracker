import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../../store/game_tracker_skin_store.dart';
import '../../../util/helper.dart';

class MinimizedPeriodEndText extends ConsumerWidget {
  const MinimizedPeriodEndText._({
    required this.label,
  });

  final String label;

  factory MinimizedPeriodEndText.halfTime() {
    return const MinimizedPeriodEndText._(label: 'HALFTIME');
  }

  factory MinimizedPeriodEndText.overTime() {
    return const MinimizedPeriodEndText._(
      label: 'OVERTIME',
    );
  }

  factory MinimizedPeriodEndText.period(
      {required int period, required SportLeague? league}) {
    return MinimizedPeriodEndText._(
      label: getPeriodEndText(period, league),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AutoSizeText(
        label.toUpperCase(),
        style: skin.textStyles.basketballHeader1Medium
            .copyWith(letterSpacing: 1, color: skin.colors.basketballGrey1),
        textAlign: TextAlign.center,
      ),
    );
  }
}
