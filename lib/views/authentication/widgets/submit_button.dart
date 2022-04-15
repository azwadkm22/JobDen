import 'package:flutter/material.dart';

import '../../common_widgets/color_palette.dart';

class SubmitButton extends Container {
  SubmitButton({
    required VoidCallback onPressed,
    required String text,
  }) :
        super(
            alignment: Alignment.center,
            child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal,
                // fontFamily: FontResource.secondaryFont
            ),
            ),
            style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(45, 12, 45, 12),
            primary: ColorPalette.blue,
            shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          );
}