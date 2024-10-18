import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

import '../../../../models/models.dart';
import '../../../../store/game_tracker_providers.dart';
import '../../../../store/game_tracker_screen_store.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../../shared/extensions.dart';
import 'stats_view_field_goal_attempts_widget.dart';
import 'stats_view_rebound_info_widget.dart';
import 'stats_view_score_info_widget.dart';

class BasketballTrackerStatsView extends ConsumerStatefulWidget {
  const BasketballTrackerStatsView({required this.size, Key? key})
      : super(key: key);

  final Size size;

  @override
  BasketballTrackerStatsViewState createState() =>
      BasketballTrackerStatsViewState();
}

class BasketballTrackerStatsViewState
    extends ConsumerState<BasketballTrackerStatsView> {
  bool isScrollEventsTracked = false;
  late GameTrackerScreenStore store;
  late Mixpanel? analytics;

  @override
  void initState() {
    super.initState();
    analytics = ref.read(mixpanelProvider).value;
    store = ref.read(gameTrackerScreenStoreProvider);
  }

  @override
  Widget build(BuildContext context) {
    final skin = ref.read(gameTrackerSkinProvider).skin;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification &&
            !isScrollEventsTracked) {
          analytics?.trackEvent(
              event: AnalyticsEvents.statsViewScrolled,
              league: store.serviceStore.match?.league?.name,
              matchId: store.serviceStore.matchId,
              awayTeam: store.serviceStore.match?.awayTeam?.name,
              homeTeam: store.serviceStore.match?.homeTeam?.name);
          isScrollEventsTracked = true;
        }
        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          color: skin.colors.basketballStatsBackground,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF2C2C2C),
                    width: 1.0,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'MATCH BREAKDOWN',
                      style: skin.textStyles.basketballHeader5Bold
                          .copyWith(color: skin.colors.grey1),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: skin.colors.grey1,
                      ),
                    )
                  ],
                ),
              ),

              /// match score info
              StatsViewScoreInfoWidget(
                size: widget.size,
              ),

              /// field goal attempts info
              StatsViewFieldGoalAttemptsWidget(
                size: widget.size,
              ),

              /// rebounds info
              const StatsViewReboundInfoWidget()
            ],
          ),
        ),
      ),
    );
  }
}
