import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../../models/match_incidents/basketball_match_incident_model.dart';
import '../../notifiers/ball_movement_state_notifier.dart';
import '../../util/constants.dart';
import '../rive_file_provider.dart';

final minimizedBallArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file =
      await ref.read(minimizedBasketballTrackerRiveFileProvider.future);

  final artboard =
      file.artboardByName(BasketballTrackerRiveArtboards.basketballMinimized);

  final ballMovementStateNotifier =
      ref.read(ballMovementStateProvider.notifier);

  final ballMovementstate = ref.read(ballMovementStateProvider);

  if (artboard != null) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      BasketballTrackerRiveStateMachines.basketball,
    );

    if (controller != null) {
      artboard.addController(controller);

      ballMovementStateNotifier.initStateMachineInputs(
          tipOffInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.tipOff) as SMIBool,
          possesionChangeInputControl: controller.findInput<bool>(
                  BasketballTrackerRiveStateMachineInputs.possessionChange)
              as SMIBool,
          turnoverInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.turnover) as SMIBool,
          jumpBallInputControl: controller.findInput<bool>(
              BasketballTrackerRiveStateMachineInputs.jumpBall) as SMIBool);

      /// the async controller is started after RiverPod set the input value
      /// so manual force start `turnover/tipOff/jumpBall` ball movement
      /// when the last historic play is turnover
      if (artboard.animationControllers.first.isActive) {
        if (ballMovementstate.ballMovementType ==
            BasketballMatchIncidentEventType.turnover) {
          ballMovementStateNotifier.startTurnover(ballMovementstate.side);
        }
        if (ballMovementstate.ballMovementType ==
            BasketballMatchIncidentEventType.tipOff) {
          ballMovementStateNotifier.startTipOff(ballMovementstate.side);
        }
        if (ballMovementstate.ballMovementType ==
            BasketballMatchIncidentEventType.jumpBall) {
          ballMovementStateNotifier.startJumpBall(ballMovementstate.side);
        }
      }
    }

    return artboard;
  }

  throw Exception('Minimized Ball artboard not found');
});
