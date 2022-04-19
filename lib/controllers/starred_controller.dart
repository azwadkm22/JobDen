import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/job_post.dart';

class StarredController extends GetxController{
  var isLoading = false.obs;
  var starredJobList = <JobPost>[].obs;

  Future<void> getStarredList(String? uid) async{
    starredJobList.clear();
    isLoading(true);
    List<dynamic> idList = [];
    idList.addAll(userController.user!.value.starredJobPostId);
    for(var id in idList) {
      for(var job in jobPostController.jobPostList) {
        if(id.toString().compareTo(job.jobPostID.toString()) == 0) {
          starredJobList.add(job);
        }
      }
    }
    isLoading(false);
  }

  bool checkIfStarred(String? uid, JobPost job) {
    List<dynamic> idList = [];
    userController.getUserAccount(uid);
    idList.addAll(userController.user!.value.starredJobPostId);
    return idList.contains(job.jobPostID);
  }
}