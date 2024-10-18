import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

double getMaxWidth(BuildContext context, BoxConstraints constraints) =>
    constraints.hasBoundedWidth
        ? constraints.maxWidth
        : MediaQuery.of(context).size.width;

class GameTrackerErrorWidget extends ConsumerWidget {
  const GameTrackerErrorWidget({super.key, this.errorDetails});

  final FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = getMaxWidth(context, constraints);

        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Transform(
              transform: kSkewMatrix,
              alignment: Alignment.center,
              child: Container(
                color: skin.colors.grey4,
              ),
            ),
            ScalableTextWidget(
              text:
                  'There Was a Problem Loading the Tracker \nPlease Try Again Later'
                      .toUpperCase(),
              textStyle: skin.textStyles.body4Medium
                  .copyWith(color: skin.colors.grey1),
              maxWidth: maxWidth,
            ),
          ],
        );
      },
    );
  }
}
