import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/job_post.dart';
import 'package:job_den/views/search/search_result_screen.dart';

class SearchController extends GetxController{
  final CollectionReference<Map<String, dynamic>> jobCollection =
  FirebaseFirestore.instance.collection('jobs');

  var isLoading = false.obs;
  var jobPostList = <JobPost>[].obs;


  void searchJobs(bool isInternship, bool isPartTime, bool isRemote, bool isFullTime, String location, int salaryRangeStart, int salaryRangeEnd, String field){
    jobPostList.clear();
    for (var element in jobPostController.jobPostList) {
      if(element.salaryRangeStart < salaryRangeStart && element.salaryRangeEnd > salaryRangeEnd) continue;
      if(isInternship && !element.jobType.contains("Internship")) continue;
      if(isPartTime && !element.jobType.contains("Part Time")) continue;
      if(isFullTime && !element.jobType.contains("Full Time")) continue;
      if(isRemote && !element.jobType.contains("Remote")) continue;
      if(location.compareTo(element.location) != 0) continue;
      if(field != "" && field.compareTo(element.jobField) != 0) continue;
      jobPostList.add(element);
    }
    Get.to(() => SearchResultScreen());
  }
  void filterJobs(){}
}