import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class FoulText extends ConsumerWidget {
  const FoulText(
      {super.key,
      required this.teamName,
      required this.foulType,
      this.foulRewardType,
      required this.maxWidth,
      required this.league});
  final String teamName;
  final BasketballMatchIncidentEventType foulType;
  final BasketballMatchIncidentEventType? foulRewardType;
  final double maxWidth;
  final SportLeague? league;

  String? get subtext {
    switch (foulType) {
      case BasketballMatchIncidentEventType.foulFloor:
        if (foulRewardType ==
            BasketballMatchIncidentEventType.freeThrowAwardedOneAndOne) {
          return 'One-and-one';
        } else if (foulRewardType ==
            BasketballMatchIncidentEventType.freeThrowAwardedTwo) {
          return '${league == SportLeague.cbb ? 'Double ' : ''}Bonus';
        }

        return null;
      case BasketballMatchIncidentEventType.foulShootingTwo:
        return '2 point attempt';
      case BasketballMatchIncidentEventType.foulShootingThree:
        return '3 point attempt';
      case BasketballMatchIncidentEventType.foulTechnicalA:
        return league == SportLeague.nba ? null : 'Class A';
      case BasketballMatchIncidentEventType.foulTechnicalB:
        return league == SportLeague.nba ? null : 'Class B';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;
    final isSingularOrPluralCommit =
        league == SportLeague.nba ? 'commit' : 'commits';

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 6),
            child: skin.icons.foulWarped.asImage(width: 32, height: 32)),
        Flexible(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  '$teamName $isSingularOrPluralCommit'.toUpperCase(),
                  style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                      height: 1,
                      letterSpacing: 1.68,
                      color: skin.colors.basketballGrey1),
                  textAlign: TextAlign.center,
                  textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
                  maxLines: 1,
                ),

                /// main title for foul overlays
                AutoSizeText(
                  foulType.label.toUpperCase(),
                  style: skin.textStyles.basketballHeader1Medium.copyWith(
                      height: .93,
                      letterSpacing: 3.84,
                      color: skin.colors.basketballGrey1),
                  textAlign: TextAlign.center,
                  textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
                  maxLines: 1,
                ),

                /// sub title for foul overlays
                if (subtext != null)
                  AutoSizeText(
                    subtext!.toUpperCase(),
                    style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                        height: .8,
                        letterSpacing: 1.68,
                        color: skin.colors.basketballGrey1),
                    textAlign: TextAlign.center,
                    textScaleFactor:
                        maxWidth / kBasketballTrackerBaseScreenWidth,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
