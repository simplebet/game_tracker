import 'dart:async';

import 'package:flame_rive/flame_rive.dart';

import 'package:game_tracker/ui/football_tracker/full_view/controllers/controller_helper.dart';

class FlagController {
  FlagController({required StateMachineController controller}) {
    _flagTrigger = controller.findInput<bool>('flagThrow')! as SMITrigger;
    _controller = controller;
  }
  late SMITrigger _flagTrigger;
  late StateMachineController _controller;

  Future<void> flagThrow() async {
    _flagTrigger.fire();
    await waitForInactive(_controller);
  }
}
