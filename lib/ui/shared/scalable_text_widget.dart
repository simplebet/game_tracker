import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

const int kBaseScreenWidth = 390;

class ScalableTextWidget extends StatelessWidget {
  const ScalableTextWidget({
    required this.text,
    required this.textStyle,
    required this.maxWidth,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final String text;
  final TextStyle textStyle;
  final double maxWidth;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: textStyle,
      textScaleFactor: maxWidth / kBaseScreenWidth,
      textAlign: textAlign,
    );
  }
}
