import 'package:flutter/material.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

import '../../commons/bold_text.dart';
import '../authentication/widgets/submit_button.dart';

class AddJobPostScreen extends StatefulWidget {
  const AddJobPostScreen({Key? key}) : super(key: key);

  @override
  _AddJobPostState createState() => _AddJobPostState();
}

class _AddJobPostState extends State<AddJobPostScreen> {
  bool isInternship = true;
  bool isPartTime = false;
  bool isRemote = true;
  bool isFullTime = true;
  String location = "Dhaka";
  RangeValues salaryRange = RangeValues(10000, 20000);
  List<String> districts = ['Dhaka', 'Sylhet', 'Rajshahi', 'Chattagram', 'Khulna', 'Barishal', 'Rangpur'];
  TextEditingController fieldController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController applyByDateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white12,
        body: _buildContent(),
        bottomNavigationBar: AppNavigationBar(index: 1),
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "New Job Opening",
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorPalette.black,
          // fontFamily: FontResource.secondaryFont
        ),
      ),
      backgroundColor: ColorPalette.backgroundColor,
      // bottom: PreferredSize(
      //     child: Container(
      //       color: ColorPalette.blue,
      //       height: 4.0,
      //     ),
      //     preferredSize: Size.fromHeight(4.0)),
    ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      // padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: BoldText("Job Title")),
                Expanded(flex: 3,child: CustomTextField(controller: jobTitleController, hintText: "e.g. Computer Science",),),
              ],
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: BoldText("Description")),
                Expanded(flex: 3,child: CustomTextField(controller: descController, hintText: "e.g. Computer Science",),),
              ],
            ),

            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: BoldText("Company")),
                Expanded(flex: 3,child: CustomTextField(controller: companyController, hintText: "e.g. Computer Science",),),
              ],
            ),
            SizedBox(height: 8),
            BoldText("Salary Range"),
            RangeSlider(
              values: salaryRange,
              max: 50000,
              divisions: 50,
              labels: RangeLabels(
                salaryRange.start.round().toString(),
                salaryRange.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  salaryRange = values;
                });
              },
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(flex:5, child: BoldText("Job Type")),
                    Expanded(flex:4, child: Text("Internship")),
                    Expanded(flex:6, child: Checkbox(value: isInternship, onChanged: (bool? b) {
                      setState(() {
                        isInternship = b!;
                      });
                    })),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex:5, child: Container()),
                    Expanded(flex:4, child: Text("Full time")),
                    Expanded(flex:6, child: Checkbox(value: isFullTime, onChanged: (bool? b) {
                      setState(() {
                        isFullTime = b!;
                      });
                    })),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex:5, child: Container()),
                    Expanded(flex:4, child: Text("Part time")),
                    Expanded(flex:6, child: Checkbox(value: isPartTime, onChanged: (bool? b) {
                      setState(() {
                        isPartTime = b!;
                      });
                    })),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex:5, child: Container()),
                    Expanded(flex:4, child: Text("Remote")),
                    Expanded(flex:6, child: Checkbox(value: isRemote, onChanged: (bool? b) {
                      setState(() {
                        isRemote = b!;
                      });
                    })),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8),
            Row(
              children: [
                Expanded(flex:5, child: BoldText("Location")),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: DropdownButton(
                      items: districts
                          .map((String item) =>
                          DropdownMenuItem<String>(child: Text(item), value: item))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          this.location = value!;
                        });
                      },
                      value: location,
                    ),
                  ),
                ),
                Expanded(flex:5, child: Container()),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: BoldText("Field")),
                Expanded(flex: 3,child: CustomTextField(controller: fieldController, hintText: "e.g. Computer Science",),),
              ],
            ),


            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: BoldText("Apply By")),
                Expanded(flex: 3,child: CustomTextField(controller: applyByDateController, hintText: "e.g. Computer Science",),),
              ],
            ),
            SizedBox(height: 18),

            SubmitButton(text: "Post", onPressed: () {
              //Post Job
            },),
          ],
        ),
      ),
    );
  }
}