import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../../shared/scalable_text_widget.dart';
import 'match_status_screen_background.dart';

class PreMatchScreen extends ConsumerWidget {
  const PreMatchScreen({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();
    return MatchStatusScreenBackground(
      size: Size(size.width, size.height),
      child: ScalableTextWidget(
        text: 'Game Upcoming'.toUpperCase(),
        textStyle:
            skin.textStyles.body5Medium.copyWith(color: skin.colors.grey1),
        maxWidth: size.width,
      ),
    );
  }
}
