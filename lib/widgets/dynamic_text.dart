import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  final Color? textColor;
  final String? text;
  final double? textSize;
  final FontWeight? textWeight;
  final TextAlign? alignment;
  final int? lines;
  final TextOverflow? overflow;
  final String? textStyle;

  DynamicText(
      {super.key,
      this.textColor,
      this.textSize,
      this.textWeight,
      this.text,
      this.alignment,
      this.lines,
      this.overflow,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: alignment,
      maxLines: lines,
      overflow: overflow,
      style: TextStyle(
          fontFamily: textStyle,
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight),
    );
  }
}
