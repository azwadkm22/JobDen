import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_den/models/job_post.dart';

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

  void applyJobPost(){}
  void setActiveJob(){}
  void addJobPost(){}
  void deleteJobPost(){}
}