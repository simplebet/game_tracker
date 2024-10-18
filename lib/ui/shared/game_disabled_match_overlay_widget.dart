import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class GameDisabledMatchOverlayWidget extends ConsumerWidget {
  const GameDisabledMatchOverlayWidget({
    required this.screenWidth,
    required this.reason,
    super.key,
  });

  final double screenWidth;
  final GameTrackerUnavailableReason reason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Transform(
      transform: screenWidth < kSmallerScreenWidth
          ? kSkewMatrixSmallDisabled
          : kSkewMatrixDisabled,
      alignment: Alignment.center,
      child: reason == GameTrackerUnavailableReason.matchDisabled
          ? skin.icons.matchDisabled.asImage()
          : skin.icons.matchNotCoverd.asImage(),
    );
  }
}
