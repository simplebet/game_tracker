import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_drive_list_model.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

import '../../../shared/football_last_play_tray_formatter.dart';
import '../../../shared/scalable_text_widget.dart';

class LastPlayTrayAllDrivesWidget extends StatelessWidget {
  const LastPlayTrayAllDrivesWidget(
      {super.key,
      required this.maxWidth,
      required this.maxHeight,
      required this.changeDriveCallback,
      required this.allDrivesList,
      required this.formatter,
      required this.currentDriveId});

  final double maxWidth;
  final double maxHeight;
  final Function(String) changeDriveCallback;
  final List<FootballMatchIncidentDriveListModel>? allDrivesList;
  final FootballLastPlayTrayFormatter formatter;
  final String currentDriveId;

  @override
  Widget build(BuildContext context) {
    if (allDrivesList == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: maxWidth,
      height: maxHeight,
      child: ListView.builder(
        itemCount: allDrivesList?.length,
        itemBuilder: (_, index) {
          final drives = allDrivesList?.reversed.toList();
          final driveId = drives?[index].driveId ?? '';
          final playFromDrive = drives?[index].plays.last;

          return _LastPlayTrayAllDrivesItemWidget(
            index: index,
            maxWidth: maxWidth,
            changeDriveCallback: changeDriveCallback,
            driveId: driveId,
            play: playFromDrive,
            formatter: formatter,
            isCurrentDrive: driveId == currentDriveId,
          );
        },
        padding: const EdgeInsets.only(bottom: 50),
      ),
    );
  }
}

class _LastPlayTrayAllDrivesItemWidget extends ConsumerWidget {
  const _LastPlayTrayAllDrivesItemWidget(
      {required this.index,
      required this.maxWidth,
      required this.changeDriveCallback,
      required this.isCurrentDrive,
      required this.driveId,
      required this.play,
      required this.formatter});

  final int index;
  final double maxWidth;
  final Function(String) changeDriveCallback;
  final bool isCurrentDrive;
  final String driveId;
  final FootballMatchIncidentModel? play;
  final FootballLastPlayTrayFormatter formatter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (play == null) {
      return const SizedBox.shrink();
    }

    final skin = GameTrackerSkin();
    final driveTitle = formatter.formatDriveNumberWithName(
        play?.start?.possession, play?.driveNumber);
    final isInProgress = isCurrentDrive &&
        play!.event != FootballMatchIncidentEventType.driveEnded;

    var subtitle = isInProgress ? 'In Progress' : 'Drive Ended';
    var driveTitleStyle = skin.textStyles.footballPlayTrayTitle;


    return GestureDetector(
      onTap:
          play!.isStandAloneEvent ? null : () => changeDriveCallback(driveId),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            color: index.isEven
                ? skin.colors.playTrayEven
                : skin.colors.playTrayOdd,
            border: Border(
                bottom: BorderSide(
              color: skin.colors.grey1.withOpacity(0.1),
              width: 1.0,
            ))),
        child: play!.isStandAloneEvent
            ? ScalableTextWidget(
                text: formatter.lastPlayTraySubtitle(play).toUpperCase(),
                textStyle: driveTitleStyle.copyWith(
                    color: skin.colors.playTrayTitleColor),
                maxWidth: maxWidth,
                textAlign: TextAlign.left,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScalableTextWidget(
                        text: driveTitle.toUpperCase(),
                        textStyle: driveTitleStyle.copyWith(
                            color: skin.colors.playTrayTitleColor),
                        maxWidth: maxWidth,
                      ),
                      ScalableTextWidget(
                        text: subtitle,
                        textStyle: skin.textStyles.footballPlayTraySubtitle
                            .copyWith(color: skin.colors.playTrayTitleColor),
                        maxWidth: maxWidth,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: skin.colors.grey1,
                  )
                ],
              ),
      ),
    );
  }
}
