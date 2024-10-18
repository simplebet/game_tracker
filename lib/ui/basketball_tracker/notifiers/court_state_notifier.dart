import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../models/models.dart';
import '../util/constants.dart';

final courtStateProvider =
    StateNotifierProvider.autoDispose<CourtStateNotifier, CourtState>((ref) {
  return CourtStateNotifier();
});

class CourtStateNotifier extends StateNotifier<CourtState> {
  CourtStateNotifier() : super(const CourtState());

  void initFills({
    required Fill homeLaneFill,
    required Fill awayLaneFill,
    required Fill home2PointZoneFill,
    required Fill away2PointZoneFill,
    required Fill home3PointZoneFill,
    required Fill away3PointZoneFill,
  }) {
    state = state.copyWith(
      homeLaneFill: homeLaneFill,
      awayLaneFill: awayLaneFill,
      home2PointZoneFill: home2PointZoneFill,
      away2PointZoneFill: away2PointZoneFill,
      home3PointZoneFill: home3PointZoneFill,
      away3PointZoneFill: away3PointZoneFill,
    );

    showFillLanes();
  }

  void setTeams({required TeamModel homeTeam, required TeamModel awayTeam}) {
    state = state.copyWith(
      homeTeam: homeTeam,
      awayTeam: awayTeam,
    );
  }

  void setAnimationController(AnimationController? controller) {
    state = state.copyWith(animationController: controller);
  }

  _triggerCourtColorAnimation({
    required Fill fill,
    required Color color,
    required void Function(Fill newFill) listenerCallback,
  }) {
    // ColorTween docs recommend using null for transparent colors
    final beginColor =
        fill.paint.color == Colors.transparent ? null : fill.paint.color;

    final endColor = color == Colors.transparent ? null : color;

    final animation = state.animationController?.drive(
      ColorTween(
        begin: beginColor,
        end: endColor,
      ),
    );

    listener() {
      Fill newFill = fill;
      newFill.paint.color = animation?.value ?? Colors.transparent;

      listenerCallback(newFill);
    }

    animation?.addListener(listener);

    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.removeListener(listener);
      }
    });

    state.animationController?.forward(from: 0.0);
  }

  void setHomeLaneColor(Color color) {
    if (state.homeLaneFill != null) {
      state.homeLaneFill?.paint.color = color;
      // todo: revisit the animation logic its causing opacity issues now
      // _triggerCourtColorAnimation(
      //   fill: state.homeLaneFill!,
      //   color: color,
      //   listenerCallback: (newFill) {
      //     state = state.copyWith(homeLaneFill: newFill);
      //   },
      // );
    }
  }

  void setAwayLaneColor(Color color) {
    if (state.awayLaneFill != null) {
      state.awayLaneFill?.paint.color = color;
      // todo: revisit the animation logic its causing opacity issues now
      // _triggerCourtColorAnimation(
      //   fill: state.awayLaneFill!,
      //   color: color,
      //   listenerCallback: (newFill) {
      //     state = state.copyWith(awayLaneFill: newFill);
      //   },
      // );
    }
  }

  void setHome2PointZoneColor(Color color) {
    if (state.home2PointZoneFill != null) {
      _triggerCourtColorAnimation(
        fill: state.home2PointZoneFill!,
        color: color,
        listenerCallback: (newFill) {
          state = state.copyWith(home2PointZoneFill: newFill);
        },
      );
    }
  }

  void setAway2PointZoneColor(Color color) {
    if (state.away2PointZoneFill != null) {
      _triggerCourtColorAnimation(
        fill: state.away2PointZoneFill!,
        color: color,
        listenerCallback: (newFill) {
          state = state.copyWith(away2PointZoneFill: newFill);
        },
      );
    }
  }

  void setHome3PointZoneColor(Color color) {
    if (state.home3PointZoneFill != null) {
      _triggerCourtColorAnimation(
        fill: state.home3PointZoneFill!,
        color: color,
        listenerCallback: (newFill) {
          state = state.copyWith(home3PointZoneFill: newFill);
        },
      );
    }
  }

  void setAway3PointZoneColor(Color color) {
    if (state.away3PointZoneFill != null) {
      _triggerCourtColorAnimation(
        fill: state.away3PointZoneFill!,
        color: color,
        listenerCallback: (newFill) {
          state = state.copyWith(away3PointZoneFill: newFill);
        },
      );
    }
  }

  /// ========================
  /// show/hide lanes
  /// ========================
  void showFillLanes() {
    if (state.homeLaneFill != null && state.awayLaneFill != null) {
      setHomeLaneColor(state.homeTeamColor);
      setAwayLaneColor(state.awayTeamColor);
    }
  }

  void hideFillLanes() {
    if (state.homeLaneFill != null && state.awayLaneFill != null) {
      setHomeLaneColor(Colors.transparent);
      setAwayLaneColor(Colors.transparent);
    }
  }

  /// ========================
  /// show/hide 2 point zones
  /// ========================
  void showFill2PointZones(HomeOrAway courtSide) {
    if (courtSide == HomeOrAway.home) {
      _showHomeFill2PointZones();
    } else {
      _showAwayFill2PointZones();
    }
  }

  void _showAwayFill2PointZones() {
    if (state.home2PointZoneFill != null) {
      setAway2PointZoneColor(state.homeTeamColor);
    }
  }

  void _showHomeFill2PointZones() {
    if (state.home2PointZoneFill != null) {
      setHome2PointZoneColor(state.awayTeamColor);
    }
  }

  void hideFill2PointZones(HomeOrAway courtSide) {
    if (courtSide == HomeOrAway.home) {
      _hideHomeFill2PointZones();
    } else {
      _hideAwayFill2PointZones();
    }
  }

  void _hideHomeFill2PointZones() {
    if (state.home2PointZoneFill != null) {
      setHome2PointZoneColor(Colors.transparent);
    }
  }

  void _hideAwayFill2PointZones() {
    if (state.away2PointZoneFill != null) {
      setAway2PointZoneColor(Colors.transparent);
    }
  }

  /// ========================
  /// show/hide 3 point zones
  /// ========================
  void showFill3PointZones(HomeOrAway courtSide) {
    if (courtSide == HomeOrAway.home) {
      _showHomeFill3PointZones();
    } else {
      _showAwayFill3PointZones();
    }
  }

  void showFill3PointMissedZones(HomeOrAway courtSide) {
    if (courtSide == HomeOrAway.home) {
      _showHomeFill3PointMissedZones();
    } else {
      _showAwayFill3PointMissedZones();
    }
  }

  void hideFill3PointZones(HomeOrAway courtSide) {
    if (courtSide == HomeOrAway.home) {
      _hideHomeFill3PointZones();
    } else {
      _hideAwayFill3PointZones();
    }
  }

  void _showAwayFill3PointZones() {
    if (state.away3PointZoneFill != null) {
      setAway3PointZoneColor(state.homeTeamColor);
    }
  }

  void _showAwayFill3PointMissedZones() {
    if (state.away3PointZoneFill != null) {
      setAway3PointZoneColor(fieldGoalMissedFieldColor);
    }
  }

  void _hideAwayFill3PointZones() {
    setAway3PointZoneColor(Colors.transparent);
  }

  void _showHomeFill3PointZones() {
    if (state.home3PointZoneFill != null) {
      setHome3PointZoneColor(state.awayTeamColor);
    }
  }

  void _showHomeFill3PointMissedZones() {
    if (state.home3PointZoneFill != null) {
      setHome3PointZoneColor(fieldGoalMissedFieldColor);
    }
  }

  void _hideHomeFill3PointZones() {
    if (state.home3PointZoneFill != null) {
      setHome3PointZoneColor(Colors.transparent);
    }
  }
}

class CourtState {
  const CourtState({
    this.homeTeam,
    this.awayTeam,
    this.animationController,
    this.homeLaneFill,
    this.awayLaneFill,
    this.home2PointZoneFill,
    this.away2PointZoneFill,
    this.home3PointZoneFill,
    this.away3PointZoneFill,
  });

  final AnimationController? animationController;

  // Court colors
  final Fill? homeLaneFill;
  final Fill? awayLaneFill;
  final Fill? home2PointZoneFill;
  final Fill? away2PointZoneFill;
  final Fill? home3PointZoneFill;
  final Fill? away3PointZoneFill;

  // Teams
  final TeamModel? homeTeam;
  final TeamModel? awayTeam;

  Color get homeTeamColor =>
      homeTeam != null ? homeTeam!.primaryColor : Colors.red;
  Color get awayTeamColor =>
      awayTeam != null ? awayTeam!.primaryColor : Colors.blue;

  // genereate copy with
  CourtState copyWith({
    AnimationController? animationController,
    TeamModel? homeTeam,
    TeamModel? awayTeam,
    Fill? homeLaneFill,
    Fill? awayLaneFill,
    Fill? home2PointZoneFill,
    Fill? away2PointZoneFill,
    Fill? home3PointZoneFill,
    Fill? away3PointZoneFill,
  }) {
    return CourtState(
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      animationController: animationController ?? this.animationController,
      homeLaneFill: homeLaneFill ?? this.homeLaneFill,
      awayLaneFill: awayLaneFill ?? this.awayLaneFill,
      home2PointZoneFill: home2PointZoneFill ?? this.home2PointZoneFill,
      away2PointZoneFill: away2PointZoneFill ?? this.away2PointZoneFill,
      home3PointZoneFill: home3PointZoneFill ?? this.home3PointZoneFill,
      away3PointZoneFill: away3PointZoneFill ?? this.away3PointZoneFill,
    );
  }
}
