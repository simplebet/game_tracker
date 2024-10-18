import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../util/constants.dart';
import '../rive_file_provider.dart';

final minimizedBackboardArtboardProvider =
    FutureProvider.autoDispose<Artboard>((ref) async {
  final file =
      await ref.read(minimizedBasketballTrackerRiveFileProvider.future);

  final artboard = file
      .artboardByName(BasketballTrackerRiveArtboards.backboardMinimized)
      ?.instance();

  if (artboard != null) {
    return artboard;
  }

  throw Exception('Backboard minimized artboard not found');
});
