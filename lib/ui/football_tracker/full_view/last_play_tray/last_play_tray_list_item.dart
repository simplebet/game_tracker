import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class LastPlayTrayListItem extends ConsumerWidget {
  const LastPlayTrayListItem({
    required this.isScoringPlay,
    required this.maxWidth,
    required this.playDetail,
    required this.playSummary,
    this.showSubtitle = true,
    super.key,
  });

  final bool isScoringPlay;
  final double maxWidth;
  final String playDetail;
  final String playSummary;
  final bool showSubtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: isScoringPlay
              ? skin.colors.grey1.withOpacity(0.25)
              : skin.colors.grey4,
          width: maxWidth,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: maxWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScalableTextWidget(
                  text: playDetail.toUpperCase(),
                  textStyle: skin.textStyles.header1
                      .copyWith(color: skin.colors.grey1),
                  maxWidth: maxWidth,
                ),
                if (showSubtitle) ...[
                  ScalableTextWidget(
                    text: playSummary.toUpperCase(),
                    textStyle: skin.textStyles.body4Thin
                        .copyWith(color: skin.colors.grey2),
                    maxWidth: maxWidth,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.04),
          child: Divider(color: skin.colors.grey3, height: 1),
        ),
      ],
    );
  }
}
