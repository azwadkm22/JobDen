import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_palette.dart';

class SpecificTypeField extends Container {
  SpecificTypeField({Key? key,
    required controller,
    required hintText,
    required keyboardType,
    required maxLength,
    smallMargin = false,
  }) :
        super(key: key,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: smallMargin ? const EdgeInsets.all(0) : const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
          color: const Color(0xffcdcdcd),
          borderRadius: BorderRadius.circular(5),
        ),

        child: TextField(
          keyboardType: keyboardType,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength),],
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