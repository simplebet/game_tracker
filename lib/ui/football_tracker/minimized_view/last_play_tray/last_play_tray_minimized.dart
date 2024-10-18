import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/core/models/team_model.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/football_last_play_tray_formatter.dart';
import 'package:game_tracker/ui/shared/text_utils.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class LastPlayTrayMinimized extends ConsumerStatefulWidget {
  const LastPlayTrayMinimized({
    required this.width,
    required this.matchStatus,
    required this.lastPlay,
    required this.startTime,
    required this.formatter,
    required this.homeTeam,
    required this.awayTeam,
    super.key,
  });

  final double width;
  final MatchStatus? matchStatus;
  final FootballMatchIncidentModel? lastPlay;
  final DateTime startTime;
  final FootballLastPlayTrayFormatter formatter;
  final TeamModel? homeTeam;
  final TeamModel? awayTeam;

  @override
  ConsumerState<LastPlayTrayMinimized> createState() =>
      _LastPlayTrayMinimizedState();
}

class _LastPlayTrayMinimizedState extends ConsumerState<LastPlayTrayMinimized> {
  bool isExpanded = false;

  @override
  void didUpdateWidget(covariant LastPlayTrayMinimized oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.lastPlay?.eventId != oldWidget.lastPlay?.eventId) {
      if (isExpanded) {
        setState(() {
          isExpanded = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final skin = GameTrackerSkin();

    /// on init lastPlayTrayState won't have any play
    /// assign the play value from store
    final lastPlay = widget.lastPlay;
    final downDistance = widget.formatter.formatDownDistance(lastPlay);
    final fieldSide = formatFieldSide(
      lastPlay?.start?.side,
      widget.homeTeam,
      widget.awayTeam,
    );
    final yardline = lastPlay?.start?.yardline ?? '';
    final fieldSideDistance = '$fieldSide $yardline';
    final isPreKickoff = lastPlay?.start?.down == -1;
    final isDownDistanceYardlineHidden =
        lastPlay?.event.isDistanceYardlineHidden ?? false;
    final downDistanceYardLine =
        isPreKickoff ? 'PRE KICKOFF' : '$downDistance $fieldSideDistance';
    final ddyTextCopy =
        isDownDistanceYardlineHidden ? '' : downDistanceYardLine;

    if (widget.matchStatus == MatchStatus.preMatch) {
      return Container(
        height: 41,
        width: widget.width,
        alignment: Alignment.center,
        color: skin.colors.background,
        child: Text(
          'Kick off @ ${formatDate(widget.startTime)}'.toUpperCase(),
          style: skin.textStyles.body1
              .copyWith(color: skin.colors.grey1, fontWeight: FontWeight.w700),
        ),
      );
    }

    if (lastPlay?.event == FootballMatchIncidentEventType.matchEnded) {
      return Container(
        height: 41,
        width: widget.width,
        alignment: Alignment.center,
        color: skin.colors.background,
        child: Text(
          'MATCH ENDED',
          style: skin.textStyles.body1
              .copyWith(color: skin.colors.grey1, fontWeight: FontWeight.w700),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: skin.colors.background,
      height: isExpanded ? 53 : 41,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'LAST PLAY',
                    style: skin.textStyles.body5Medium
                        .copyWith(color: skin.colors.grey2),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    widget.formatter
                        .lastPlayTrayTitle(lastPlay, isExpandedTitle: false)
                        .toUpperCase(),
                    style: skin.textStyles.body5Medium.copyWith(
                      color: skin.colors.grey3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                ddyTextCopy.toUpperCase(),
                style: skin.textStyles.body5Medium
                    .copyWith(color: skin.colors.grey1),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: widget.width * 0.89,
                height: 14,
                child: Text(
                  widget.formatter.lastPlayTraySubtitle(lastPlay).toUpperCase(),
                  style: skin.textStyles.body4Medium.copyWith(
                    color: skin.colors.grey1,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                ),
              ),

              /// calculate the width of the desc. if it larger than 80% of the screen width. add toggle button
              if (widget.formatter.lastPlayTraySubtitle(lastPlay).length >
                  kFootballTrackerMinimizedLongDescCap)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up_sharp
                        : Icons.keyboard_arrow_down_sharp,
                    size: 20,
                    color: skin.colors.grey1,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
