import 'package:flutter/material.dart';
import 'package:job_den/views/common_widgets/specific_type_field.dart';

import '../authentication/widgets/custom_text_field.dart';
import '../common_widgets/color_palette.dart';

class InfoToSpecificFieldSwitcher extends Row {
  InfoToSpecificFieldSwitcher({Key? key, required label,required controller, required info, required isEditable, required keyboardType, required maxLength}) : super(
    key: key,
    children: [
      Expanded(flex: 4, child: Text(label + ":", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
      isEditable ?
      Expanded(flex: 8,child:
      SpecificTypeField(controller: controller, hintText: info.toString(), smallMargin: true, keyboardType: keyboardType,maxLength: maxLength, ))
          :
      Expanded(flex: 8, child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 15),
        child: Text(info.toString(), style: const TextStyle(fontSize: 18, color: ColorPalette.black),),
      ),),
    ],
  );
}