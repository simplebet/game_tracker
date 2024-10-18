import 'package:flutter/material.dart';

import '../widgets/slide_up_animation.dart';

class AnimatedSwipe extends StatelessWidget {
  const AnimatedSwipe({
    super.key,
    required this.teamColor,
    required this.child,
    required this.maxWidth,
  });

  final Color teamColor;
  final Widget child;

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SlideUpAnimation(
      triggerSlideUpAnimation: true,
      child: AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        color: teamColor,
        duration: const Duration(milliseconds: 200),
        child: AnimatedSlide(
          offset: const Offset(0, 0),
          duration: const Duration(milliseconds: 200),
          child: child,
        ),
      ),
    );
  }
}
