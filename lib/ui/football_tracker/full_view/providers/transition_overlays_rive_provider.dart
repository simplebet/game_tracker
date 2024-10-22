import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:rive/rive.dart';

final transitionOverlaysRiveProvider =
    FutureProvider.autoDispose<RiveFile>((ref) async {
  await RiveFile.initializeText();
  final file = await RiveFile.asset(kTransitionOverlaysRivePath);

  return file;
});
