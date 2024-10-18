import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_providers.dart';
import 'field_goal_attempts_stats_widget.dart';

class StatsViewFieldGoalAttemptsWidget extends ConsumerWidget {
  const StatsViewFieldGoalAttemptsWidget({required this.size, super.key});

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceStore = ref.read(gameTrackerServiceStoreProvider);

    if (serviceStore.statsUpdate == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14).copyWith(bottom: 8),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Color(0xFF2C2C2C),
          width: 1.0,
        ),
      )),
      child: Column(
        children: [
          Observer(builder: (_) {
            return FieldGoalAttemptsStatsWidget(
              size: size,
              awayTeamMakesCount:
                  serviceStore.statsUpdate?.match?.awayFieldGoalMakes,
              homeTeamMakesCount:
                  serviceStore.statsUpdate?.match?.homeFieldGoalMakes,
              awayTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.awayFieldGoalAttempts,
              homeTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.homeFieldGoalAttempts,
              awayTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.awayFieldGoalPercentage,
              homeTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.homeFieldGoalPercentage,
              title: 'field goal attempts',
            );
          }),
          Observer(builder: (_) {
            return FieldGoalAttemptsStatsWidget(
              size: size,
              awayTeamMakesCount:
                  serviceStore.statsUpdate?.match?.awayTwoPointMakes,
              homeTeamMakesCount:
                  serviceStore.statsUpdate?.match?.homeTwoPointMakes,
              awayTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.awayTwoPointAttempts,
              homeTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.homeTwoPointAttempts,
              awayTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.awayTwoPointPercentage,
              homeTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.homeTwoPointPercentage,
              title: '2 point attempts',
            );
          }),
          Observer(builder: (_) {
            return FieldGoalAttemptsStatsWidget(
              size: size,
              awayTeamMakesCount:
                  serviceStore.statsUpdate?.match?.awayThreePointMakes,
              homeTeamMakesCount:
                  serviceStore.statsUpdate?.match?.homeThreePointMakes,
              awayTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.awayThreePointAttempts,
              homeTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.homeThreePointAttempts,
              awayTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.awayThreePointPercentage,
              homeTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.homeThreePointPercentage,
              title: '3 point attempts',
            );
          }),
          Observer(builder: (_) {
            return FieldGoalAttemptsStatsWidget(
              size: size,
              awayTeamMakesCount:
                  serviceStore.statsUpdate?.match?.awayFreeThrowMakes,
              homeTeamMakesCount:
                  serviceStore.statsUpdate?.match?.homeFreeThrowMakes,
              awayTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.awayFreeThrowAttempts,
              homeTeamAttemptsCount:
                  serviceStore.statsUpdate?.match?.homeFreeThrowAttempts,
              awayTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.awayFreeThrowPercentage,
              homeTeamAttemptsPercentage:
                  serviceStore.statsUpdate?.match?.homeFreeThrowPercentage,
              title: 'free throw attempts',
            );
          }),
        ],
      ),
    );
  }
}
