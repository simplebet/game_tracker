import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../util/constants.dart';
import 'rive_file_provider.dart';

final backboardArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file = await ref.read(riveFileProvider.future);

  final artboard =
      file.artboardByName(BasketballTrackerRiveArtboards.backboard)?.instance();

  if (artboard != null) {
    return artboard;
  }

  throw Exception('Backboard artboard not found');
});
