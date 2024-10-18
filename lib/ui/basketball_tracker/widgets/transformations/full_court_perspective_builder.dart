import 'package:flutter/material.dart';

class FullCourtPerspectiveBuilder extends StatelessWidget {
  const FullCourtPerspectiveBuilder({
    Key? key,
    required this.child,
    this.isMinimizedView = false,
    this.isTextOverlay = false,
  }) : super(key: key);

  final Widget child;
  final bool isMinimizedView;
  final bool isTextOverlay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final rotateX = _getRotateXValue(width);
        final translateY = _getTranslateYValue(width);
        final scaleX = isMinimizedView ? .94 : .805;
        final scaleYTextOverlay = isTextOverlay ? 2.1 : 1.67;
        final scaleY =
            isMinimizedView ? scaleYTextOverlay : _getScaleYValue(width);
        final vFactor = isMinimizedView ? 0.008 : 0.01;

        return Transform(
          // Set 3D perspective
          transform: Matrix4.identity()
            ..setEntry(3, 2, vFactor)
            ..rotateX(rotateX)
            ..translate(0.0, translateY)
            ..scale(scaleX, scaleY),
          alignment: Alignment.center,
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
    final closestValues = _getClosestValues(width);
    return closestValues['rotateX']!;
  }
}

double _getScaleYValue(double width) {
  final closestValues = _getClosestValues(width);
  return closestValues['scaleY']!;
}

double _getTranslateYValue(double width) {
  final closestValues = _getClosestValues(width);
  return closestValues['translateY']!;
}

Map<String, double> _getClosestValues(double width) {
  final closestKey = _courtPositioningData.keys.reduce((value, element) {
    return (element - width).abs() < (value - width).abs() ? element : value;
  });
  return _courtPositioningData[closestKey]!;
}

final Map<double, Map<String, double>> _courtPositioningData = {
  420: {
    'rotateX': -0.365,
    'translateY': -15,
    'scaleY': 1.1,
  },
  400: {
    'rotateX': -0.38,
    'translateY': -14.6,
    'scaleY': 1.105,
  },
  380: {
    'rotateX': -0.4,
    'translateY': -14,
    'scaleY': 1.12,
  },
  360: {
    'rotateX': -0.42,
    'translateY': -13.25,
    'scaleY': 1.125,
  },
  340: {
    'rotateX': -0.44,
    'translateY': -12.75,
    'scaleY': 1.14,
  },
  320: {
    'rotateX': -0.465,
    'translateY': -12,
    'scaleY': 1.15,
  },
  300: {
    'rotateX': -0.49,
    'translateY': -11.6,
    'scaleY': 1.17,
  },
  280: {
    'rotateX': -0.52,
    'translateY': -11,
    'scaleY': 1.19,
  },
  260: {
    'rotateX': -0.555,
    'translateY': -10.5,
    'scaleY': -1.215,
  },
  240: {
    'rotateX': -0.59,
    'translateY': -9.75,
    'scaleY': 1.24,
  },
  220: {
    'rotateX': -0.63,
    'translateY': -9.5,
    'scaleY': 1.28,
  },
  200: {
    'rotateX': -0.675,
    'translateY': -8.7,
    'scaleY': 1.32,
  },
};
