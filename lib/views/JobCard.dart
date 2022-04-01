import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_den/views/view_details_button.dart';

class JobCard extends StatefulWidget {
  const JobCard({Key? key}) : super(key: key);
  final String jobTitle = "Job Title";

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  String jobTitle = "Job Title";
  String companyName = "ABCompany";
  String jobType = "Remote";
  int salaryRangeStart = 10;
  int salaryRangeEnd = 100;
  String date = "10/11/21";
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Take to JobViewPage
      },
  child: Expanded(child: Container(
    padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2),
    margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
    decoration: const BoxDecoration(
      color: Color(0xFFC4C4C4),
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(flex: 18, child: Text(jobTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
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
          SizedBox(height: 4,),
          Text(companyName),
          SizedBox(height: 4,),
          Text(jobType),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Salary Range: $salaryRangeStart - $salaryRangeEnd"),
                    SizedBox(height: 4,),
                    Text("Posted: $date"),
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
    ));
  }
}
