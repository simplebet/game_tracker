import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:rive/rive.dart';

final footballTrackerRiveProvider =
    FutureProvider.autoDispose<RiveFile>((ref) async {
  final file = await RiveFile.asset(kFootballTrackerRivePath);

  return file;
});
