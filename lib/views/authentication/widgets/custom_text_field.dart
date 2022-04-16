import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common_widgets/color_palette.dart';

class CustomTextField extends Container {
  CustomTextField({Key? key,
    required controller,
    required hintText,
    smallMargin = false,
    bool isPassword = false,
    bool onlyNumeric = false,
    bool isPhoneNumber = false,
  }) :
        super(key: key,
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: smallMargin ? const EdgeInsets.all(0) : const EdgeInsets.fromLTRB(30, 0, 30, 10),
            decoration: BoxDecoration(
              color: const Color(0xffcdcdcd),
              borderRadius: BorderRadius.circular(5),
            ),

            child: TextField(
              inputFormatters: isPhoneNumber ? [LengthLimitingTextInputFormatter(11),] : [],
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
              ),
            );
}