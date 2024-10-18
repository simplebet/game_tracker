import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../store/game_tracker_skin_store.dart';
import '../../shared/constants.dart';
import 'transformations/full_court_perspective_builder.dart';

class BasketballTrackerLoadingWidget extends ConsumerWidget {
  const BasketballTrackerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = ref.watch(gameTrackerSkinProvider).skin;

    return FullCourtPerspectiveBuilder(
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFF9B748),
        highlightColor: skin.colors.grey1,
        period: const Duration(milliseconds: kShimmerPeriod),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF9B748),
          ),
        ),
      ),
    );
  }
}
