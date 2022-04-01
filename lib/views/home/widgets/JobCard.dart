import 'package:flutter/material.dart';
import 'package:job_den/views/common_widgets/job_field_list_view.dart';

import '../../home/widgets/view_details_button.dart';


class JobCard extends StatefulWidget {
  final String jobTitle;
  final String companyName;
  final List jobType;// = ["Remote", "Internship"];
  final int salaryRangeStart;// = 10;
  final int salaryRangeEnd;// = 100;
  final String postedDate;// = "10/11/21";
  JobCard({Key? key, required this.jobTitle, required this.companyName, required this.jobType, required this.salaryRangeStart, required this.salaryRangeEnd, required this.postedDate }) : super(key: key);


  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  String jobTitle = "Job Title";
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Take to JobViewPage
      },
  child: Container(
    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2),
    margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),

    decoration: const BoxDecoration(
      color: Color(0xFFC4C4C4),
      borderRadius: BorderRadius.all(Radius.circular(5))
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(flex: 18, child: Text(widget.jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
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
              });}, child: isStarred == true ? Icon(Icons.star, color: Colors.blueAccent,) : Icon(Icons.star_border_outlined, color: Colors.blueAccent,))),
            ],
          ),
          SizedBox(height: 5,),
          Text(widget.companyName),
          SizedBox(height: 5,),
          // Text(widget.jobType[0] + ", " + widget.jobType[1]),
          JobFieldListView(jobType: widget.jobType),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Salary Range: " + widget.salaryRangeStart.toString()  + "TK - " + widget.salaryRangeEnd.toString() + "TK"),
                    SizedBox(height: 4,),
                    Text("Posted: " + widget.postedDate),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(flex: 2, child: ViewDetailsButton(onPressed: (){},)),
            ],
          )
        ],
    ),

  ),
    );
  }
}
