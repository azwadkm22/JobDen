import 'package:flutter/material.dart';
import 'package:job_den/commons/bold_text.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/commons/navigation_bar.dart';
import 'package:job_den/views/search/widgets/search_bar.dart';

import '../authentication/widgets/custom_text_field.dart';
import '../authentication/widgets/submit_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isInternship = true;
  bool isPartTime = false;
  bool isRemote = true;
  bool isFullTime = true;
  String location = "Dhaka";
  RangeValues salaryRange = RangeValues(10000, 20000);
  List<String> districts = ['Dhaka', 'Sylhet', 'Rajshahi', 'Chattagram', 'Khulna', 'Barishal', 'Rangpur'];
  TextEditingController fieldController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white12,
        body: _buildContent(),
        bottomNavigationBar: AppNavigationBar(index: 2)
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
            SearchBar(),
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
                  Expanded(flex:3, child: BoldText("Job Type")),
                  Expanded(flex:3, child: Text("Internship")),
                  Expanded(flex:6, child: Checkbox(value: isInternship, onChanged: (bool? b) {
                    setState(() {
                      isInternship = b!;
                    });
                  })),
                ],
              ),
              Row(
                children: [
                  Expanded(flex:3, child: Container()),
                  Expanded(flex:3, child: Text("Full time")),
                  Expanded(flex:6, child: Checkbox(value: isFullTime, onChanged: (bool? b) {
                    setState(() {
                      isFullTime = b!;
                    });
                  })),
                ],
              ),
              Row(
                children: [
                  Expanded(flex:3, child: Container()),
                  Expanded(flex:3, child: Text("Part time")),
                  Expanded(flex:6, child: Checkbox(value: isPartTime, onChanged: (bool? b) {
                    setState(() {
                      isPartTime = b!;
                    });
                  })),
                ],
              ),
              Row(
                children: [
                  Expanded(flex:3, child: Container()),
                  Expanded(flex:3, child: Text("Remote")),
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
                Expanded(flex:2, child: BoldText("Location")),
                Expanded(
                  flex: 3,
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
                Expanded(flex:3, child: Container()),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: BoldText("Field")),
                Expanded(flex: 10,child: CustomTextField(controller: fieldController, hintText: "e.g. Computer Science",),),
              ],
            ),
            SizedBox(height: 18),

            SubmitButton(text: "Search", onPressed: () {
              searchController.searchJobs(isInternship, isPartTime, isRemote, isFullTime, location, salaryRange.start.round(), salaryRange.end.round(), fieldController.text);
            },),
          ],
        ),
      ),
    );
  }
}
