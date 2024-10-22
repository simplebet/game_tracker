import 'dart:async';

import 'package:flame_rive/flame_rive.dart';

Future<void> waitForInactive(StateMachineController controller) async {
  if (controller.isActive) {
    final Completer completer = Completer();

    void listener() {
      if (!controller.isActive && !completer.isCompleted) {
        completer.complete();
        controller.isActiveChanged.removeListener(listener);
      }
    }

    controller.isActiveChanged.addListener(listener);

    return completer.future.timeout(
      const Duration(seconds: 6),
      onTimeout: () {
        controller.isActiveChanged.removeListener(listener);
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );
  }
}
