import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/match_status_screens/match_status_screen_background.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class PreMatchScreen extends ConsumerWidget {
  const PreMatchScreen({required this.size, super.key});

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
