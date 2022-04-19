import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/user_account.dart';
import 'package:job_den/views/home/home_screen.dart';

import '../models/job_post.dart';

class UserController {
  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection('users');

  var isLoading = false.obs;
  var hasInfo = false.obs;
  var userList = <UserAccount>[].obs;
  Rx<UserAccount>? user;


  Future<void> getUserAccount(String? uid) async {
    isLoading(true);
    try {
      userList.bindStream(listStream(uid));
    } catch (e) {
      print(e);
    }
    finally{
      print("reached finally");
      isLoading(false);
    }
  }

  Stream<List<UserAccount>> listStream(String? uid) {
    return userCollection
        .snapshots()
        .map((QuerySnapshot query) {
      List<UserAccount> retVal = [];
      query.docs.forEach((element) {
        if(element.reference.id == uid) user = UserAccount.fromDocumentSnapshot(element).obs;
        retVal.add(UserAccount.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }



  Future<void> setUserInfo(
      String? uid,
      String? email,
      String lastName,
      String firstName,
      String dateOfBirth,
      String fieldOfStudy,
      String institution,
      int graduationYear,
      String address,
      String phoneNumber,
      List<String> starredJobPostId) async {
    try {
      await userCollection.doc(uid).set({
        "email" : email,
        "lastName" : lastName,
        "firstName" : firstName,
        "dateOfBirth" : dateOfBirth,
        "fieldOfStudy" : fieldOfStudy,
        "institution" : institution,
        "graduationYear" : graduationYear,
        "address" : address,
        "phoneNumber": phoneNumber,
        "starredJobPostId": starredJobPostId
      });

    } catch (e) {
      e.printError();
    }
    finally {

    }
  }

  Future<void> addToStarred(String? uid, String jobId) async {
    isLoading(true);
    List<dynamic> idList = [];
    await getUserAccount(uid);
    idList.addAll(user!.value.starredJobPostId);
    idList.add(jobId);

    try{
      await userCollection.doc(uid).update({
        "starredJobPostId": idList
      });
      await getUserAccount(uid);
      await starredController.getStarredList(uid);
    // ignore: empty_catches
    }catch(e) {

    }
    finally{
      isLoading(false);
    }
  }

  Future<void> removeFromStarred(String? uid, String jobId) async {
    isLoading(true);
    List<dynamic> idList = [];
    await getUserAccount(uid);
    idList.addAll(user!.value.starredJobPostId);
    idList.remove(jobId);

    try{
      await userCollection.doc(uid).update({
        "starredJobPostId": idList
      });
      await getUserAccount(uid);
      await starredController.getStarredList(uid);
      // ignore: empty_catches
    }catch(e) {

    }
    finally{
      isLoading(false);
    }
  }


  void updateUserInfo(){}

  void enableEdit(){}
  void disableEdit(){}
}