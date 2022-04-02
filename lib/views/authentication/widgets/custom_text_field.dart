import 'package:flutter/material.dart';

import '../../common_widgets/color_palette.dart';

class CustomTextField extends Container {
  CustomTextField({
    required controller,
    required hintText,
    bool isPassword = false,
  }) :
        super(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration: BoxDecoration(
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),

            child: TextField(

              obscureText: isPassword,
              controller: controller,
              style: TextStyle(
                color: ColorPalette.black,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: ColorPalette.blue,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              ),
            );
}