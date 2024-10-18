import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../notifiers/field_goal_state_notifier.dart';
import '../util/constants.dart';
import 'rive_file_provider.dart';

final fieldGoalArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file = await ref.read(riveFileProvider.future);

  final artboard =
      file.artboardByName(BasketballTrackerRiveArtboards.fieldGoalAttempts);

  final fieldGoalStateNotifier = ref.read(fieldGoalStateProvider.notifier);

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
        artboard, BasketballTrackerRiveStateMachines.fieldGoalAttempts);

    if (controller != null) {
      artboard.addController(controller);

      fieldGoalStateNotifier.initStateMachineInputs(
        twoPointerMadeInputControl: controller.findInput<bool>(
            BasketballTrackerRiveStateMachineInputs.twoPointerMade) as SMIBool,
        threePointerMadeInputControl: controller.findInput<bool>(
                BasketballTrackerRiveStateMachineInputs.threePointerMade)
            as SMIBool,
        twoPointerMissedInputControl: controller.findInput<bool>(
                BasketballTrackerRiveStateMachineInputs.twoPointerMissed)
            as SMIBool,
        threePointerMissedInputControl: controller.findInput<bool>(
                BasketballTrackerRiveStateMachineInputs.threePointerMissed)
            as SMIBool,
      );
    }

    return artboard;
  }

  throw Exception('Field Goal Attempts artboard not found');
});
