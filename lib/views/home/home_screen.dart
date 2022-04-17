import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/custom_app_bar.dart';
import 'package:job_den/views/common_widgets/JobCard.dart';

import '../../models/job_post.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: _buildContent(),
      bottomNavigationBar: AppNavigationBar(index: 0),
      appBar: CustomAppBar(label: "JobDen",logoInstead: true,),

    );
  }


  Widget _buildContent() {
    return SafeArea(
      child: Obx( () {
        return ListView.builder(
          shrinkWrap: true,
            itemCount: jobPostController.jobPostList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: JobCard(
                  jobPost: jobPostController.jobPostList[index],),
              );
                // JobPostCard(title: "Job Title",id: "11",onPressed: (){},
              // );
            },);
      }
      ),
          );
  }
}