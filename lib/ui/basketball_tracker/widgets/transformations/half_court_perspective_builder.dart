import 'dart:math';

import 'package:flutter/material.dart';

class HalfCourtPerspectiveBuilder extends StatelessWidget {
  const HalfCourtPerspectiveBuilder({
    Key? key,
    required this.child,
    required this.isLeftSide,
    this.isMinimizedView = false,
    this.isTextOverlay = false,
  }) : super(key: key);

  final bool isLeftSide;
  final Widget child;
  final bool isMinimizedView;
  final bool isTextOverlay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth * .5;
        final height = constraints.maxHeight;

        final rotateX = _getRotateXValue(width);
        final translateY = _getTranslateYValue(width, isMinimizedView);

        final scaleXTextOverlay = isTextOverlay ? .95 : .78;
        final scaleXLeft =
            isLeftSide && !isTextOverlay ? .91 : scaleXTextOverlay;
        final scaleX = isMinimizedView ? scaleXLeft : .807;

        final scaleYTextOverlay = isTextOverlay ? 2.75 : 2.8;
        final scaleY =
            isMinimizedView ? scaleYTextOverlay : _getScaleYValue(width);
        final vFactor = isMinimizedView ? 0.008 : 0.01;

        return Transform(
          // Set 3D perspective
          transform: Matrix4.identity()
            ..setRotationY(isLeftSide ? 0 : pi)
            ..setEntry(3, 2, vFactor)
            ..rotateX(rotateX)
            ..translate(0.0, translateY)
            ..scale(scaleX, scaleY),
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: height,
            width: width,
            child: child,
          ),
        );
      },
    );
  }
}

double _getRotateXValue(double width) {
  {
    final closestValues = getClosestValues(width);
    return closestValues!['rotateX']!;
  }
}

double _getScaleYValue(double width) {
  final closestValues = getClosestValues(width);
  return closestValues!['scaleY']!;
}

double _getTranslateYValue(double width, bool isMinimizedView) {
  if (isMinimizedView) {
    return -36;
  }

  final closestValues = getClosestValues(width);
  return closestValues!['translateY']!;
}

Map<String, double>? getClosestValues(double width) {
  double closestWidth = _courtPositioningData.keys
      .reduce((a, b) => (width - a).abs() < (width - b).abs() ? a : b);
  return _courtPositioningData[closestWidth];
}

final Map<double, Map<String, double>> _courtPositioningData = {
  210: {
    'rotateX': -0.365,
    'translateY': -15.25,
    'scaleX': 0.807,
    'scaleY': 1.095
  },
  200: {
    'rotateX': -0.385,
    'translateY': -14.64,
    'scaleX': 0.807,
    'scaleY': 1.11
  },
  190: {'rotateX': -0.4, 'translateY': -14, 'scaleX': 0.807, 'scaleY': 1.11},
  180: {
    'rotateX': -0.42,
    'translateY': -13.25,
    'scaleX': 0.807,
    'scaleY': 1.12
  },
  170: {'rotateX': -0.44, 'translateY': -13, 'scaleX': 0.807, 'scaleY': 1.14},
  160: {
    'rotateX': -0.47,
    'translateY': -12.25,
    'scaleX': 0.807,
    'scaleY': 1.15
  },
  150: {
    'rotateX': -0.495,
    'translateY': -11.5,
    'scaleX': 0.807,
    'scaleY': 1.165
  },
  140: {
    'rotateX': -0.52,
    'translateY': -10.75,
    'scaleX': 0.807,
    'scaleY': 1.17,
  },
  130: {
    'rotateX': -0.55,
    'translateY': -10,
    'scaleX': 0.807,
    'scaleY': 1.19,
  },
  120: {
    'rotateX': -0.59,
    'translateY': -10,
    'scaleX': 0.807,
    'scaleY': 1.24,
  },
  110: {
    'rotateX': -0.63,
    'translateY': -9.5,
    'scaleX': 0.807,
    'scaleY': 1.27,
  },
  100: {
    'rotateX': -0.675,
    'translateY': -8.75,
    'scaleX': 0.807,
    'scaleY': 1.315,
  },
};
