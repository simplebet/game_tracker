import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../notifiers/slide_in_arrow_state_notifier.dart';
import '../util/constants.dart';
import 'rive_file_provider.dart';

final slideInArrowArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file = await ref.read(riveFileProvider.future);
  final slideInArrowStateNotifier =
      ref.read(slideInArrowStateProvider.notifier);

  final artboard = file
      .artboardByName(BasketballTrackerRiveArtboards.slideInArrows)
      ?.instance();

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      BasketballTrackerRiveStateMachines.slideInArrows,
    );
    if (controller != null) {
      artboard.addController(controller);

      slideInArrowStateNotifier.initStateMachineInputs(
          jumpBallRightInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.jumpBallRight) as SMIBool,
          jumpBallLeftInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.jumpBallLeft) as SMIBool,
          turnoverRightInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.turnoverRight) as SMIBool,
          turnoverLeftInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.turnoverLeft) as SMIBool);
    }

    return artboard;
  }

  throw Exception(
      '${BasketballTrackerRiveArtboards.slideInArrows} artboard not found');
});
