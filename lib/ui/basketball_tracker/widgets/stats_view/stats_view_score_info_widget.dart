import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../skin/game_tracker_skin.dart';
import '../../../../store/game_tracker_providers.dart';
import '../../../../store/game_tracker_service_store.dart';
import '../../../../store/game_tracker_skin_store.dart';
import '../../../shared/team_color.dart';

class StatsViewScoreInfoWidget extends ConsumerStatefulWidget {
  const StatsViewScoreInfoWidget({required this.size, super.key});

  final Size size;

  @override
  ConsumerState<StatsViewScoreInfoWidget> createState() =>
      _StatsViewScoreInfoWidgetState();
}

class _StatsViewScoreInfoWidgetState
    extends ConsumerState<StatsViewScoreInfoWidget> {
  late GameTrackerSkin skin;
  late GameTrackerServiceStore serviceStore;

  @override
  void initState() {
    super.initState();
    skin = ref.read(gameTrackerSkinProvider).skin;
    serviceStore = ref.read(gameTrackerServiceStoreProvider);
  }

  @override
  Widget build(BuildContext context) {
    if (serviceStore.statsUpdate == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceStore.statsUpdate!.awayTeam!.name!.toUpperCase(),
                style: skin.textStyles.basketballHeader6Bold
                    .copyWith(color: skin.colors.grey1),
              ),
              Text(
                serviceStore.statsUpdate!.homeTeam!.name!.toUpperCase(),
                style: skin.textStyles.basketballHeader6Bold
                    .copyWith(color: skin.colors.grey1),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: widget.size.width / 2,
              height: 4,
              color: serviceStore.statsUpdate!.awayTeam?.primaryColor,
            ),
            Container(
              width: widget.size.width / 2,
              height: 4,
              color: serviceStore.statsUpdate!.homeTeam?.primaryColor,
            )
          ],
        ),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 14).copyWith(bottom: 8),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: Color(0xFF2C2C2C),
              width: 1.0,
            ),
          )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.periodScores["1"]
                                  ?.away ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader4Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                  Text(
                    '1ST HALF',
                    style: skin.textStyles.basketballHeader5Medium
                        .copyWith(color: skin.colors.basketballGrey2),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.periodScores["1"]
                                  ?.home ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader4Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  })
                ],
              ),
              if (serviceStore.statsUpdate?.match?.periodScores["2"]?.away !=
                      null &&
                  serviceStore.statsUpdate?.match?.periodScores["2"]?.home !=
                      null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.periodScores["2"]
                                    ?.away ??
                                0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    }),
                    Text(
                      '2ND HALF',
                      style: skin.textStyles.basketballHeader5Medium
                          .copyWith(color: skin.colors.basketballGrey2),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.periodScores["2"]
                                    ?.home ??
                                0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    })
                  ],
                ),
              if (serviceStore.statsUpdate?.match?.periodScores["ot"]?.away !=
                      null &&
                  serviceStore.statsUpdate?.match?.periodScores["ot"]?.home !=
                      null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.periodScores["ot"]
                                    ?.away ??
                                0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    }),
                    Text(
                      'OVERTIME',
                      style: skin.textStyles.basketballHeader5Medium
                          .copyWith(color: skin.colors.basketballGrey2),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.periodScores["ot"]
                                    ?.home ??
                                0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    })
                  ],
                ),
              if (serviceStore.statsUpdate?.match?.awayScore != null &&
                  serviceStore.statsUpdate?.match?.homeScore != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.awayScore ?? 0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    }),
                    Text(
                      'TOTAL',
                      style: skin.textStyles.basketballHeader5Medium
                          .copyWith(color: skin.colors.basketballGrey2),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        (serviceStore.statsUpdate?.match?.homeScore ?? 0)
                            .toString(),
                        style: skin.textStyles.basketballHeader4Bold
                            .copyWith(color: skin.colors.grey1),
                      );
                    })
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
