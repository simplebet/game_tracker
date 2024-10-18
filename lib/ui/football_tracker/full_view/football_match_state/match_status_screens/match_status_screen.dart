import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_model.dart';

import 'pre_match_screen.dart';

class MatchStatusScreen extends StatelessWidget {
  const MatchStatusScreen(
      {Key? key,
      required this.match,
      required this.size,})
      : super(key: key);

  final Match<FootballData> match;
  final Size size;

  @override
  Widget build(BuildContext context) {
    if (match.status == MatchStatus.preMatch) {
      return PreMatchScreen(
        size: size,
      );
    }
    return const SizedBox.shrink();
  }
}
