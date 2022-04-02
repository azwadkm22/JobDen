class JobPost {
  String jobPostID;
  String jobTitle;
  String companyName;
  List<String> qualifications;
  int salaryRangeStart;
  int salaryRangeEnd;
  List<String> jobType;
  DateTime postingDate;
  String jobDesc;
  String location;
  String posterID;
  String emailForApplying;
  DateTime applicationLastDate;
  String jobField;
  JobPost({
    required this.jobTitle,
    required this.jobPostID,
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
}