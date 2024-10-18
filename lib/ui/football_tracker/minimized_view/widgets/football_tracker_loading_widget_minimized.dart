import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballFieldLoadingWidgetMinimized extends ConsumerWidget {
  const FootballFieldLoadingWidgetMinimized({
    required this.screenWidth,
    super.key,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Transform(
      transform: kSkewMatrixMinimized,
      alignment: Alignment.center,
      child: Container(
        color: skin.colors.field,
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * kFootballFieldEndzoneWidthFactorFlame,
              decoration: BoxDecoration(
                color: skin.colors.endZone,
                border: Border(
                  right: BorderSide(
                    color: skin.colors.footballFieldEndzoneBorder,
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (final int i in dividerList) ...[
                      Text(
                        yardlineList[i].toString(),
                        style: skin.textStyles.body4Medium.copyWith(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: skin.colors.grey1.withOpacity(0.5),
                        ),
                      ),
                      if (i < 4)
                        SizedBox(
                          width: screenWidth *
                              kFootballFieldEndzoneWidthFactorFlame *
                              1,
                        ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              width: screenWidth * kFootballFieldEndzoneWidthFactorFlame,
              decoration: BoxDecoration(
                color: skin.colors.endZone,
                border: Border(
                  left: BorderSide(
                    color: skin.colors.footballFieldEndzoneBorder,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
