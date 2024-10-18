import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../../../../store/game_tracker_skin_store.dart';
import '../../../util/helper.dart';

class MinimizedFreeThrowAwardedText extends ConsumerWidget {
  const MinimizedFreeThrowAwardedText({
    super.key,
    required this.teamName,
    required this.teamColor,
    required this.freeThrowType,
  });

  final String teamName;
  final Color teamColor;
  final BasketballMatchIncidentEventType freeThrowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            '$teamName awarded'.toUpperCase(),
            style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                letterSpacing: 1.68, color: skin.colors.basketballGrey1),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 16,
                    width: freeThrowType ==
                            BasketballMatchIncidentEventType
                                .freeThrowAwardedOneAndOne
                        ? 48
                        : 32,
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
                  ),
                ],
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                getFreeThrowText(freeThrowType).toUpperCase(),
                style: skin.textStyles.basketballHeader1Medium.copyWith(
                    letterSpacing: 1.68, color: skin.colors.basketballGrey1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
