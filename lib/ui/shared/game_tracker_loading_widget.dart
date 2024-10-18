import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/football_tracker/full_view/widgets/football_tracker_loading_widget.dart';
import 'package:game_tracker/ui/football_tracker/minimized_view/widgets/football_tracker_loading_widget_minimized.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:shimmer/shimmer.dart';

class GameTrackerLoadingWidget extends ConsumerWidget {
  const GameTrackerLoadingWidget({
    required this.maxWidth,
    required this.maxHeight,
    super.key,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    if (maxHeight < 70) {
      return Column(
        children: [
          FootballFieldLoadingWidgetMinimized(
            screenWidth: maxWidth,
          ),
          Container(
            height: 41,
            color: const Color(0xFF1D1D1D),
          ),
        ],
      );
    }

    return Container(
      width: maxWidth,
      height: maxHeight,
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Shimmer.fromColors(
              baseColor: skin.colors.footballFieldShimmerBaseColor,
              highlightColor: skin.colors.footballFieldShimmerHighlightColor
                  .withOpacity(0.7),
              period: const Duration(milliseconds: kShimmerPeriod),
              child: Container(
                width: maxWidth * 0.7,
                height: maxHeight * kLastPlayTrayLoadingWidgetMatchStateFactor,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: skin.colors.footballFieldShimmerBaseColor,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: FootballFieldLoadingWidget(
              screenWidth: maxWidth,
              screenHeight: maxHeight,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Shimmer.fromColors(
              baseColor: skin.colors.footballFieldShimmerBaseColor,
              highlightColor: skin.colors.footballFieldShimmerHighlightColor
                  .withOpacity(0.7),
              period: const Duration(milliseconds: kShimmerPeriod),
              child: Container(
                height: maxHeight * kLastPlayTrayLoadingWidgetHeightFactor,
                color: skin.colors.grey3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
