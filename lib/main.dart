import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/app_startup.dart';

import 'package:overlay_support/overlay_support.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: OverlaySupport.global(
        child: AppStartupWidget(),
      ),
    ),
  );
}