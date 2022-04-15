import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/models/user_account.dart';
import 'package:job_den/views/account/account_details_screen.dart';
import 'package:job_den/views/add_jobpost/add_jobpost_screen.dart';
import 'package:job_den/views/home/home_screen.dart';
import 'package:job_den/views/search/search_screen.dart';
import 'package:job_den/views/starred/starred_screen.dart';

import '../views/common_widgets/color_palette.dart';

class AppNavigationBar extends BottomNavigationBar {
  AppNavigationBar({Key? key,
    required int index,
    Color bgColor = ColorPalette.black,
    Color unselectedColor = ColorPalette.secondaryColor,
    Color selectedColor = ColorPalette.blue,
  }) : super(key: key,
    type: BottomNavigationBarType.fixed,
    onTap: (int index) {
      if (index == 0) {
        Get.offAll(() =>
        //First index Screen
        HomeScreen());
      } else if (index == 1) {
        Get.offAll(() =>
          const AddJobPostScreen()
        );
      } else if (index == 2) {
        Get.offAll(() =>
          const SearchScreen()
        );
      } else if (index == 3) {
        Get.offAll(() =>
          StarredScreen()
        );
      } else if (index == 4) {
        Get.offAll(() =>
          AccountDetailsScreen(userAccount: UserAccount(email: "azwadkm22@gmail.com", lastName: "lastName", firstName: "firstName", dateOfBirth: DateTime(1,1,1), fieldOfStudy: "fieldOfStudy", institution: "institution", graduationYear: 1999, address: "address", phoneNumber: "phoneNumber", starredJobPost: []))
        );
      }
    },
    unselectedItemColor: unselectedColor,
    selectedItemColor: selectedColor,
    backgroundColor: bgColor,
    currentIndex: index,
    items: [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Home",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_circle_outline),
        label: "Add Post",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search_rounded),
        label: "Search",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.star),
        label: "Starred",
        backgroundColor: bgColor,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        label: "Account",
        backgroundColor: bgColor,
      ),
    ],
  );
}