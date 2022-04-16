import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'job_post.dart';

class UserAccount {
  String email;
  String lastName;
  String firstName;
  String dateOfBirth;
  String fieldOfStudy;
  String institution;
  int graduationYear;
  String address;
  String phoneNumber;
  List<dynamic> starredJobPostId;

  UserAccount({
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.dateOfBirth,
    required this.fieldOfStudy,
    required this.institution,
    required this.graduationYear,
    required this.address,
    required this.phoneNumber,
    required this.starredJobPostId,
});
  
  factory UserAccount.fromDocumentSnapshot(DocumentSnapshot doc) =>
      UserAccount(email: doc['email'], lastName: doc['lastName'], firstName: doc["firstName"], dateOfBirth: doc["dateOfBirth"], fieldOfStudy: doc["fieldOfStudy"], institution: doc["institution"], graduationYear: doc["graduationYear"], address: doc["address"], phoneNumber: doc["phoneNumber"], starredJobPostId: doc["starredJobPostId"]);
}