import 'package:flutter/material.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/home/widgets/JobCard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return JobCard(
                      jobTitle: "Software Engineer",
                      jobType: ["Remote", "Internship"],
                      postedDate: "10/10/2022",
                      companyName: "Beximco",
                      salaryRangeStart: 10,
                      salaryRangeEnd: 100,);
                      // JobPostCard(title: "Job Title",id: "11",onPressed: (){},
                    // );
                  },),
            ),
          ));
  }
}