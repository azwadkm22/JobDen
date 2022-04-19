// new TextField(
// decoration: const InputDecoration(
// hintText: 'Reply',
// labelText: 'Reply:',
// ),
// autofocus: false,
// focusNode: _focusnode,
// maxLines: null,
// controller: _newreplycontroller,
// keyboardType: TextInputType.text,
// ),
//

import 'package:flutter/material.dart';
import 'color_palette.dart';

class ExtendableTextField extends Container {
  ExtendableTextField({
    required controller,
    required hintText,
    bool isPassword = false,
  }) :
        super(
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
          color: Color(0xffcdcdcd),
          borderRadius: BorderRadius.circular(5),
        ),

        child: TextField(
          obscureText: isPassword,
          controller: controller,
          style: const TextStyle(
            color: ColorPalette.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: ColorPalette.blue,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          autofocus: false,
          maxLines: null,
        ),
      );
}