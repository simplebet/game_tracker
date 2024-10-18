import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_drive_list_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';


import '../../../shared/football_last_play_tray_formatter.dart';
import '../../../shared/scalable_text_widget.dart';

class LastPlayTrayListWidget extends StatelessWidget {
  const LastPlayTrayListWidget({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.isExpanded,
    required this.driveList,
    required this.formatter,
  });

  final double maxHeight;
  final double maxWidth;
  final bool isExpanded;
  final FootballMatchIncidentDriveListModel? driveList;
  final FootballLastPlayTrayFormatter formatter;

  @override
  Widget build(BuildContext context) {
    if (driveList == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: ListView.builder(
          itemCount: driveList?.plays.length,
          itemBuilder: (_, index) {
            final playsList = driveList!.plays.reversed.toList();
            final play = playsList[index];

            return _LastPlayTrayListItemWidget(
              index: index,
              maxWidth: maxWidth,
              play: play,
              formatter: formatter,
            );
          },
          padding: const EdgeInsets.only(bottom: 50),
        ));
  }
}

class _LastPlayTrayListItemWidget extends ConsumerWidget {
  const _LastPlayTrayListItemWidget(
      {required this.index,
      required this.maxWidth,
      required this.play,
      required this.formatter});

  final int index;
  final double maxWidth;
  final FootballMatchIncidentModel? play;
  final FootballLastPlayTrayFormatter formatter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (play == null) {
      return const SizedBox.shrink();
    }

    final skin = GameTrackerSkin();
    String subtitle = formatter.lastPlayTraySubtitle(play);
    TextStyle playNumberStyle = skin.textStyles.footballPlayTrayTitle;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color:
              index.isEven ? skin.colors.playTrayEven : skin.colors.playTrayOdd,
          border: Border(
              bottom: BorderSide(
            color: skin.colors.grey1.withOpacity(0.1),
            width: 1.0,
          ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (!play!.isStandAloneEvent)
                ScalableTextWidget(
                  text: formatter.formatPlayNumber(play).toUpperCase(),
                  textStyle: playNumberStyle.copyWith(
                      color: skin.colors.playTrayTitleColor),
                  maxWidth: maxWidth,
                  textAlign: TextAlign.left,
                ),

              /// don't show the down distance yardline for drive end
              if (play!.event != FootballMatchIncidentEventType.driveEnded)
                ScalableTextWidget(
                  text: formatter
                      .lastPlayTrayTitle(play, isExpandedTitle: true)
                      .toUpperCase(),
                  textStyle: skin.textStyles.footballPlayTrayTitle
                      .copyWith(color: skin.colors.playTrayTitleColor),
                  maxWidth: maxWidth,
                  textAlign: TextAlign.left,
                ),
            ],
          ),

          /// don't show the subtitle for drive start/end
          if (!play!.event.isDriveStartOrEnd)
            ScalableTextWidget(
              text: subtitle,
              textStyle: skin.textStyles.body4Thin.copyWith(
                  color: skin.colors.playTrayTitleColor, fontSize: 14),
              maxWidth: maxWidth,
              textAlign: TextAlign.left,
            ),
        ],
      ),
    );
  }
}
