import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../shared/constants.dart';
import '../../minimized_view/state_notifier/transition_overlays_minimized_notifier.dart';

final transitionOverlaysMinimizedRiveProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  await RiveFile.initializeText();
  final file = await RiveFile.asset(kTransitionOverlaysMinimizedRivePath);
  final transitionOverlayNotifier =
      ref.read(transitionOverlaysMinimizedStateProvider.notifier);

  final artboard = file.artboardByName('Transitions');

  if (artboard != null) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'StateMachine');

    if (controller != null) {
      artboard.addController(controller);
      transitionOverlayNotifier.initStateMachineInputs(
          stateMachineController: controller);
    }

    return artboard;
  }

  throw Exception('Transition overlay minimized artboard not found');
});
