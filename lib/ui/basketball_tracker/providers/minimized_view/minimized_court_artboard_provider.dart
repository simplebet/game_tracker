import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../notifiers/court_state_notifier.dart';
import '../../util/constants.dart';
import '../rive_file_provider.dart';

final minimizedCourtArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file =
      await ref.watch(minimizedBasketballTrackerRiveFileProvider.future);

  final artboard = file
      .artboardByName(BasketballTrackerRiveArtboards.courtMinimized)
      ?.instance();

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      BasketballTrackerRiveStateMachines.court,
    );

    if (controller != null) {
      artboard.addController(controller);
    }

    final homeLaneFill =
        artboard.component<Fill>(BasketballTrackerRiveArtboards.homeLaneFill);
    final awayLaneFill =
        artboard.component<Fill>(BasketballTrackerRiveArtboards.awayLaneFill);
    final home2PointZoneFill = artboard
        .component<Fill>(BasketballTrackerRiveArtboards.twoPointZoneHomeFill);
    final away2PointZoneFill = artboard
        .component<Fill>(BasketballTrackerRiveArtboards.twoPointZoneAwayFill);
    final home3PointZoneFill = artboard
        .component<Fill>(BasketballTrackerRiveArtboards.threePointZoneHomeFill);
    final away3PointZoneFill = artboard
        .component<Fill>(BasketballTrackerRiveArtboards.threePointZoneAwayFill);

    if (homeLaneFill == null ||
        awayLaneFill == null ||
        home2PointZoneFill == null ||
        away2PointZoneFill == null ||
        home3PointZoneFill == null ||
        away3PointZoneFill == null) throw Exception('Fill not found');

    homeLaneFill.paint.color = Colors.transparent;
    awayLaneFill.paint.color = Colors.transparent;
    home2PointZoneFill.paint.color = Colors.transparent;
    away2PointZoneFill.paint.color = Colors.transparent;
    home3PointZoneFill.paint.color = Colors.transparent;
    away3PointZoneFill.paint.color = Colors.transparent;

    final courtStateNotifier = ref.watch(courtStateProvider.notifier);

    courtStateNotifier.initFills(
        homeLaneFill: homeLaneFill,
        awayLaneFill: awayLaneFill,
        home2PointZoneFill: home2PointZoneFill,
        away2PointZoneFill: away2PointZoneFill,
        home3PointZoneFill: home3PointZoneFill,
        away3PointZoneFill: away3PointZoneFill);

    return artboard;
  }

  throw Exception(
      '${BasketballTrackerRiveArtboards.courtMinimized} artboard not found');
});
