import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_skin_store.dart';
import '../../util/constants.dart';

class TimeoutText extends ConsumerWidget {
  const TimeoutText._({
    required this.name,
    required this.maxWidth,
  });

  final String name;
  final double maxWidth;

  factory TimeoutText.official({required double maxWidth}) {
    return TimeoutText._(
      name: 'Official',
      maxWidth: maxWidth,
    );
  }

  factory TimeoutText.team(
      {required String teamName, required double maxWidth}) {
    return TimeoutText._(
      name: teamName,
      maxWidth: maxWidth,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 6),
          child: skin.icons.timeoutWarped.asImage(width: 32, height: 32),
        ),
        Flexible(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  name.toUpperCase(),
                  style: skin.textStyles.basketballHeader3Extrabold.copyWith(
                      letterSpacing: 1.68,
                      height: 1,
                      color: skin.colors.basketballGrey1),
                  textAlign: TextAlign.center,
                  textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
                ),
                AutoSizeText(
                  'TIMEOUT',
                  style: skin.textStyles.basketballHeader1Medium.copyWith(
                      letterSpacing: 3.84,
                      height: 1,
                      color: skin.colors.basketballGrey1),
                  textAlign: TextAlign.center,
                  textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
