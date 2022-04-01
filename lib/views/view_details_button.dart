import 'package:flutter/material.dart';

class ViewDetailsButton extends SizedBox {
  ViewDetailsButton({
    Color textColor = Colors.white,
    double borderRadius = 8,
    double fontSize = 16,
    String label = "View Details",
    Color color = Colors.blueAccent,
    required VoidCallback onPressed,
  }) :
        super(
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
            ),
          )
      );
}