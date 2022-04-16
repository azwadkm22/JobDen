import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/user_account.dart';
import 'package:job_den/views/home/home_screen.dart';

class UserController {
  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection('users');

  var isLoading = false.obs;
  var hasInfo = false.obs;
  UserAccount? user;

  Future<void> getUserAccount(String? uid) async {
    isLoading(true);
    try {
      var docSnap = await userCollection.doc(uid).get();
      if(docSnap.exists) {
        user = UserAccount.fromDocumentSnapshot(docSnap);
      }
    } catch (e) {
      print(e);
    }
    finally{
      print("reached finally");
      isLoading(false);
    }
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



  void updateUserInfo(){}

  void enableEdit(){}
  void disableEdit(){}
}