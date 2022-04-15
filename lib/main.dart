import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/controllers/job_post_controller.dart';
import 'package:job_den/views/placeholder_screen.dart';

import 'controllers/auth_controller.dart';
import 'controllers/search_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(JobPostController());
  Get.put(SearchController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JobDen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          PlaceHolderScreen(),
        // LoginPage()
      // SignUpPage()
      // HomeScreen(),
      // PasswordChangeRequestPage()

      // JobDetailsScreen(jobTitle: "jobTitle",
      //     jobDesc: "Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum  Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsum ",
      //     qualifications: ["Need to do shit", "Gotta control Shit", "Need to do shit",  "Gotta control Shit", "Need to do shit"],
      //     companyName: "Asia Industries Limited",
      //     location: "Dhaka",
      //     jobType: ["Remote","Internship","Onsite",],
      //     jobField: "jobField",
      //     salaryRangeStart: 1000,
      //     salaryRangeEnd: 1000),

    );
  }
}

