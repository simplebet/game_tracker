import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class EndedBasketballGameClockWidgetMinimized extends ConsumerWidget {
  const EndedBasketballGameClockWidgetMinimized(
      {super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          'FINAL',
          style: skin.textStyles.basketballHeaderBody1Medium
              .copyWith(letterSpacing: 0.12, color: skin.colors.grey1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
        ),
      ],
    );
  }
}
