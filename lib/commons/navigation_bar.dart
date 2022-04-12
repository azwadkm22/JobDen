import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/views/account/account_details_screen.dart';
import 'package:job_den/views/add_jobpost/add_jobpost_screen.dart';
import 'package:job_den/views/home/home_screen.dart';
import 'package:job_den/views/search/search_screen.dart';
import 'package:job_den/views/starred/starred_screen.dart';

import '../views/common_widgets/color_palette.dart';

class AppNavigationBar extends BottomNavigationBar {
  AppNavigationBar({
    required int index,
    Color bgColor = ColorPalette.black,
    Color unselectedColor = ColorPalette.backgroundColor,
    Color selectedColor = ColorPalette.blue,
  }) : super(
    onTap: (int index) {
      if (index == 0) {
        Get.offAll(() =>
        //First index Screen
        HomeScreen());
      } else if (index == 1) {
        Get.offAll(() =>
          AddJobPostScreen()
        );
      } else if (index == 2) {
        Get.offAll(() =>
          SearchScreen()
        );
      } else if (index == 3) {
        Get.offAll(() =>
          StarredScreen()
        );
      } else if (index == 4) {
        Get.offAll(() =>
          AccountDetails()
        );
      }
    },
    unselectedItemColor: unselectedColor,
    selectedItemColor: selectedColor,
    currentIndex: index,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: "Add Job Post",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_rounded),
        label: "Search",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: "Starred",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: "Account",
        backgroundColor: bgColor,
      ),
    ],
  );
}