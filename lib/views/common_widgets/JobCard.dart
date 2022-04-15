import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/models/job_post.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';
import 'package:job_den/views/job_details/job_details_screen.dart';


class JobCard extends StatefulWidget {
  final JobPost jobPost;
  JobCard({Key? key, required this.jobPost}) : super(key: key);


  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailsScreen(jobPost: widget.jobPost,));
      },
  child: Container(
    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2),
    // margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),

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

            // const SizedBox(height: 5,),
            Row(
              children: [
                Expanded(flex: 18, child: Text(widget.jobPost.jobTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: ColorPalette.blue),)),
                Expanded(flex: 1, child: Container()),
                Expanded(flex: 2, child: GestureDetector(onTap: (){ setState(() {
                  if (isStarred == false )
                    {
                    isStarred = true;
                    //Add to starred
                    }
                  else if (isStarred = true)
                    {
                      isStarred = false;
                      //remove from starred
                    }
                });}, child: isStarred == true ? const Icon(Icons.star, color: Colors.blueAccent,) : const Icon(Icons.star_border_outlined, color: Colors.blueAccent,))),
              ],
            ),
            const SizedBox(height: 5,),
            // Text(widget.jobPost.companyName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: ColorPalette.blue),),
            Row(
              children: [
                const Text("Company: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(widget.jobPost.companyName.toString()),
              ],
            ),
            const SizedBox(height: 5,),
            // Text(widget.jobType[0] + ", " + widget.jobType[1]),
            Row(
              children: [
                const Text("Job Type: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue),),
                JobFieldListView(jobType: widget.jobPost.jobType),
              ],
            ),
            // Row(
            const SizedBox(height: 5,),

            Row(
              children: [
                const Text("Salary Range: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(widget.jobPost.salaryRangeStart.toString()  + "BDT - " + widget.jobPost.salaryRangeEnd.toString() + "BDT"),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Text("Posted: ", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.blue)),
                Text(widget.jobPost.postingDate.toString()),
              ],
            ),

            const SizedBox(height: 5,),
                // ),
            // )
          ],
    ),
      ),

  ),
    );
  }
}
