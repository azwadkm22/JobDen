import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Logout",
            backgroundColor: ColorPalette.white,
            cancelTextColor: ColorPalette.blue,
            confirmTextColor: ColorPalette.textColor,
            buttonColor: ColorPalette.blue,
            titleStyle: TextStyle(fontSize: 22),
            middleText: "Are you sure you want to log out?",
            textCancel: "No",
            textConfirm: "Yes",
            onCancel: () {},
            onConfirm: () {
              // authController.signOut();
              Navigator.of(context).pop();
            });
      },
      icon: Icon(Icons.logout, color: ColorPalette.blue,),
    );
  }
}