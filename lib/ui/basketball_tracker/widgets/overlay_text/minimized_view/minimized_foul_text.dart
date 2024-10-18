import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../../../../store/game_tracker_skin_store.dart';

class MinimizedFoulText extends ConsumerWidget {
  const MinimizedFoulText(
      {super.key,
      required this.teamName,
      required this.foulType,
      this.foulRewardType,
      required this.league});

  final String teamName;
  final BasketballMatchIncidentEventType foulType;
  final BasketballMatchIncidentEventType? foulRewardType;
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
        return '2 Pt attempt';
      case BasketballMatchIncidentEventType.foulShootingThree:
        return '3 Pt attempt';
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AutoSizeText(
          '$teamName $isSingularOrPluralCommit'.toUpperCase(),
          style: skin.textStyles.basketballHeader3Extrabold
              .copyWith(fontSize: 18, color: skin.colors.basketballGrey1),
        ),
        const SizedBox(
          width: 6,
        ),
        AutoSizeText(
          foulType.label.toUpperCase(),
          style: skin.textStyles.basketballHeader1Medium
              .copyWith(fontSize: 18, color: skin.colors.basketballGrey1),
        ),
        const SizedBox(
          width: 6,
        ),

        /// sub title for foul overlays
        if (subtext != null)
          AutoSizeText(
            subtext!.toUpperCase(),
            style: skin.textStyles.basketballHeader3Extrabold
                .copyWith(fontSize: 18, color: skin.colors.basketballGrey1),
          ),
      ],
    );
  }
}
