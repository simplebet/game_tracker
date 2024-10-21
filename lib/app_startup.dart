import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/core/repositories/game_tracker_repository.dart';
import 'package:game_tracker/core/services/socket_service.dart';
import 'package:game_tracker/ui/game_tracker_screen.dart';
import 'package:game_tracker/ui/game_tracker_screen_controller.dart';
import 'package:game_tracker/ui/home_screen.dart';
import 'package:game_tracker/ui/shared/game_tracker_loading_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: false)
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    ref
      ..invalidate(socketServiceProvider)
      ..invalidate(gameTrackerRepositoryProvider)
      ..invalidate(gameTrackerScreenControllerProvider);
  });

  await Future.microtask(() async {
    await ref.watch(socketServiceProvider.future);
    await ref.watch(gameTrackerRepositoryProvider.future);
  });
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (_, constraints) {
          final size = Size(constraints.maxWidth, constraints.maxHeight);
          return Scaffold(
            body: appStartupState.when(
              loading: () => const SizedBox.shrink(),
              data: (_) => kDebugMode
                  ? HomeScreen(size: size)
                  : GameTrackerScreen(size: size),
              error: (error, _) {
                return GameTrackerLoadingWidget(
                  maxWidth: size.width,
                  maxHeight: size.height,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
