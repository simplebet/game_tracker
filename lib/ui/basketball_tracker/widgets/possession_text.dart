import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../store/game_tracker_skin_store.dart';
import '../util/constants.dart';

class PossessionText extends ConsumerWidget {
  const PossessionText({
    Key? key,
    required this.teamName,
    required this.textAlign,
    required this.maxWidth,
  }) : super(key: key);

  final String teamName;
  final TextAlign textAlign;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return AutoSizeText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "${teamName.toUpperCase()}\n",
            style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                height: 1,
                letterSpacing: 1.68,
                color: skin.colors.basketballGrey1),
          ),
          TextSpan(
            text: 'POSSESSION',
            style: skin.textStyles.basketballHeader4Medium.copyWith(
                height: 1,
                letterSpacing: .8,
                color: skin.colors.basketballGrey1),
          ),
        ],
      ),
      textAlign: textAlign,
      textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
    );
  }
}
