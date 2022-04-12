import 'package:flutter/material.dart';

import '../views/common_widgets/color_palette.dart';

class BoldText extends Padding {
  BoldText(String text) : super(
    padding: const EdgeInsets.all(10),
    child: Text(text, style: const TextStyle(
      color: ColorPalette.blue,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),)
  );
}
