import 'package:flutter/material.dart';
import 'package:job_den/color_palette.dart';
import 'package:job_den/generic_button.dart';

class JobDetailsScreen extends StatelessWidget {
  final String jobTitle;
  final String jobDesc;
  final List qualifications; //Not in SDD
  final String companyName;
  final String location;
  final List jobType;
  final String jobField;
  final int salaryRangeStart;
  final int salaryRangeEnd;

  JobDetailsScreen({Key? key,
  required this.jobTitle,
  required this.jobDesc,
  required this.qualifications, //Not in SDD
  required this.companyName,
  required this.location,
  required this.jobType,
  required this.jobField,
  required this.salaryRangeStart,
  required this.salaryRangeEnd,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            controller: new ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10,),
                Container(child: Text("Software Engineer", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),),
                SizedBox(height: 20,),
                Container(child: Text("Job Description:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),),
                SizedBox(height: 10,),
                Container(child: Text(jobDesc, style: TextStyle(fontSize: 16, color: ColorPalette.black),),),
                SizedBox(height: 20,),
                Container(child: Text("Qualifications:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),),),
                SizedBox(height: 10,),
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: qualifications.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 4),
                            child: Text(
                                "> " + e,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorPalette.secondaryColorDark,
                                ),
                              ),
                          );
                        }).toList())),
                SizedBox(height: 15,),

                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Company: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(companyName, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Location: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(location, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Job Type: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Row(
                        children: jobType.map((e) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                            margin: EdgeInsets.only(right: 5),
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 13,
                                color: ColorPalette.secondaryColorDark,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                          );
                        }).toList())),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Field: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(jobField, style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 2, child: Text("Salary: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue),)),
                    Expanded(flex: 5, child: Text(
                      salaryRangeEnd == salaryRangeStart ? salaryRangeStart.toString() + " BDT" : salaryRangeStart.toString() + " - " + salaryRangeEnd.toString() + " BDT" ,
                      style: TextStyle(fontSize: 20, color: ColorPalette.black),),),
                  ],
                ),
                SizedBox(height: 20,),
                // SizedBox(height: 10,),
                Center(
                  child: GenericButton(label: "Apply", onPressed:
                  () {
                    // Apply to Job
                  }),
                )
              ],
            ),
          ),
        ),
    );
  }
}