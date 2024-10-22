import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:shimmer/shimmer.dart';

class FootballFieldLoadingWidget extends ConsumerWidget {
  const FootballFieldLoadingWidget({
    required this.screenWidth,
    required this.screenHeight,
    super.key,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();
    final isSmallerScreen = screenWidth < kSmallerScreenWidth;

    return Transform(
      transform: isSmallerScreen ? kSkewMatrixSmall : kSkewMatrix,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: skin.colors.endZone,
            width: screenWidth * kFootballFieldEndzoneWidthFactorFlame,
          ),
          Stack(
            children: [
              Shimmer.fromColors(
                baseColor: skin.colors.field,
                highlightColor: skin.colors.grey3,
                period: const Duration(milliseconds: kShimmerPeriod),
                child: Container(
                  color: skin.colors.field,
                  width: screenWidth *
                      (1 - 2 * kFootballFieldEndzoneWidthFactorFlame),
                ),
              ),
              Column(
                children: [
                  _FootballTrackerLoadingYardLineWidget(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  _FootballTrackerLoadingYardLineTextWidget(
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: skin.colors.endZone,
            width: screenWidth * kFootballFieldEndzoneWidthFactorFlame,
          ),
        ],
      ),
    );
  }
}

class _FootballTrackerLoadingYardLineWidget extends StatelessWidget {
  const _FootballTrackerLoadingYardLineWidget({
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final isSmallerScreen = screenWidth < kSmallerScreenWidth;

    return Container(
      height: screenHeight *
          (isSmallerScreen
              ? kFootballYardLineHeightFactorSmall
              : kFootballYardLineHeightFactor),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * kFootballFieldEndzoneWidthFactorFlame * 2,
      ),
      padding: const EdgeInsets.only(top: kYardLineTopPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final int i in dividerList) ...[
            VerticalDivider(
              width: kFootballFieldEndzoneWidthFactorFlame,
              thickness: 2,
              color: Colors.white.withOpacity(0.2),
            ),
            if (i < 4)
              SizedBox(
                width:
                    screenWidth * kFootballFieldEndzoneWidthFactorFlame * 1.5,
              ),
          ],
        ],
      ),
    );
  }
}

class _FootballTrackerLoadingYardLineTextWidget extends ConsumerWidget {
  const _FootballTrackerLoadingYardLineTextWidget({
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Row(
      children: [
        for (final int i in dividerList) ...[
          Text(
            yardlineList[i].toString(),
            style: skin.textStyles.body4Medium.copyWith(
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              color: skin.colors.grey1,
            ),
          ),
          if (i < 4)
            SizedBox(
              width: screenWidth * kFootballFieldEndzoneWidthFactorFlame * 1,
            ),
        ],
      ],
    );
  }
}
