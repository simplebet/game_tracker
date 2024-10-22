import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/match_model.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/football_match_state_animation_wrapper.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/football_match_state_game_clock_widget.dart';
import 'package:game_tracker/ui/football_tracker/full_view/football_match_state/football_team_logo_name_widget.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/shared/team_color.dart';
import 'package:game_tracker/ui/shared/team_name_formatter.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class FootballTrackerMatchStateWidget extends ConsumerStatefulWidget {
  const FootballTrackerMatchStateWidget({
    required this.match,
    required this.maxWidth,
    required this.maxHeight,
    required this.lastFootballPlay,
    super.key,
  });

  final Match<FootballData>? match;
  final double maxWidth;
  final double maxHeight;
  final FootballMatchIncidentModel? lastFootballPlay;

  @override
  FootballTrackerMatchStateWidgetState createState() =>
      FootballTrackerMatchStateWidgetState();
}

class FootballTrackerMatchStateWidgetState
    extends ConsumerState<FootballTrackerMatchStateWidget> {
  late bool isDuringKickoff;
  late bool matchStateUpdated;
  late bool periodUpdated;

  @override
  void initState() {
    super.initState();
    isDuringKickoff = false;
    matchStateUpdated = false;
    periodUpdated = false;
  }

  @override
  void didUpdateWidget(covariant FootballTrackerMatchStateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.lastFootballPlay != widget.lastFootballPlay) {
      if (widget.lastFootballPlay?.end?.down == -1) {
        isDuringKickoff = true;
      } else {
        isDuringKickoff = false;
      }

      if (oldWidget.lastFootballPlay?.end?.down !=
              widget.lastFootballPlay?.end?.down ||
          oldWidget.lastFootballPlay?.end?.distance !=
              widget.lastFootballPlay?.end?.distance ||
          oldWidget.lastFootballPlay?.end?.side !=
              widget.lastFootballPlay?.end?.side ||
          oldWidget.lastFootballPlay?.end?.yardline !=
              widget.lastFootballPlay?.end?.yardline) {
        matchStateUpdated = true;
      } else {
        matchStateUpdated = false;
      }
    }

    if (oldWidget.match != widget.match) {
      if ((oldWidget.match as MatchModel?)?.periodToUse !=
          (widget.match as MatchModel?)?.periodToUse) {
        periodUpdated = true;
      } else {
        periodUpdated = false;
      }
    }
  }

  String get period {
    final period = (widget.match as MatchModel?)!.periodToUse;

    if (period >= 5) {
      return 'OT${period > 5 ? '${period - 4}' : ''}';
    }

    return '$period${formatOrdinalSuffix(period).toUpperCase()}';
  }

  /// on app launch the last play can be empty or null
  /// use match sport data instead
  int? get down {
    if (widget.lastFootballPlay != null) {
      return widget.lastFootballPlay?.end?.down;
    }
    return widget.match?.sportData?.down;
  }

  String get downLabel {
    if (down == null) {
      return '';
    }
    return down.toString();
  }

  int? get distance {
    if (widget.lastFootballPlay != null) {
      return widget.lastFootballPlay?.end?.distance;
    }
    return widget.match?.sportData?.distance;
  }

  bool get isGoalToGo {
    if (widget.lastFootballPlay != null) {
      return widget.lastFootballPlay?.meta?.goalToGo ?? false;
    }
    return widget.match?.sportData?.goalToGo ?? false;
  }

  String get distanceLabel {
    if (distance == null) {
      return '';
    }
    return distance.toString();
  }

  String get fieldSide {
    if (widget.lastFootballPlay != null) {
      return formatFieldSide(
        widget.lastFootballPlay?.end?.side,
        widget.match?.homeTeam,
        widget.match?.awayTeam,
      );
    }
    return formatFieldSide(
      widget.match?.sportData?.fieldSide,
      widget.match?.homeTeam,
      widget.match?.awayTeam,
    );
  }

  int? get yardline {
    if (widget.lastFootballPlay != null) {
      return widget.lastFootballPlay?.end?.yardline;
    }
    return widget.match?.sportData?.yardline;
  }

  String get yardlineLabel {
    if (yardline == null) {
      return '';
    }
    return yardline.toString();
  }

  HomeOrAway? get possession {
    if (widget.lastFootballPlay != null) {
      return widget.lastFootballPlay?.end?.possession;
    }
    return widget.match?.sportData?.possession;
  }

  int? get gameClock => widget.match?.sportData?.gameClock;

  bool get showPreKickoff =>
      isDuringKickoff ||
      down == -1 ||
      (widget.match as MatchModel?)?.periodToUse == 0;

  bool get isCFBOvertime =>
      (widget.match?.league?.isCFB ?? false) && widget.match!.period > 4;

  @override
  Widget build(BuildContext context) {
    final skin = GameTrackerSkin();

    if (widget.match?.status != MatchStatus.active) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// possession indicator
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: possession != null && possession == HomeOrAway.away
                    ? skin.icons.possession.asImage(width: 16, height: 16)
                    : const SizedBox.shrink(),
              ),

              /// away team logo and name
              FootballTeamLogoNameWidget(
                primaryColor:
                    widget.match?.awayTeam?.primaryColor ?? Colors.black,
                logoUrl: widget.match?.awayTeam!.logoUrl,
                matchStatus: widget.match?.status,
                score: widget.match?.awayScore,
                shortName: widget.match?.awayTeam?.matchStateName,
                homeOrAway: HomeOrAway.away,
                maxWidth: widget.maxWidth,
                maxHeight: widget.maxHeight,
                homeTeamTimeoutsLeft:
                    widget.match?.sportData?.homeTeamTimeoutsLeft,
                awayTeamTimeoutsLeft:
                    widget.match?.sportData?.awayTeamTimeoutsLeft,
              ),

              /// match details
              Container(
                width: widget.maxWidth * kFootballTrackerMatchStateWidthFactor,
                height: widget.maxHeight * kBaseMatchStateWidgetHeightFactor,
                decoration: BoxDecoration(
                  color: skin.colors.grey1,
                  boxShadow: [
                    BoxShadow(
                      color: skin.colors.grey5.withOpacity(0.5),
                      blurRadius: 4,
                      spreadRadius: 0.5,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedCrossFade(
                      crossFadeState: showPreKickoff
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 400),
                      firstChild: Container(
                        alignment: Alignment.center,
                        width: widget.maxWidth *
                            kFootballTrackerMatchStateWidthFactor,
                        child: ScalableTextWidget(
                          text: 'PRE KICKOFF',
                          textStyle: skin.textStyles.footballMatchStateInfo
                              .copyWith(color: skin.colors.grey5),
                          maxWidth: widget.maxWidth,
                        ),
                      ),
                      secondChild: Row(
                        children: [
                          FootballMatchStateAnimationWrapper(
                            updated: periodUpdated,
                            maxHeight: widget.maxHeight,
                            onEndCallback: () {
                              setState(() {
                                periodUpdated = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1.5,
                                    color: skin.colors.footballGreyInfoColor,
                                  ),
                                ),
                              ),
                              child: ScalableTextWidget(
                                text: period,
                                textStyle: skin
                                    .textStyles.footballMatchStateInfo
                                    .copyWith(
                                  color: skin.colors.footballGreyInfoColor,
                                ),
                                maxWidth: widget.maxWidth,
                              ),
                            ),
                          ),
                          FootballMatchStateAnimationWrapper(
                            updated: matchStateUpdated,
                            maxHeight: widget.maxHeight,
                            onEndCallback: () {
                              setState(() {
                                matchStateUpdated = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  ScalableTextWidget(
                                    text: downLabel,
                                    textStyle: skin
                                        .textStyles.footballDriveInfoRegular
                                        .copyWith(color: skin.colors.grey5),
                                    maxWidth: widget.maxWidth,
                                    textAlign: TextAlign.end,
                                  ),
                                  if (down != null)
                                    ScalableTextWidget(
                                      text: '${formatOrdinalSuffix(down)} & '
                                          .toUpperCase(),
                                      textStyle: skin
                                          .textStyles.footballDriveInfoRegular
                                          .copyWith(color: skin.colors.grey5),
                                      maxWidth: widget.maxWidth,
                                      textAlign: TextAlign.start,
                                    ),
                                  ScalableTextWidget(
                                    text: isGoalToGo ? 'Goal' : distanceLabel,
                                    textStyle: skin
                                        .textStyles.footballDriveInfoRegular
                                        .copyWith(color: skin.colors.grey5),
                                    maxWidth: widget.maxWidth,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  ScalableTextWidget(
                                    text: '$fieldSide $yardlineLabel',
                                    textStyle: skin
                                        .textStyles.footballDriveInfoRegular
                                        .copyWith(
                                      color: skin.colors.footballGreyInfoColor,
                                    ),
                                    maxWidth: widget.maxWidth,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// home team logo and name
              FootballTeamLogoNameWidget(
                primaryColor:
                    widget.match?.homeTeam?.primaryColor ?? Colors.black,
                logoUrl: widget.match?.homeTeam!.logoUrl,
                matchStatus: widget.match?.status,
                score: widget.match?.homeScore,
                shortName: widget.match?.homeTeam!.matchStateName,
                homeOrAway: HomeOrAway.home,
                maxWidth: widget.maxWidth,
                maxHeight: widget.maxHeight,
                homeTeamTimeoutsLeft:
                    widget.match?.sportData?.homeTeamTimeoutsLeft,
                awayTeamTimeoutsLeft:
                    widget.match?.sportData?.awayTeamTimeoutsLeft,
              ),

              /// possession indicator
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: possession != null && possession == HomeOrAway.home
                    ? skin.icons.possession.asImage(width: 16, height: 16)
                    : const SizedBox.shrink(),
              ),
            ],
          ),

          // game clock
          if (gameClock != null && !isCFBOvertime)
            FootballMatchStateGameClockWidget(
              gameClock: gameClock!,
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              isClockRunning: widget.match?.sportData?.clockRunning ?? false,
            ),
        ],
      ),
    );
  }
}
