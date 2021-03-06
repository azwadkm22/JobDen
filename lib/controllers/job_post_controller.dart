import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/job_post.dart';
import 'package:job_den/views/home/home_screen.dart';
import 'package:job_den/views/placeholder_screen.dart';

class JobPostController extends GetxController{
  final CollectionReference<Map<String, dynamic>> jobCollection =
  FirebaseFirestore.instance.collection('jobs');

  var isLoading = false.obs;
  var jobPostList = <JobPost>[].obs;

  Future<void> getJobPosts() async {
    try {
      jobPostList.bindStream(listStream());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<JobPost>> listStream() {
    return jobCollection
        .snapshots()
        .map((QuerySnapshot query) {
      List<JobPost> retVal = [];
      query.docs.forEach((element) {
        retVal.add(JobPost.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addJobPost(
  String jobTitle,
  String companyName,
  List<dynamic> qualifications,
  int salaryRangeStart,
  int salaryRangeEnd,
  List<dynamic> jobType,
  String jobDesc,
  String location,
  String jobField,
      ) async {

    try {
      if (isLoading.value == true) return;
      isLoading(true);
      await jobCollection.doc().set({
        "jobTitle": jobTitle,
        "companyName": companyName,
        "qualifications": qualifications,
        "salaryRangeStart": salaryRangeStart,
        "salaryRangeEnd": salaryRangeEnd,
        "jobDesc": jobDesc,
        "jobType": jobType,
        "jobField": jobField,
        "posterID": authController.user?.uid,
        "postingDate": DateTime.now().millisecondsSinceEpoch,
        "location": location,
        "emailForApplying": authController.user?.email,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
      Get.offAll(HomeScreen());
    }
  }

  Future<void> deleteJobPost(String? uid) async {
    try {
      var snapshot = await jobCollection
          .doc(uid)
          .get();
      await snapshot.reference.delete();
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    finally{
      Get.back();
    }
  }
}