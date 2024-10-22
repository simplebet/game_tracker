import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/custom_progress_bar.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballMatchStateGameClockWidget extends ConsumerWidget {
  const FootballMatchStateGameClockWidget({
    required this.gameClock,
    required this.maxWidth,
    required this.maxHeight,
    this.isClockRunning = false,
    super.key,
  });

  final int gameClock;
  final bool isClockRunning;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Container(
      width: maxWidth * 0.11,
      height: maxHeight * 0.075,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 1.0],
          colors: [
            skin.colors.background,
            skin.colors.background.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          ScalableTextWidget(
            text: formatGameClock(gameClock),
            textStyle: skin.textStyles.footballGameClock
                .copyWith(color: skin.colors.grey1),
            maxWidth: maxWidth,
          ),
          if (isClockRunning)
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: CustomProgressBar(
                height: 1,
              ),
            ),
        ],
      ),
    );
  }
}
