import 'dart:math';

import 'package:flutter/material.dart';

class MirrorTransform extends StatelessWidget {
  const MirrorTransform({
    Key? key,
    required this.child,
    required this.doFlip,
  }) : super(key: key);
  final bool doFlip;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(doFlip ? pi : 0),
      alignment: Alignment.center,
      child: child,
    );
  }
}
