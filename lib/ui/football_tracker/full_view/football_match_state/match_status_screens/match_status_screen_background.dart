import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';


class MatchStatusScreenBackground extends ConsumerWidget {
  const MatchStatusScreenBackground({
    Key? key,
    required this.child,
    required this.size,
    this.withLargerBg = false,
  }) : super(key: key);

  final Widget child;
  final Size size;
  final bool withLargerBg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skin = GameTrackerSkin();

    return Center(
      child: Container(
        width: size.width * (withLargerBg ? 0.54 : 0.35),
        height: size.height * (withLargerBg ? 0.32 : 0.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: skin.colors.background.withOpacity(.75),
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            boxShadow: [
              BoxShadow(
                  color: skin.colors.grey5.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 2))
            ]),
        child: child,
      ),
    );
  }
}
