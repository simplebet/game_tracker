import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballTimeoutCounter extends StatelessWidget {
  const FootballTimeoutCounter({
    super.key,
    required this.homeOrAway,
    required this.homeTeamTimeoutsLeft,
    required this.awayTeamTimeoutsLeft,
  });

  final HomeOrAway homeOrAway;
  final int awayTeamTimeoutsLeft;
  final int homeTeamTimeoutsLeft;

  @override
  Widget build(BuildContext context) {
    final skin = GameTrackerSkin();
    return Padding(
      padding: homeOrAway == HomeOrAway.away
          ? const EdgeInsets.only(left: 6)
          : const EdgeInsets.only(right: 6),
      child: SizedBox(
        width: 6,
        height: 20,
        child: Column(children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: 5.75,
              height: 5.75,
              decoration: BoxDecoration(
                  border: Border.all(color: skin.colors.grey1),
                  color: _shouldFillTimeoutCounter(
                          index: 0,
                          homeOrAway: homeOrAway,
                          homeTeamTimeoutsLeft: homeTeamTimeoutsLeft,
                          awayTeamTimeoutsLeft: awayTeamTimeoutsLeft)
                      ? skin.colors.grey1
                      : null,
                  shape: BoxShape.circle),
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: 5.75,
              height: 5.75,
              decoration: BoxDecoration(
                  border: Border.all(color: skin.colors.grey1),
                  color: _shouldFillTimeoutCounter(
                          index: 1,
                          homeOrAway: homeOrAway,
                          homeTeamTimeoutsLeft: homeTeamTimeoutsLeft,
                          awayTeamTimeoutsLeft: awayTeamTimeoutsLeft)
                      ? skin.colors.grey1
                      : null,
                  shape: BoxShape.circle),
            ),
          ),
          const SizedBox(height: 2),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              width: 5.75,
              height: 5.75,
              decoration: BoxDecoration(
                  border: Border.all(color: skin.colors.grey1),
                  color: _shouldFillTimeoutCounter(
                          index: 2,
                          homeOrAway: homeOrAway,
                          homeTeamTimeoutsLeft: homeTeamTimeoutsLeft,
                          awayTeamTimeoutsLeft: awayTeamTimeoutsLeft)
                      ? skin.colors.grey1
                      : null,
                  shape: BoxShape.circle),
            ),
          ),
        ]),
      ),
    );
  }
}

bool _shouldFillTimeoutCounter(
    {required int index,
    required HomeOrAway homeOrAway,
    required int awayTeamTimeoutsLeft,
    required int homeTeamTimeoutsLeft}) {
  final isAway = homeOrAway == HomeOrAway.away;

  var awayTeamTimeoutCounterFilled = [false, false, false];
  for (int i = 0; i < awayTeamTimeoutsLeft; i++) {
    awayTeamTimeoutCounterFilled[2 - i] = true;
  }

  var homeTeamTimeoutCounterFilled = [false, false, false];
  for (int i = 0; i < homeTeamTimeoutsLeft; i++) {
    homeTeamTimeoutCounterFilled[2 - i] = true;
  }
  return isAway && awayTeamTimeoutCounterFilled[index] ||
      !isAway && homeTeamTimeoutCounterFilled[index];
}
