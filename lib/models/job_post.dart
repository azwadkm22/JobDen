import 'package:cloud_firestore/cloud_firestore.dart';

class JobPost {
  String jobPostID;
  String jobTitle;
  String companyName;
  List<dynamic> qualifications;
  int salaryRangeStart;
  int salaryRangeEnd;
  List<dynamic> jobType;
  DateTime postingDate;
  String jobDesc;
  String location;
  String posterID;
  String emailForApplying;
  DateTime applicationLastDate;
  String jobField;
  JobPost({
    required this.jobPostID,
    required this.jobTitle,
    required this.companyName,
    required this.qualifications,
    required this.salaryRangeStart,
    required this.salaryRangeEnd,
    required this.jobDesc,
    required this.jobType,
    required this.jobField,
    required this.posterID,
    required this.postingDate,
    required this.applicationLastDate,
    required this.location,
    required this.emailForApplying});

  factory JobPost.fromDocumentSnapshot(DocumentSnapshot doc) =>
      JobPost(
        jobPostID: doc['jobPostID'],
        jobTitle: doc['jobTitle'],
        companyName: doc["companyName"],
        qualifications: doc["qualifications"],
        salaryRangeStart: doc["salaryRangeStart"],
        salaryRangeEnd: doc["salaryRangeEnd"],
        jobDesc: doc["jobDesc"],
        jobType: doc["jobType"],
        jobField: doc["jobField"],
        posterID: doc["posterID"],
        postingDate: doc["postingDate"].toDate(),
        applicationLastDate: doc["applicationLastDate"].toDate(),
        location: doc["location"],
        emailForApplying: doc["emailForApplying"],
      );
}