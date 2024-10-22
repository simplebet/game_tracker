import 'package:flutter/material.dart';

import 'package:game_tracker/ui/shared/constants.dart';

class FootballMatchStateAnimationWrapper extends StatefulWidget {
  const FootballMatchStateAnimationWrapper({
    required this.child,
    required this.updated,
    required this.onEndCallback,
    required this.maxHeight,
    super.key,
  });

  final Widget child;
  final bool updated;
  final VoidCallback onEndCallback;
  final double maxHeight;

  @override
  State<FootballMatchStateAnimationWrapper> createState() =>
      _FootballMatchStateAnimationWrapperState();
}

class _FootballMatchStateAnimationWrapperState
    extends State<FootballMatchStateAnimationWrapper> {
  late bool _updated;

  @override
  void initState() {
    _updated = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FootballMatchStateAnimationWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.updated != widget.updated) {
      _updated = widget.updated;
    } else {
      _updated = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height:
          _updated ? 0 : widget.maxHeight * kBaseMatchStateWidgetHeightFactor,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 400),
      onEnd: widget.onEndCallback,
      child: widget.child,
    );
  }
}
