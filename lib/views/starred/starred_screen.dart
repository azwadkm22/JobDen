import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/custom_app_bar.dart';
import 'package:job_den/views/common_widgets/JobCard.dart';

import '../../models/job_post.dart';

class StarredScreen extends StatelessWidget {
  StarredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    starredController.getStarredList(authController.user?.uid);
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(),
      bottomNavigationBar: AppNavigationBar(index: 3),
      appBar: CustomAppBar(label: "Starred Jobs",)
    );
  }
  Widget _buildContent() {
    return SafeArea(
      child: Obx( () {
        if(starredController.isLoading.value) return Center(child: const CircularProgressIndicator(),);
        return ListView.builder(
          shrinkWrap: true,
          itemCount: starredController.starredJobList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: JobCard(
                jobPost: starredController.starredJobList[index],),
            );
            // JobPostCard(title: "Job Title",id: "11",onPressed: (){},
            // );
          },);
      }
      ),
    );
  }
}