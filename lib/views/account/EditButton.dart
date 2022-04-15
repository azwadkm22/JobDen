import 'package:flutter/material.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

class EditButton extends Container {
  EditButton({Key? key,
    required VoidCallback onPressed,
  }) :
        super(key: key,
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(flex: 4,child: Container()),
            ElevatedButton(
              onPressed: onPressed,
              child: const Icon(Icons.edit, color: ColorPalette.textColor, size: 30,),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  primary: ColorPalette.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ],
        ),
      );
}