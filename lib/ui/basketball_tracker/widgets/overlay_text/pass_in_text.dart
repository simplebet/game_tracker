import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../store/game_tracker_skin_store.dart';

class PassInText extends ConsumerWidget {
  const PassInText({
    super.key,
    required this.teamName,
  });
  final String teamName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AutoSizeText(
          '$teamName passes from out of bounds'.toUpperCase(),
          style: skin.textStyles.basketballHeader2Medium.copyWith(
              letterSpacing: 1.6,
              height: .85,
              color: skin.colors.basketballGrey1),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
