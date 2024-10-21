import 'package:flame_rive/flame_rive.dart';

class FootballController {
  FootballController({required StateMachineController controller}) {
    _idleHorizontalTrigger =
        controller.findInput<bool>('idleHorizontal')! as SMITrigger;
    _idleVerticalTrigger =
        controller.findInput<bool>('idleVertical')! as SMITrigger;
    _idleForwardTrigger =
        controller.findInput<bool>('idleForward')! as SMITrigger;
    _idleAngledTrigger =
        controller.findInput<bool>('idleAngled')! as SMITrigger;
    _spiralTrigger = controller.findInput<bool>('spiral')! as SMITrigger;
    _flipTrigger = controller.findInput<bool>('flip')! as SMITrigger;
    _fumbleTrigger = controller.findInput<bool>('fumble')! as SMITrigger;
  }

  late SMITrigger _idleHorizontalTrigger;
  late SMITrigger _idleVerticalTrigger;
  late SMITrigger _idleForwardTrigger;
  late SMITrigger _idleAngledTrigger;
  late SMITrigger _spiralTrigger;
  late SMITrigger _flipTrigger;
  late SMITrigger _fumbleTrigger;

  /// Sets the angle to 0 degrees with laces facing up
  void idleHorizontal() {
    _idleHorizontalTrigger.fire();
  }

  /// Sets the angle to 90 degrees with laces facing left
  void idleVertical() {
    _idleVerticalTrigger.fire();
  }

  /// Sets the angle to 0 degrees with laces facing towards screen
  void idleForward() {
    _idleForwardTrigger.fire();
  }

  /// Angles the ball 45 degrees to the right
  void idleAngled() {
    _idleAngledTrigger.fire();
  }

  /// Spiral animation with ball at 0 degrees
  void spiral() {
    _spiralTrigger.fire();
  }

  /// Clockwise flipping animation
  void flip() {
    _flipTrigger.fire();
  }

  /// Triggers the standalone fumble animation
  void fumble() {
    _fumbleTrigger.fire();
  }
}
