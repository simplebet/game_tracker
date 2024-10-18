import 'dart:async';

import 'package:flame/components.dart';

mixin Completable on Component {
  final Completer _completer = Completer();

  Future get onCompleted => _completer.future;

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}
