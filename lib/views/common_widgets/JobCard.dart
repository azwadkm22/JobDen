import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_den/models/job_post.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';
import 'package:job_den/views/job_details/job_details_screen.dart';


class JobCard extends StatelessWidget {
  final JobPost jobPost;
  JobCard({Key? key, required this.jobPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailsScreen(jobPost: jobPost,));
      },
  child: Container(
    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2),

    decoration: const BoxDecoration(
      color: Color(0xFFC4C4C4),
      borderRadius: BorderRadius.all(Radius.circular(5))
    ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            Row(
              children: [
                Expanded(flex: 18, child: Text(jobPost.jobTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: ColorPalette.blue),)),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            const SizedBox(height: 5,),
            // Text(widget.jobPost.companyName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: ColorPalette.blue),),
            Row(
              children: [
                const Text("Company: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(jobPost.companyName.toString()),
              ],
            ),
            const SizedBox(height: 5,),
            // Text(widget.jobType[0] + ", " + widget.jobType[1]),
            Row(
              children: [
                const Text("Job Type: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue),),
                JobFieldListView(jobType: jobPost.jobType),
              ],
            ),
            // Row(
            const SizedBox(height: 5,),

            Row(
              children: [
                const Text("Salary Range: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(jobPost.salaryRangeStart.toString()  + "BDT - " + jobPost.salaryRangeEnd.toString() + "BDT"),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Text("Posted: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(DateFormat('dd-MM-yyyy').format(jobPost.postingDate)),
              ],
            ),

            const SizedBox(height: 5,),
          ],
    ),
      ),

  ),
    );
  }
}
