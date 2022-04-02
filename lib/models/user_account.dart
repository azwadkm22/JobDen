import 'job_post.dart';

class UserAccount {
  String email;
  String lastName;
  String firstName;
  DateTime dateOfBirth;
  String fieldOfStudy;
  String institution;
  int graduationYear;
  String address;
  String phoneNumber;
  List<JobPost> starredJobPost;

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
    required this.starredJobPost,
});
}