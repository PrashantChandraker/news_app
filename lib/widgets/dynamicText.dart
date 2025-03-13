import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  final Color? textColor;
  final String? text;
  final double? textSize;
  final FontWeight? textWeight;

  DynamicText(
      {super.key, this.textColor, this.textSize, this.textWeight, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          color: textColor, fontSize: textSize, fontWeight: textWeight),
    );
  }
}
