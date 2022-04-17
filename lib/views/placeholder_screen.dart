import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/views/add_details/add_details_screen.dart';
import 'package:job_den/views/authentication/login_page.dart';
import 'package:job_den/views/home/home_screen.dart';

class PlaceHolderScreen extends StatelessWidget {
  const PlaceHolderScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ((authController.user != null)) {
        jobPostController.getJobPosts();
        userController.getUserAccount(authController.user?.uid);
        if(authController.isNewUser.value) {
          return AddDetailsScreen();
        } else {
          return HomeScreen();
        }
      } else {
        return LoginPage();
      }
    });
  }
}
