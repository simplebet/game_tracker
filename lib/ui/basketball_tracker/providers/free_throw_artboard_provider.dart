import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../notifiers/free_throw_state_notifier.dart';
import '../util/constants.dart';
import 'rive_file_provider.dart';

final freeThrowsArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file = await ref.read(riveFileProvider.future);
  final freeThrowsStateNotifier = ref.read(freeThrowStateProvider.notifier);

  final artboard =
      file.artboardByName(BasketballTrackerRiveArtboards.freeThrows);

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      BasketballTrackerRiveStateMachines.freeThrows,
    );

    if (controller != null) {
      artboard.addController(controller);

      freeThrowsStateNotifier.initStateMachineInputs(
          freeThrowMadeInputControl: controller.findInput<bool>(
                  BasketballTrackerRiveStateMachineInputs.freeThrowsMade)
              as SMIBool,
          freeThrowMissedInputControl: controller.findInput<bool>(
                  BasketballTrackerRiveStateMachineInputs.freeThrowsMissed)
              as SMIBool);
    }

    return artboard;
  }

  throw Exception('Free Throws artboard not found');
});
