import 'package:flutter/material.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/custom_app_bar.dart';
import 'package:job_den/views/common_widgets/generic_button.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';

import '../../commons/controller.dart';
import '../../controllers/auth_controller.dart';
import '../../models/job_post.dart';
import '../common_widgets/logout_button.dart';

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
      body: _buildContent(),
      bottomNavigationBar: AppNavigationBar(index: 0,),
      appBar: CustomAppBar(label: "Job Details",)
    );
  }

  Widget _buildContent() {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            controller: new ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10,),
                Text(jobPost.jobTitle, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
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
                const SizedBox(height: 20,),
                // Size
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Expanded(flex: 2, child: Text("Posted By: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.posterID, style: const TextStyle(fontSize: 20, color: ColorPalette.black),),),
                    // Use getUserEmailbyID in the above code ^
                  ],
                ),

                Center(
                  child: authController.user?.uid == jobPost.posterID ?
                  GenericButton(label: 'Delete', color: ColorPalette.red,padding: 40, onPressed: ()
                    {
                      //Delete JobPost
                    },) :
                  GenericButton(label: 'Apply', onPressed: ()
                  {
                    //Apply to Job
                  },
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}