import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PressableText extends Container {

  PressableText({Key? key,
    var alignment = Alignment.center,
    required VoidCallback onPressed,
    String unhighlightedText = "",
    required String highlightedText,
  }) :
        super(key: key,
          alignment: alignment,
          margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text.rich(
            TextSpan(
              text: unhighlightedText,
              style: TextStyle(fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                  text: highlightedText,
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPressed,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                // can add more TextSpans here...
              ],
            ),
          )
      );
}