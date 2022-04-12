import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/home/widgets/JobCard.dart';

import '../../models/job_post.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: _buildContent(),
      bottomNavigationBar: AppNavigationBar(index: 0),
    );
  }

  final List<JobPost> jobPostList = jobPostController.jobPostList;

  Widget _buildContent() {
    return SafeArea(
      child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx( () {
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: jobPostList.length,
                    itemBuilder: (context, index) {
                      return JobCard(
                        jobPost: jobPostList[index],);
                        // JobPostCard(title: "Job Title",id: "11",onPressed: (){},
                      // );
                    },);
              }
              ),
            ),
          );
  }
}