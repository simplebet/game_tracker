import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../shared/constants.dart';

final transitionOverlaysRiveProvider =
    FutureProvider.autoDispose<RiveFile>((ref) async {
  await RiveFile.initializeText();
  final file = await RiveFile.asset(kTransitionOverlaysRivePath);

  return file;
});
