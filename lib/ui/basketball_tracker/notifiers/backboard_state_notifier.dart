import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';

final backboardStateProvider =
    StateNotifierProvider.autoDispose<BackboardStateNotifier, BackboardState>(
        (ref) {
  return BackboardStateNotifier();
});

class BackboardStateNotifier extends StateNotifier<BackboardState> {
  BackboardStateNotifier() : super(const BackboardState());

  void showAllBackboards() {
    if (mounted) {
      state = state.copyWith(
        isLeftBackboardShown: true,
        isRightBackboardShown: true,
      );
    }
  }

  void showBackboard(HomeOrAway side) {
    if (mounted) {
      state = state.copyWith(
        isLeftBackboardShown: side == HomeOrAway.away,
        isRightBackboardShown: side == HomeOrAway.home,
      );
    }
  }

  void hideAllBackboards() {
    if (mounted) {
      state = state.copyWith(
        isLeftBackboardShown: false,
        isRightBackboardShown: false,
      );
    }
  }

  void hideBackboard(HomeOrAway winningSide) {
    if (mounted) {
      if (winningSide == HomeOrAway.away) {
        state = state.copyWith(
          isLeftBackboardShown: false,
        );
      } else {
        state = state.copyWith(
          isRightBackboardShown: false,
        );
      }
    }
  }
}

class BackboardState {
  const BackboardState({
    this.side = HomeOrAway.home,
    this.isLeftBackboardShown = false,
    this.isRightBackboardShown = false,
  });

  final HomeOrAway side;
  final bool isLeftBackboardShown;
  final bool isRightBackboardShown;

  BackboardState copyWith({
    HomeOrAway? side,
    bool? isLeftBackboardShown,
    bool? isRightBackboardShown,
    bool? isTurnoverShown,
    bool? isPossessionChangeShown,
  }) {
    return BackboardState(
      side: side ?? this.side,
      isLeftBackboardShown: isLeftBackboardShown ?? this.isLeftBackboardShown,
      isRightBackboardShown:
          isRightBackboardShown ?? this.isRightBackboardShown,
    );
  }
}
