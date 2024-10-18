import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_providers.dart';
import '../../../../store/game_tracker_skin_store.dart';

class StatsViewReboundInfoWidget extends ConsumerWidget {
  const StatsViewReboundInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.read(gameTrackerSkinProvider).skin;
    final serviceStore = ref.read(gameTrackerServiceStoreProvider);

    if (serviceStore.statsUpdate == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14)
              .copyWith(top: 6, bottom: 8),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: Color(0xFF2C2C2C),
              width: 1.0,
            ),
          )),
          child: Column(
            children: [
              Text(
                'REBOUNDS',
                style: skin.textStyles.basketballHeader6Bold
                    .copyWith(color: skin.colors.grey1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.awayDefensiveRebounds ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                  Text(
                    'DEFENSIVE',
                    style: skin.textStyles.basketballHeaderBody1Medium
                        .copyWith(color: skin.colors.grey2),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.homeDefensiveRebounds ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.awayOffensiveRebounds ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                  Text(
                    'OFFENSIVE',
                    style: skin.textStyles.basketballHeaderBody1Medium
                        .copyWith(color: skin.colors.grey2),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.homeOffensiveRebounds ??
                              0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (_) {
                    final awayTotal = (serviceStore
                                .statsUpdate?.match?.awayDefensiveRebounds ??
                            0) +
                        (serviceStore
                                .statsUpdate?.match?.awayOffensiveRebounds ??
                            0);

                    return Text(
                      awayTotal.toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                  Text(
                    'TOTAL',
                    style: skin.textStyles.basketballHeaderBody1Medium
                        .copyWith(color: skin.colors.grey2),
                  ),
                  Observer(builder: (_) {
                    final homeTotal = (serviceStore
                                .statsUpdate?.match?.homeDefensiveRebounds ??
                            0) +
                        (serviceStore
                                .statsUpdate?.match?.homeOffensiveRebounds ??
                            0);

                    return Text(
                      homeTotal.toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14)
              .copyWith(top: 6, bottom: 8),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: Color(0xFF2C2C2C),
              width: 1.0,
            ),
          )),
          child: Column(
            children: [
              Text(
                'OTHER',
                style: skin.textStyles.basketballHeader6Bold
                    .copyWith(color: skin.colors.grey1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.awayFouls ?? 0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  }),
                  Text(
                    'FOULS',
                    style: skin.textStyles.basketballHeaderBody1Medium
                        .copyWith(color: skin.colors.grey2),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      (serviceStore.statsUpdate?.match?.homeFouls ?? 0)
                          .toString(),
                      style: skin.textStyles.basketballHeader6Bold
                          .copyWith(color: skin.colors.grey1),
                    );
                  })
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
