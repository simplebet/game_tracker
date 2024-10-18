import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';

final courtOverlayStateProvider = StateNotifierProvider.autoDispose<
    CourtOverlayStateNotifier,
    CourtOverlayState>((ref) => CourtOverlayStateNotifier());

class CourtOverlayStateNotifier extends StateNotifier<CourtOverlayState> {
  CourtOverlayStateNotifier() : super(CourtOverlayState());

  void showHalfCourtOverlay({
    required String teamName,
    required Color overlayColor,
    required HomeOrAway courtSide,
    required BasketballMatchIncidentEventType halfCourtOverlayType,
  }) {
    if (mounted) {
      state = state.copyWith(
          showHalfCourtOverlay: true,
          teamName: teamName,
          overlayColor: overlayColor,
          halfCourtSide: courtSide,
          halfCourtOverlayType: halfCourtOverlayType);
    }
  }

  void showFullCourtOverlay({
    String? teamName,
    String? teamAbbrv,
    required Color overlayColor,
    required BasketballMatchIncidentEventType fullCourtOverlayType,
    BasketballMatchIncidentEventType? foulRewardType,
    int? period,
  }) {
    if (mounted) {
      state = state.copyWith(
        showFullCourtOverlay: true,
        teamName: teamName,
        teamAbbrv: teamAbbrv,
        overlayColor: overlayColor,
        fullCourtOverlayType: fullCourtOverlayType,
        foulRewardType: foulRewardType,
        period: period,
      );
    }
  }

  Future<void> animateFullCourtOverlayChange({
    required String teamName,
    required String teamAbbrv,
    required Color overlayColor,
    required BasketballMatchIncidentEventType overlayType,
    bool isHalfTime = false,
  }) async {
    if (mounted) {
      state = state.copyWith(
        isAnimatingHideText: true,
      );

      await Future.delayed(const Duration(milliseconds: 300));

      state = state.copyWith(
          isAnimatingColor: true,
          isAnimatingHideText: false,
          teamName: teamName,
          teamAbbrv: teamAbbrv,
          overlayColor: overlayColor,
          fullCourtOverlayType: overlayType,
          isHalfTime: isHalfTime);

      await Future.delayed(const Duration(milliseconds: 300));

      state = state.copyWith(
        isAnimatingColor: false,
      );
    }
  }

  void hideHalfCourtOverlay() {
    if (mounted) {
      state = state.copyWith(
        showHalfCourtOverlay: false,
      );
    }
  }

  void hideFullCourtOverlay() {
    if (mounted) {
      state = state.copyWith(
        showFullCourtOverlay: false,
      );
    }
  }
}

class CourtOverlayState {
  CourtOverlayState({
    this.teamName = "",
    this.teamAbbrv = '',
    this.overlayColor = Colors.white,
    this.isAnimatingColor = false,
    this.isAnimatingHideText = false,
    this.showHalfCourtOverlay = false,
    this.isHalfTime = false,
    this.halfCourtSide = HomeOrAway.away,
    this.halfCourtOverlayType =
        BasketballMatchIncidentEventType.fieldGoalMadeTwo,
    this.showFullCourtOverlay = false,
    this.fullCourtOverlayType =
        BasketballMatchIncidentEventType.fieldGoalMadeTwo,
    this.foulRewardType,
    this.period = 1,
  });

  final String teamName;
  final String teamAbbrv;
  final Color overlayColor;
  final bool isAnimatingColor;
  final bool isAnimatingHideText;
  final bool isHalfTime;

  final bool showHalfCourtOverlay;
  final HomeOrAway halfCourtSide;
  final BasketballMatchIncidentEventType halfCourtOverlayType;

  final bool showFullCourtOverlay;
  final BasketballMatchIncidentEventType fullCourtOverlayType;

  /// Used with floor fouls since they have different reward types as the subtext
  final BasketballMatchIncidentEventType?
      foulRewardType; // null, One-and-One, or Double Bonus

  /// Used in Period Start events
  final int period;

  CourtOverlayState copyWith({
    String? teamName,
    String? teamAbbrv,
    Color? overlayColor,
    bool? isAnimatingColor,
    bool? isAnimatingHideText,
    bool? showHalfCourtOverlay,
    bool? isHalfTime,
    HomeOrAway? halfCourtSide,
    bool? showFullCourtOverlay,
    BasketballMatchIncidentEventType? halfCourtOverlayType,
    BasketballMatchIncidentEventType? fullCourtOverlayType,
    BasketballMatchIncidentEventType? foulRewardType,
    int? period,
  }) {
    return CourtOverlayState(
      teamName: teamName ?? this.teamName,
      teamAbbrv: teamAbbrv ?? this.teamAbbrv,
      overlayColor: overlayColor ?? this.overlayColor,
      isAnimatingColor: isAnimatingColor ?? this.isAnimatingColor,
      isAnimatingHideText: isAnimatingHideText ?? this.isAnimatingHideText,
      isHalfTime: isHalfTime ?? this.isHalfTime,
      showHalfCourtOverlay: showHalfCourtOverlay ?? this.showHalfCourtOverlay,
      halfCourtSide: halfCourtSide ?? this.halfCourtSide,
      halfCourtOverlayType: halfCourtOverlayType ?? this.halfCourtOverlayType,
      showFullCourtOverlay: showFullCourtOverlay ?? this.showFullCourtOverlay,
      fullCourtOverlayType: fullCourtOverlayType ?? this.fullCourtOverlayType,
      foulRewardType: foulRewardType, // We should always use the new value
      period: period ?? this.period,
    );
  }
}
