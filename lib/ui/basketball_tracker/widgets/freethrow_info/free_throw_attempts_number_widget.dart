import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../skin/game_tracker_skin.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';
import '../../util/enums.dart';

class FreeThrowAttemptsNumberWidget extends ConsumerWidget {
  const FreeThrowAttemptsNumberWidget(
      {super.key,
      this.madeOrMissed = MadeOrMissed.none,
      required this.isActive,
      required this.text,
      required this.eventType,
      required this.attempt,
      required this.maxWidth});

  final MadeOrMissed? madeOrMissed;
  final bool isActive;
  final String text;
  final BasketballMatchIncidentEventType eventType;
  final int attempt;
  final double maxWidth;

  Widget _buildChildWidget(GameTrackerSkin skin) {
    if (madeOrMissed == MadeOrMissed.made &&
        eventType.isFreeThrowResultEvents) {
      return skin.icons.basketballMake.asImage(width: 16, height: 13.5);
    }

    if (madeOrMissed == MadeOrMissed.missed &&
        eventType.isFreeThrowResultEvents) {
      return skin.icons.basketballMiss.asImage(width: 16, height: 16);
    }

    return AutoSizeText(
      text,
      style: skin.textStyles.basketballHeaderBody2Bold
          .copyWith(color: skin.colors.grey1),
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }

  Color? setBackgroundColor(GameTrackerSkin skin) {
    if (madeOrMissed == MadeOrMissed.made &&
        eventType.isFreeThrowResultEvents) {
      return skin.colors.basketballSuccess;
    }

    if (madeOrMissed == MadeOrMissed.missed &&
        eventType.isFreeThrowResultEvents) {
      return skin.colors.basketballMiss;
    }

    return skin.colors.basketballGrey4.withOpacity(isActive ? 1 : 0.5);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Container(
        width: 22,
        height: 22,
        margin: const EdgeInsets.only(left: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: setBackgroundColor(skin),
            border: Border.all(
                color: skin.colors.grey1.withOpacity(isActive ? 1 : 0.5),
                width: 1)),
        child: _buildChildWidget(skin));
  }
}
