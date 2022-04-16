import 'package:get/get.dart';
import 'package:job_den/controllers/job_post_controller.dart';
import 'package:job_den/controllers/search_controller.dart';
import 'package:job_den/controllers/user_controller.dart';

import '../controllers/auth_controller.dart';

AuthController authController = Get.find();
JobPostController jobPostController = Get.find();
SearchController searchController = Get.find();
UserController userController = Get.find();