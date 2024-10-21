import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/football_timeout_counter_widget.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballTeamLogoNameWidget extends ConsumerWidget {
  const FootballTeamLogoNameWidget(
      {Key? key,
      required this.primaryColor,
      required this.logoUrl,
      required this.shortName,
      required this.matchStatus,
      required this.score,
      required this.homeOrAway,
      required this.maxWidth,
      required this.maxHeight,
      required this.awayTeamTimeoutsLeft,
      required this.homeTeamTimeoutsLeft})
      : super(key: key);

  final Color primaryColor;
  final String? logoUrl;
  final String? shortName;
  final MatchStatus? matchStatus;
  final int? score;
  final HomeOrAway homeOrAway;
  final double maxWidth;
  final double maxHeight;
  final int? awayTeamTimeoutsLeft;
  final int? homeTeamTimeoutsLeft;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: skin.colors.grey5.withOpacity(0.5),
            blurRadius: 4.0,
            spreadRadius: 0.5,
            offset: const Offset(2, 4),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: homeOrAway == HomeOrAway.away
              ? const Radius.circular(6)
              : Radius.zero,
          bottomLeft: homeOrAway == HomeOrAway.away
              ? const Radius.circular(6)
              : Radius.zero,
          topRight: homeOrAway == HomeOrAway.home
              ? const Radius.circular(6)
              : Radius.zero,
          bottomRight: homeOrAway == HomeOrAway.home
              ? const Radius.circular(6)
              : Radius.zero,
        ),
      ),
      child: Row(
        textDirection: homeOrAway == HomeOrAway.away
            ? TextDirection.ltr
            : TextDirection.rtl,
        children: [
          if (homeTeamTimeoutsLeft != null && awayTeamTimeoutsLeft != null)
            FootballTimeoutCounter(
              homeOrAway: homeOrAway,
              awayTeamTimeoutsLeft: awayTeamTimeoutsLeft!,
              homeTeamTimeoutsLeft: homeTeamTimeoutsLeft!,
            ),
          Container(
            height: maxHeight * kBaseMatchStateWidgetHeightFactor,
            padding: homeOrAway == HomeOrAway.away
                ? const EdgeInsets.only(
                    left: 4,
                    right: 8,
                  )
                : const EdgeInsets.only(
                    left: 8,
                    right: 4,
                  ),
            alignment: Alignment.center,
            child: ScalableTextWidget(
              text: shortName ?? '',
              textStyle: skin.textStyles.footballMatchStateTeam
                  .copyWith(color: skin.colors.grey1, height: 1),
              maxWidth: maxWidth,
            ),
          ),
          Container(
            height: maxHeight * kBaseMatchStateWidgetHeightFactor,
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            color: skin.colors.background,
            alignment: Alignment.center,
            child: ScalableTextWidget(
                text: score.toString(),
                textStyle: skin.textStyles.footballMatchStateScore
                    .copyWith(color: skin.colors.grey1, height: 1),
                maxWidth: maxWidth),
          )
        ],
      ),
    );
  }
}

class TeamLogoWrapperWidget extends ConsumerWidget {
  const TeamLogoWrapperWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: skin.colors.grey5.withOpacity(0.15),
            blurRadius: 2.0,
            spreadRadius: 0.5,
          )
        ]),
        child: child);
  }
}
