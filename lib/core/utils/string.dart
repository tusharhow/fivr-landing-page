import 'package:flutter/material.dart';

extension TextMeasurement on String {
  double height({
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    TextStyle? style,
    required double maxWidth,
    int? maxLines,
  }) {
    final TextSpan textSpan = TextSpan(
      text: this,
      style: style ?? TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: maxWidth);

    return textPainter.height;
  }
}
