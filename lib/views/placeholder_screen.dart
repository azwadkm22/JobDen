import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/views/authentication/login_page.dart';
import 'package:job_den/views/home/home_screen.dart';

class PlaceHolderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ((authController.user != null)) {
        jobPostController.getJobPosts();
        return HomeScreen();
      } else {
        return LoginPage();
      }
    });
  }
}
