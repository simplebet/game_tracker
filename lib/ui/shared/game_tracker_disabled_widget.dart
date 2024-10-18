import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/game_disabled_match_overlay_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:shimmer/shimmer.dart';

class GameTrackerUnavailableWidget extends ConsumerWidget {
  const GameTrackerUnavailableWidget({
    required this.maxWidth,
    required this.maxHeight,
    required this.reason,
    super.key,
  });

  final double maxWidth;
  final double maxHeight;
  final GameTrackerUnavailableReason reason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      width: maxWidth,
      height: maxHeight,
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GameDisabledMatchOverlayWidget(
            screenWidth: maxWidth,
            reason: reason,
          ),
          Shimmer.fromColors(
            baseColor: skin.colors.grey3,
            highlightColor: skin.colors.grey2,
            period: const Duration(milliseconds: kShimmerPeriod),
            child: Container(
              width: maxWidth * 0.68,
              height: 40,
              decoration: BoxDecoration(
                color: skin.colors.grey3,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Shimmer.fromColors(
              baseColor: skin.colors.grey3,
              highlightColor: skin.colors.grey2,
              period: const Duration(milliseconds: kShimmerPeriod),
              child: Container(
                height: maxHeight * kLastPlayTrayLoadingWidgetHeightFactor,
                color: skin.colors.grey3,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Shimmer.fromColors(
              baseColor: skin.colors.grey2,
              highlightColor: skin.colors.grey1,
              period: const Duration(milliseconds: kShimmerPeriod),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 12,
                      width: maxWidth * 0.45,
                      decoration: BoxDecoration(
                        color: skin.colors.grey2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 18,
                      width: maxWidth * 0.8,
                      decoration: BoxDecoration(
                        color: skin.colors.grey2,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
