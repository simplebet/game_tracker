import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../shared/constants.dart';

final footballTrackerRiveProvider =
    FutureProvider.autoDispose<RiveFile>((ref) async {
  final file = await RiveFile.asset(kFootballTrackerRivePath);

  return file;
});
