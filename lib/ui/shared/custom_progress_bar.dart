import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);

    _animation = Tween<double>(begin: -1, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.transparent,
      ),
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          const int gradientWidth =
              3; // Affects how wide the gradient is. Higher number = wider gradient
          double begin = _animation.value - gradientWidth;
          double end = _animation.value + gradientWidth;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.transparent,
                  Colors.white,
                  Colors.transparent
                ],
                stops: const [0.0, 0.5, 1.0], // Define the positions of colors
                begin: Alignment(begin, 0),
                end: Alignment(end, 0),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
