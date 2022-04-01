import 'package:flutter/material.dart';
import 'package:job_den/color_palette.dart';
import 'package:job_den/views/JobCard.dart';
import 'package:job_den/views/JobPostCard.dart';

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
                    return JobCard();
                      // JobPostCard(title: "Job Title",id: "11",onPressed: (){},
                    // );
                  },),
            ),
          ));
  }
}