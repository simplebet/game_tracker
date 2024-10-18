import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../store/game_tracker_skin_store.dart';

class MinimizedTimeoutText extends ConsumerWidget {
  const MinimizedTimeoutText._({
    required this.name,
  });

  final String name;

  factory MinimizedTimeoutText.official() {
    return const MinimizedTimeoutText._(
      name: 'Official',
    );
  }

  factory MinimizedTimeoutText.team({
    required String teamName,
  }) {
    return MinimizedTimeoutText._(
      name: teamName,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            name.toUpperCase(),
            style: skin.textStyles.basketballHeader3Extrabold
                .copyWith(color: skin.colors.basketballGrey1),
          ),
          const SizedBox(
            width: 6,
          ),
          AutoSizeText(
            'TIMEOUT',
            style: skin.textStyles.basketballHeader1Medium
                .copyWith(color: skin.colors.basketballGrey1),
          ),
        ],
      ),
    );
  }
}
