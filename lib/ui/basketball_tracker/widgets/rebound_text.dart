import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../store/game_tracker_skin_store.dart';
import '../notifiers/possession_arrow_state_notifier.dart';
import '../util/constants.dart';

String _getReboundText(PossessionArrowType? type) {
  switch (type) {
    case PossessionArrowType.defensiveRebound:
      return 'DEFENSIVE';
    case PossessionArrowType.offensiveRebound:
      return 'OFFENSIVE';
    default:
      return '';
  }
}

class ReboundText extends ConsumerWidget {
  ReboundText({
    super.key,
    required this.courtSide,
    required this.type,
    required this.maxWidth,
  }) : _text = _getReboundText(type);

  final HomeOrAway courtSide;
  final PossessionArrowType? type;
  final double maxWidth;

  final String _text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: courtSide == HomeOrAway.away
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        AutoSizeText(
          _text,
          style: skin.textStyles.basketballHeader3Extrabold.copyWith(
              height: .8,
              letterSpacing: 1.68,
              fontWeight: FontWeight.w900,
              color: skin.colors.basketballGrey1),
          textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
          maxLines: 1,
        ),
        Transform.translate(
          offset: const Offset(0, 4),
          child: AutoSizeText(
            'REBOUND',
            style: skin.textStyles.basketballHeader2Medium.copyWith(
              height: .8,
              letterSpacing: 1.6,
              color: skin.colors.basketballGrey1,
            ),
            textScaleFactor: maxWidth / kBasketballTrackerBaseScreenWidth,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
