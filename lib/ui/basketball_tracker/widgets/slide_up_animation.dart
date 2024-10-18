import 'package:flutter/material.dart';

class SlideUpAnimation extends StatefulWidget {
  const SlideUpAnimation({
    super.key,
    required this.triggerSlideUpAnimation,
    required this.child,
  });

  final bool triggerSlideUpAnimation;
  final Widget child;

  @override
  State<SlideUpAnimation> createState() => _SlideUpAnimationWidgetState();
}

class _SlideUpAnimationWidgetState extends State<SlideUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _toggleAnimation() {
    if (widget.triggerSlideUpAnimation) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _toggleAnimation();

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: 1,
          child: widget.child),
    );
  }
}
