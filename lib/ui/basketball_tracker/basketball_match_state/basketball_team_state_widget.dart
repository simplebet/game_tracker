import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'active_basketball_team_state_widget.dart';
import 'ended_basketball_team_state_widget.dart';
import 'prematch_basketball_team_state_widget.dart';

class BasketballTeamStateWidget extends StatefulWidget {
  const BasketballTeamStateWidget({
    super.key,
    required this.teamColor,
    required this.isHomeTeam,
    required this.teamName,
    required this.score,
    required this.teamFouls,
    required this.status,
    required this.maxWidth,
    required this.league,
    required this.period,
    required this.teamBonus,
    required this.teamDoubleBonus,
  });

  final Color teamColor;
  final bool isHomeTeam;
  final String teamName;
  final int score;
  final int teamFouls;
  final MatchStatus status;
  final double maxWidth;
  final SportLeague league;
  final int period;
  final bool teamBonus;
  final bool teamDoubleBonus;

  @override
  State<BasketballTeamStateWidget> createState() =>
      _BasketballTeamStateWidgetState();
}

class _BasketballTeamStateWidgetState extends State<BasketballTeamStateWidget> {
  late int score;
  late int teamFouls;
  late bool teamBonus;
  late bool teamDoubleBonus;

  @override
  void initState() {
    super.initState();
    score = widget.score;
    teamFouls = widget.teamFouls;
    teamBonus = widget.teamBonus;
    teamDoubleBonus = widget.teamDoubleBonus;
  }

  @override
  void didUpdateWidget(covariant BasketballTeamStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// when score changes from match_update
    /// delay the update to widgets for
    /// free throws attempts
    /// field goals attempts
    if (widget.score != oldWidget.score) {
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          score = widget.score;
        });
      });
    } else {
      setState(() {
        score = oldWidget.score;
      });
    }

    /// foul events
    if (widget.teamFouls != oldWidget.teamFouls) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          teamFouls = widget.teamFouls;
        });
      });
    } else {
      setState(() {
        teamFouls = oldWidget.teamFouls;
      });
    }

    /// bonus and double bonus events
    if (widget.teamBonus != oldWidget.teamBonus) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          teamBonus = widget.teamBonus;
        });
      });
    } else {
      setState(() {
        teamBonus = oldWidget.teamBonus;
      });
    }

    if (widget.teamDoubleBonus != oldWidget.teamDoubleBonus) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          teamDoubleBonus = widget.teamDoubleBonus;
        });
      });
    } else {
      setState(() {
        teamDoubleBonus = oldWidget.teamDoubleBonus;
      });
    }
  }

  Widget _buildTeamStateWidget() {
    switch (widget.status) {
      case MatchStatus.active:
        return ActiveBasketballTeamStateWidget(
          teamFouls: teamFouls,
          isHomeTeam: widget.isHomeTeam,
          score: score,
          teamName: widget.teamName,
          maxWidth: widget.maxWidth,
          league: widget.league,
          teamBonus: teamBonus,
          teamDoubleBonus: teamDoubleBonus,
          period: widget.period,
          teamColor: widget.teamColor,
        );
      case MatchStatus.preMatch:
        return PrematchBasketballTeamStateWidget(
            isHomeTeam: widget.isHomeTeam,
            teamName: widget.teamName,
            maxWidth: widget.maxWidth);
      case MatchStatus.ended:
        return EndedBasketballTeamStateWidget(
            isHomeTeam: widget.isHomeTeam,
            teamName: widget.teamName,
            score: score,
            maxWidth: widget.maxWidth);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.teamColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 0,
      ),
      child: _buildTeamStateWidget(),
    );
  }
}
