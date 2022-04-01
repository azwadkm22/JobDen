import 'package:flutter/material.dart';
import 'color_palette.dart';

class GenericButton extends SizedBox {
  GenericButton({
    double padding = 50,
    Color textColor = ColorPalette.textColor,
    double borderRadius = 8,
    double fontSize = 24,
    required String label,
    Color color = ColorPalette.blue,
    required VoidCallback onPressed,
  }) :
        super(
          child: Padding(
            padding: EdgeInsets.all(padding/5),
            child: ElevatedButton(
                onPressed: onPressed,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(label,
                    style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.w500,
                      // fontFamily: FontResource.secondaryFont
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
                    padding: EdgeInsets.fromLTRB(padding, padding/5, padding, padding/5)
                ),
            ),
          )
      );
}