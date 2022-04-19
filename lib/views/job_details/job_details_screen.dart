import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/custom_app_bar.dart';
import 'package:job_den/views/common_widgets/generic_button.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';
import 'package:open_mail_app/open_mail_app.dart';
import '../../commons/controller.dart';
import '../../models/job_post.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobPost jobPost;
  final isUser = true;

  const JobDetailsScreen({Key? key,
  required this.jobPost,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(context),
      bottomNavigationBar: AppNavigationBar(index: 0,),
      appBar: CustomAppBar(label: "Job Details",)
    );
  }

  Widget _buildContent(BuildContext context) {
    var isStarred = starredController.checkIfStarred(authController.user?.uid, jobPost).obs;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right:15.0),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(flex: 12,child: Text(jobPost.jobTitle, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)),
                    Expanded(flex: 1, child: Container(),),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(child:
                       Obx ( () => Icon( starredController.checkIfStarred(authController.user?.uid, jobPost).obs == true ? Icons.star : Icons.star_border_outlined, color: ColorPalette.blue,size: 32,),),
                        onTap: ()
                        {
                        if (starredController.checkIfStarred(authController.user?.uid, jobPost).obs == false )
                        {
                        isStarred = true.obs;
                        userController.addToStarred(authController.user?.uid, jobPost.jobPostID);
                        }
                        else
                        {
                        isStarred = false.obs;
                        userController.removeFromStarred(authController.user?.uid, jobPost.jobPostID);
                        }
                        }),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const Text("Job Description:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),
                const SizedBox(height: 10,),
                Text(jobPost.jobDesc, style: const TextStyle(fontSize: 16, color: ColorPalette.black),),
                const SizedBox(height: 20,),
                const Text("Qualifications:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: jobPost.qualifications.map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2, bottom: 4),
                        child: Text(
                            "> " + e,
                            style: const TextStyle(
                              fontSize: 16,
                              color: ColorPalette.secondaryColorDark,
                            ),
                          ),
                      );
                    }).toList()),
                const SizedBox(height: 15,),

                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Company: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.companyName, style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Location: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.location, style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Job Type: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: JobFieldListView(jobType: jobPost.jobType,)),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Field: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.jobField, style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Salary: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(
                      jobPost.salaryRangeEnd == jobPost.salaryRangeStart ? jobPost.salaryRangeStart.toString() + " BDT" : jobPost.salaryRangeStart.toString() + " - " + jobPost.salaryRangeEnd.toString() + " BDT" ,
                      style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                // Size
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Posted On: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(DateFormat('dd-MM-yyyy').format(jobPost.postingDate), style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),

                Center(
                  child: authController.user?.uid == jobPost.posterID ?
                  GenericButton(label: 'Delete', color: ColorPalette.red,padding: 40, onPressed: ()
                    {
                      jobPostController.deleteJobPost(jobPost.jobPostID);
                    },) :
                  GenericButton(label: 'Apply',
                      onPressed: () async {
                        EmailContent email = EmailContent(
                          to: [
                            jobPost.emailForApplying,
                          ],
                          subject: 'Applying for the Job Opening.',
                          body: 'Attach your CV as well as a formal cover letter.',
                        );

                        OpenMailAppResult result =
                        await OpenMailApp.composeNewEmailInMailApp(
                            nativePickerTitle: 'Select email app',
                            emailContent: email);
                        if (!result.didOpen && !result.canOpen) {
                          showNoMailAppsDialog(context);
                        } else if (!result.didOpen && result.canOpen) {
                          showDialog(
                            context: context,
                            builder: (_) => MailAppPickerDialog(
                              mailApps: result.options,
                              emailContent: email,
                            ),
                          );
                        }
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    }, context: context,
  );
}