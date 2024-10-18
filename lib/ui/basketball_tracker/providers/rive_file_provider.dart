import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

final riveFileProvider = FutureProvider.autoDispose<RiveFile>((ref) async {
  final file = await RiveFile.asset('assets/animations/basketball.riv');

  return file;
});

final minimizedBasketballTrackerRiveFileProvider =
    FutureProvider.autoDispose<RiveFile>((ref) async {
  final file = await RiveFile.asset(
      'assets/animations/basketball_tracker_minimized.riv');

  return file;
});
