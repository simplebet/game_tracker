import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';
import '../../util/helper.dart';

class FreeThrowAwardedText extends ConsumerWidget {
  const FreeThrowAwardedText({
    super.key,
    required this.teamName,
    required this.teamColor,
    required this.freeThrowType,
    required this.maxWidth,
  });
  final String teamName;
  final Color teamColor;
  final BasketballMatchIncidentEventType freeThrowType;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.translate(
          offset: const Offset(0, 32),
          child: AutoSizeText(
            '$teamName awarded'.toUpperCase(),
            style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                letterSpacing: 1.68,
                height: 1,
                color: skin.colors.basketballGrey1),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          ),
        ),
        Transform.translate(
          // Use this to alter row Y position. Changing the line height messes up the text alignment.
          offset: const Offset(0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 32,
                    width: freeThrowType ==
                            BasketballMatchIncidentEventType
                                .freeThrowAwardedOneAndOne
                        ? 64
                        : 48,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    getFreeThrowNumberText(freeThrowType),
                    textAlign: TextAlign.center,
                    style: skin.textStyles.basketballHeader3Extrabold
                        .copyWith(color: teamColor),
                    textScaleFactor:
                        maxWidth / kBasketballTrackerBaseScreenWidth,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                getFreeThrowText(freeThrowType).toUpperCase(),
                style: skin.textStyles.basketballHeader1Medium.copyWith(
                    letterSpacing: 3.84, color: skin.colors.basketballGrey1),
                textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
