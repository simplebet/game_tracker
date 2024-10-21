import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/scalable_text_widget.dart';

class PreMatchPlayTrayWidget extends ConsumerWidget {
  const PreMatchPlayTrayWidget({
    Key? key,
    required this.maxWidth,
    required this.match,
  }) : super(key: key);

  final double maxWidth;
  final Match<FootballData> match;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ScalableTextWidget(
                  text: match.homeTeam!.shortName?.toUpperCase() ?? '',
                  textStyle: skin.textStyles.body4Medium
                      .copyWith(color: skin.colors.grey1),
                  maxWidth: maxWidth,
                ),
              ],
            ),
            Row(
              children: [
                ScalableTextWidget(
                  text: match.awayTeam?.shortName?.toUpperCase() ?? '',
                  textStyle: skin.textStyles.body4Medium
                      .copyWith(color: skin.colors.grey1),
                  maxWidth: maxWidth,
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScalableTextWidget(
              text: match.league?.name.toUpperCase() ?? '',
              textStyle: skin.textStyles.body4Medium
                  .copyWith(color: skin.colors.grey1),
              maxWidth: maxWidth,
            ),
            ScalableTextWidget(
              text: formatDate(match.startTime!).toUpperCase(),
              textStyle: skin.textStyles.body4Medium
                  .copyWith(color: skin.colors.grey1),
              maxWidth: maxWidth,
            ),
          ],
        )
      ],
    );
  }
}
