import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game_tracker/core/models/enums.dart';
import 'package:game_tracker/ui/shared/completable_mixin.dart';
import 'package:game_tracker/ui/shared/constants.dart';
import 'package:game_tracker/ui/shared/enums.dart';
import 'package:game_tracker/ui/shared/util.dart';
import 'package:game_tracker/ui/skin/game_tracker_skin.dart';

class PlayRibbonComponent extends PositionComponent
    with HasGameRef, Completable {
  PlayRibbonComponent({
    required this.color,
    required this.text,
    required this.yardline,
    required this.side,
    required this.direction,
    required this.skin,
    this.teamAbbreviation,
    this.playType,
  });

  final Color color;
  final String text;
  final int yardline;
  final HomeOrAway side;
  final HomeOrAway direction;
  final String? teamAbbreviation;
  final RushOrPass? playType;
  final GameTrackerSkin skin;

  double _animationProgress = 0; // 0 = not started, 1 = completed
  bool _isAnimatingIn = true;
  bool _isAnimatingOut = false;

  @override
  void onLoad() {
    priority = 5;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final double screenWidth = gameRef.size.x;

    final TextStyle textStyle = skin.textStyles.body4Medium.copyWith(
      fontSize: 17.5,
      color: Colors.white.withOpacity(
        _isAnimatingOut ? 1 - _animationProgress : _animationProgress,
      ),
    );

    final Size horizontalTextSize = textSize(text, textStyle);

    final TextStyle verticalTextStyle = skin.textStyles.body6Thick.copyWith(
      fontSize: 14,
      color: skin.colors.grey2.withOpacity(
        _isAnimatingOut ? 1 - _animationProgress : _animationProgress,
      ),
    );

    const double borderStrokeWidth = 3;

    final Size verticalTextSize = _calculateVerticalTextSize(verticalTextStyle);

    final double widthPadding =
        teamAbbreviation != null || playType != null ? 3 : 5;
    final double rectangleWidth =
        horizontalTextSize.width + verticalTextSize.height + widthPadding;
    const double ribbonHeight = kPassArrowHeight;

    const double triangleWidth = 8;

    position = _calculateComponentPosition(
      direction,
      yardline,
      screenWidth,
      triangleWidth,
      rectangleWidth,
      borderStrokeWidth,
      widthPadding,
    );

    final path = _createRibbonPath(
      rectangleWidth,
      triangleWidth,
      ribbonHeight,
      direction,
    );

    _drawRibbonPath(canvas, path);
    _renderBorder(canvas, path, borderStrokeWidth);

    _drawText(
      canvas,
      textStyle,
      rectangleWidth,
      horizontalTextSize.width,
      widthPadding,
      ribbonHeight,
      triangleWidth,
      verticalTextSize,
    );
    _drawVerticalText(
      canvas,
      widthPadding,
      ribbonHeight,
      verticalTextStyle,
      triangleWidth,
      horizontalTextSize.width,
    );
  }

  DateTime? _fadeInCompletionTime;
  final Duration _animationDuration =
      Duration(milliseconds: (kFadeOutSpeed * 1000).toInt());
  final Duration _displayDuration = Duration(
    milliseconds: (kPlayStartArrowDelay * 1000).toInt(),
  ); // or your desired duration

  DateTime? _animationStartTime;

  @override
  void update(double dt) {
    super.update(dt);

    _animationStartTime ??= DateTime.now();
    final passedTime = DateTime.now().difference(_animationStartTime!);
    _animationProgress = min(
      1,
      passedTime.inMilliseconds / _animationDuration.inMilliseconds.toDouble(),
    );

    if (_animationProgress == 1) {
      if (_isAnimatingIn) {
        _isAnimatingIn = false; // Animation in completed
        _fadeInCompletionTime = DateTime.now();
      }
      if (_isAnimatingOut) {
        complete();
        removeFromParent(); // Remove component after animation out
      }
    }

    if (_fadeInCompletionTime != null) {
      if (DateTime.now()
                  .difference(_fadeInCompletionTime!)
                  .compareTo(_displayDuration) >=
              0 &&
          !_isAnimatingOut) {
        _animateOut(); // Begin the fade-out animation after displayDuration has elapsed
      }
    }
  }

  void _renderBorder(Canvas canvas, Path path, double borderStrokeWidth) {
    final borderPaint = Paint()
      ..color = Colors.white.withOpacity(
        _isAnimatingOut ? 1 - _animationProgress : _animationProgress,
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderStrokeWidth;
    canvas.drawPath(path, borderPaint);
  }

  Path _createRibbonPath(
    double rectangleWidth,
    double triangleWidth,
    double ribbonHeight,
    HomeOrAway direction,
  ) {
    final Path path;

    if (direction == HomeOrAway.home) {
      // Draw ribbon with point on the right side
      path = Path()
        ..moveTo(0, 0) // Start top-left corner
        ..lineTo(rectangleWidth, 0) // Top right corner of rectangle
        ..lineTo(
          rectangleWidth + triangleWidth,
          ribbonHeight / 2,
        ) // Tip of the triangle
        ..lineTo(
          rectangleWidth,
          ribbonHeight,
        ) // Bottom right corner of rectangle
        ..lineTo(0, ribbonHeight) // Bottom left corner of rectangle
        ..close(); // Close path to top-left corner
    } else {
      // Draw ribbon with point on the left side
      path = Path()
        ..moveTo(0, ribbonHeight / 2) // Start at the tip of the triangle
        ..lineTo(triangleWidth, 0) // Top left corner of rectangle
        ..lineTo(
          triangleWidth + rectangleWidth,
          0,
        ) // Top right corner of rectangle
        ..lineTo(
          triangleWidth + rectangleWidth,
          ribbonHeight,
        ) // Bottom right corner of rectangle
        ..lineTo(triangleWidth, ribbonHeight) // Bottom left corner of rectangle
        ..close(); // Close path to tip of the triangle
    }

    return path;
  }

  Vector2 _calculateComponentPosition(
    HomeOrAway direction,
    int yardline,
    double screenWidth,
    double triangleWidth,
    double rectangleWidth,
    double borderStrokeWidth,
    double widthPadding,
  ) {
    double baseX;
    if (direction == HomeOrAway.home) {
      baseX = getXPosition(yardline, side, screenWidth) -
          triangleWidth -
          rectangleWidth +
          borderStrokeWidth -
          widthPadding;
    } else {
      baseX = getXPosition(yardline, side, screenWidth) +
          borderStrokeWidth +
          widthPadding;
    }

    final double offsetX = _isAnimatingIn
        ? (1 - _animationProgress) * rectangleWidth
        : 0; // Only apply offset when animating in

    return Vector2(
      baseX + (direction == HomeOrAway.home ? -offsetX : offsetX),
      gameRef.size.y * kArrowPathHeightFactor,
    );
  }

  void _drawRibbonPath(Canvas canvas, Path path) {
    final paint = Paint()
      ..color = color.withOpacity(
        _isAnimatingOut ? 1 - _animationProgress : _animationProgress,
      )
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  void _animateOut() {
    _isAnimatingIn = false;
    _isAnimatingOut = true;
    _animationStartTime = DateTime.now(); // Reset start time
    _animationProgress = 0; // Reset progress
  }

  Size _calculateVerticalTextSize(TextStyle style) {
    Size verticalTextSize;

    if (teamAbbreviation != null) {
      verticalTextSize = textSize(teamAbbreviation!, style);
    } else if (playType != null) {
      verticalTextSize = textSize(playType.toString().toUpperCase(), style);
    } else {
      verticalTextSize = Size.zero;
    }

    return verticalTextSize;
  }

  void _drawText(
    Canvas canvas,
    TextStyle style,
    double rectangleWidth,
    double horizontalTextWidth,
    double widthPadding,
    double ribbonHeight,
    double triangleWidth,
    Size verticalTextSize,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    double textX = rectangleWidth - horizontalTextWidth;
    if (direction == HomeOrAway.away) {
      textX = textX + triangleWidth - widthPadding;
    }

    if (playType != null) {
      textX = textX - verticalTextSize.height + 2;
    }
    final textPosition = Offset(textX, (ribbonHeight - textPainter.height) / 2);
    textPainter.paint(canvas, textPosition);
  }

  void _drawVerticalText(
    Canvas canvas,
    double widthPadding,
    double ribbonHeight,
    TextStyle verticalTextStyle,
    double triangleWidth,
    double horizontalTextWidth,
  ) {
    if (teamAbbreviation != null || playType != null) {
      final String verticalText =
          teamAbbreviation ?? playType.toString().toUpperCase();
      final verticalTextPainter = TextPainter(
        text: TextSpan(text: verticalText, style: verticalTextStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      double verticalTextX =
          direction == HomeOrAway.home ? widthPadding : triangleWidth;
      if (playType != null) {
        verticalTextX = verticalTextX + horizontalTextWidth;
      }
      final double verticalTextY =
          (ribbonHeight + verticalTextPainter.width) / 2;

      canvas
        ..save()
        ..rotate(-pi / 2)
        ..translate(-verticalTextY, verticalTextX);

      verticalTextPainter.paint(canvas, Offset.zero);

      canvas.restore();
    }
  }
}
