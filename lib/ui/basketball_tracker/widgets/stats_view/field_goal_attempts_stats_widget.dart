import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sport_model/models/enums.dart';

import '../../../../store/game_tracker_skin_store.dart';
import 'field_goal_attempts_progress_bar_widget.dart';

class FieldGoalAttemptsStatsWidget extends ConsumerWidget {
  const FieldGoalAttemptsStatsWidget(
      {required this.size,
      required this.title,
      required this.awayTeamMakesCount,
      required this.homeTeamMakesCount,
      required this.awayTeamAttemptsCount,
      required this.homeTeamAttemptsCount,
      required this.awayTeamAttemptsPercentage,
      required this.homeTeamAttemptsPercentage,
      super.key});

  final Size size;
  final String title;
  final int? awayTeamMakesCount;
  final int? homeTeamMakesCount;
  final int? awayTeamAttemptsCount;
  final int? homeTeamAttemptsCount;
  final double? awayTeamAttemptsPercentage;
  final double? homeTeamAttemptsPercentage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.read(gameTrackerSkinProvider).skin;

    return Container(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: skin.textStyles.basketballHeader6Bold
                .copyWith(color: skin.colors.basketballGrey2),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// away team
              FieldGoalAttemptsProgressBarWidget(
                size: size,
                makesCount: awayTeamMakesCount,
                attemptsCount: awayTeamAttemptsCount,
                attemptsCountPercentage: awayTeamAttemptsPercentage,
                homeOrAway: HomeOrAway.away,
              ),

              /// home team
              FieldGoalAttemptsProgressBarWidget(
                size: size,
                makesCount: homeTeamMakesCount,
                attemptsCount: homeTeamAttemptsCount,
                attemptsCountPercentage: homeTeamAttemptsPercentage,
                homeOrAway: HomeOrAway.home,
              ),
            ],
          )
        ],
      ),
    );
  }
}
