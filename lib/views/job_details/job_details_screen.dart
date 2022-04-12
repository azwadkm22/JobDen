import 'package:flutter/material.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/generic_button.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';

import '../../models/job_post.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobPost jobPost;

  const JobDetailsScreen({Key? key,
  required this.jobPost,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(),
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
                SizedBox(height: 10,),
                Container(child: Text("Software Engineer", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),),
                SizedBox(height: 20,),
                Container(child: Text("Job Description:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),),
                SizedBox(height: 10,),
                Container(child: Text(jobPost.jobDesc, style: TextStyle(fontSize: 16, color: ColorPalette.black),),),
                SizedBox(height: 20,),
                Container(child: Text("Qualifications:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),),
                SizedBox(height: 10,),
                Container(
                    child: Column(
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
                        }).toList())),
                SizedBox(height: 15,),

                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Company: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.companyName, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Location: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.location, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Job Type: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: JobFieldListView(jobType: jobPost.jobType,)),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Field: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobPost.jobField, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Salary: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(
                      jobPost.salaryRangeEnd == jobPost.salaryRangeStart ? jobPost.salaryRangeStart.toString() + " BDT" : jobPost.salaryRangeStart.toString() + " - " + jobPost.salaryRangeEnd.toString() + " BDT" ,
                      style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                // SizedBox(height: 10,),
                Center(
                  child: GenericButton(label: "Apply", onPressed:
                  () {
                    // Apply to Job
                  }),
                )
              ],
            ),
          ),
        ),
    );
  }
}