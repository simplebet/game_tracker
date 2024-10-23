import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/models/match_incidents/football_match_incident_model.dart';
import 'package:game_tracker/init_params.dart';
import 'package:game_tracker/ui/basketball_tracker/util/helper.dart';
import 'package:game_tracker/ui/football_tracker/full_view/last_play_tray/last_play_tray_all_drives_widget.dart';
import 'package:game_tracker/ui/football_tracker/full_view/last_play_tray/last_play_tray_list_widget.dart';
import 'package:game_tracker/ui/football_tracker/state_nofitifiers/last_play_tray_state_notifier.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/football_last_play_tray_formatter.dart';
import 'package:game_tracker/ui/shared/scalable_text_widget.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';
import 'package:universal_html/html.dart' as html;

class AllDrivesPlayTrayWidget extends ConsumerStatefulWidget {
  const AllDrivesPlayTrayWidget({
    required this.maxWidth,
    required this.maxHeight,
    super.key,
  });

  final double maxWidth;
  final double maxHeight;

  @override
  AllDrivesPlayTrayWidgetState createState() => AllDrivesPlayTrayWidgetState();
}

class AllDrivesPlayTrayWidgetState
    extends ConsumerState<AllDrivesPlayTrayWidget> {
  bool isExpanded = false;
  bool isAllDrivesViewOpened = false;
  late FootballLastPlayTrayFormatter formatter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final skin = GameTrackerSkin();
    final stateNotifier =
        ref.watch(gameTrackerScreenControllerProvider.notifier);
    final state = ref.watch(gameTrackerScreenControllerProvider);
    final lastPlay = ref.watch(lastPlayTrayStateProvider).lastPlay ??
        state.footballIncidents?.last;

    final homeTeam = state.match!.homeTeam;
    final awayTeam = state.match!.awayTeam;
    if (homeTeam != null && awayTeam != null) {
      formatter = FootballLastPlayTrayFormatter(
        homeTeam: homeTeam,
        awayTeam: awayTeam,
      );
    }
    final lastPlayFromSelectedDrive =
        state.selectedFootballPlaysList?.plays.last;
    final possession =
        (isAllDrivesViewOpened ? lastPlay : lastPlayFromSelectedDrive)
            ?.start
            ?.possession;
    final driveNumber =
        (isAllDrivesViewOpened ? lastPlay : lastPlayFromSelectedDrive)
            ?.driveNumber;
    final isExpansionDisabled =
        !isExpanded && lastPlay == null && lastPlayFromSelectedDrive == null;
    final selectedDriveTitle = lastPlayFromSelectedDrive == null ||
            lastPlayFromSelectedDrive.isStandAloneEvent
        ? ''
        : formatter.formatDriveNumberWithName(possession, driveNumber);

    return SingleChildScrollView(
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: skin.colors.background,
        collapsedBackgroundColor: skin.colors.background,
        onExpansionChanged: (value) {
          if (kIsWeb) {
            final tracker = jsonEncode({
              'status': 'active',
              'uuid': initParameters['uuid'] ?? '',
              'tray': value ? 'open' : 'closed',
              'view_mode': 'full',
            });
            html.window.dispatchEvent(
              html.CustomEvent('tracker', detail: tracker),
            );
            if (html.window.parent != null) {
              html.window.parent!.postMessage(tracker, '*');
            }

            // Used for communicating with native iOS
            postMessageToWebkit('tracker', tracker);
          }
          setState(() {
            isExpanded = value;
          });

          /// reset selected drive to current drive
          stateNotifier.filterFootballPlaysByCurrentDriveId(
            state.footballIncidents?.last,
          );
        },
        trailing: _LastPlayTrayTrailingWidget(
            isExpanded: isExpanded, isExpansionDisabled: isExpansionDisabled,),
        title: Container(
          /// set a fixed height for collapsed last play tray
          height:
              isExpanded ? null : widget.maxHeight * kLastPlayTrayHeightFactor,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: isExpanded ? 10 : 0,
          ),
          child: isExpanded
              ? _LastPlayTrayExpandedHeaderWidget(
                  isAllDrivesViewOpened: isAllDrivesViewOpened,
                  maxWidth: widget.maxWidth,
                  selectedDriveTitle: selectedDriveTitle,
                  viewAllDrivesCallback: () {
                    setState(() {
                      isAllDrivesViewOpened = !isAllDrivesViewOpened;
                    });
                  },
                )
              : _LastPlayTrayCollapsedWidget(
                  maxWidth: widget.maxWidth,
                  lastFootballPlay: lastPlay,
                  formatter: formatter,
                ),
        ),
        children: [
          if (isAllDrivesViewOpened)
            LastPlayTrayAllDrivesWidget(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              allDrivesList: stateNotifier.footballPlaysListGroupedByDriveId,
              formatter: formatter,
              currentDriveId: state.footballIncidents?.last.driveId ?? '',
              changeDriveCallback: (driveId) {
                stateNotifier.filterFootballPlaysByDriveId(driveId);
                setState(() {
                  isAllDrivesViewOpened = false;
                });
              },
            )
          else
            LastPlayTrayListWidget(
              maxWidth: widget.maxWidth,
              maxHeight: widget.maxHeight,
              isExpanded: isExpanded,
              driveList: state.selectedFootballPlaysList,
              formatter: formatter,
            ),
        ],
      ),
    );
  }
}

class _LastPlayTrayTrailingWidget extends ConsumerWidget {
  const _LastPlayTrayTrailingWidget(
      {required this.isExpanded, required this.isExpansionDisabled,});

  final bool isExpanded;
  final bool isExpansionDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isExpansionDisabled) {
      return const SizedBox.shrink();
    }

    final skin = GameTrackerSkin();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: (isExpanded ? skin.icons.basketballMiss : skin.icons.chevron)
              .asImage(width: 16, height: 16, color: skin.colors.grey1),
        ),
      ],
    );
  }
}

class _LastPlayTrayExpandedHeaderWidget extends ConsumerWidget {
  const _LastPlayTrayExpandedHeaderWidget({
    required this.isAllDrivesViewOpened,
    required this.maxWidth,
    required this.viewAllDrivesCallback,
    required this.selectedDriveTitle,
  });

  final bool isAllDrivesViewOpened;
  final double maxWidth;
  final VoidCallback viewAllDrivesCallback;
  final String selectedDriveTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScalableTextWidget(
          text: (isAllDrivesViewOpened ? 'All Drives' : selectedDriveTitle)
              .toUpperCase(),
          textStyle: skin.textStyles.footballTitleMedium
              .copyWith(color: skin.colors.grey1),
          maxWidth: maxWidth,
        ),
        if (!isAllDrivesViewOpened)
          GestureDetector(
            onTap: viewAllDrivesCallback,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 0.3,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: skin.colors.playTrayTitleColor,
                    width: 2,
                  ),
                ),
              ),
              child: ScalableTextWidget(
                text: 'VIEW ALL DRIVES',
                textStyle: skin.textStyles.body5Medium.copyWith(
                  color: skin.colors.playTrayTitleColor,
                ),
                maxWidth: maxWidth,
              ),
            ),
          ),
      ],
    );
  }
}

class _LastPlayTrayCollapsedWidget extends ConsumerStatefulWidget {
  const _LastPlayTrayCollapsedWidget({
    required this.maxWidth,
    required this.lastFootballPlay,
    required this.formatter,
  });

  final double maxWidth;
  final FootballMatchIncidentModel? lastFootballPlay;
  final FootballLastPlayTrayFormatter formatter;

  @override
  _LastPlayTrayCollapsedWidgetState createState() =>
      _LastPlayTrayCollapsedWidgetState();
}

class _LastPlayTrayCollapsedWidgetState
    extends ConsumerState<_LastPlayTrayCollapsedWidget> {
  bool isPlayUpdated = false;
  late FootballMatchIncidentModel? lastFootballPlay;

  @override
  void initState() {
    lastFootballPlay = widget.lastFootballPlay;

    /// on init set lastFootballPlay to the lastest play from store
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _LastPlayTrayCollapsedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    lastFootballPlay = widget.lastFootballPlay;

    if (oldWidget.lastFootballPlay?.eventId != lastFootballPlay?.eventId) {
      lastFootballPlay = widget.lastFootballPlay;
      setState(() {
        isPlayUpdated = true;
      });
    } else {
      setState(() {
        isPlayUpdated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final skin = GameTrackerSkin();
    final String subtitleText =
        widget.formatter.lastPlayTraySubtitle(lastFootballPlay);
    final Color lastPlayTextColor = skin.colors.grey1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            ScalableTextWidget(
              text: 'LAST PLAY',
              textStyle: skin.textStyles.footballPlayTrayTitle
                  .copyWith(color: lastPlayTextColor),
              maxWidth: widget.maxWidth,
            ),
            const SizedBox(
              width: 8,
            ),
            ScalableTextWidget(
              text: widget.formatter
                  .lastPlayTrayTitle(lastFootballPlay, isExpandedTitle: false)
                  .toUpperCase(),
              textStyle: skin.textStyles.footballPlayTrayTitle
                  .copyWith(color: skin.colors.grey3),
              maxWidth: widget.maxWidth,
            ),
          ],
        ),
        if (isPlayUpdated)
          AnimatedTextKit(
            key: UniqueKey(),
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(
                subtitleText,
                speed: const Duration(milliseconds: 20),
                textStyle: skin.textStyles.footballPlayTraySubtitle
                    .copyWith(color: skin.colors.grey1, height: 1),
              ),
            ],
          )
        else
          AutoSizeText(
            subtitleText,
            style: skin.textStyles.footballPlayTraySubtitle
                .copyWith(color: skin.colors.grey1, height: 1),
          ),
      ],
    );
  }
}
