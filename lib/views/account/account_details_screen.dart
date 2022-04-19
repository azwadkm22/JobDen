import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/models/user_account.dart';
import 'package:job_den/views/account/EditButton.dart';
import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';
import 'package:job_den/views/common_widgets/info_to_specific_field_switcher.dart';

import '../../commons/navigation_bar.dart';
import '../common_widgets/color_palette.dart';
import '../common_widgets/custom_app_bar.dart';
import '../common_widgets/generic_button.dart';
import 'info_to_field_switcher.dart';

class AccountDetailsScreen extends StatefulWidget {
  late UserAccount currentUser;
  bool isEditable = false;
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  // Date add korte hobe
  final TextEditingController fieldController = TextEditingController();
  final TextEditingController instController = TextEditingController();
  final TextEditingController gradYearController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    userController.getUserAccount(authController.user?.uid);
    return Scaffold(
        backgroundColor: ColorPalette.backgroundColor,
        body: _buildContent(),
        bottomNavigationBar: AppNavigationBar(index: 4,),
        appBar: CustomAppBar(label: "Personal Details",)
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(flex: 4,
                        child: Text("Email: ",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight
                              .w600, color: ColorPalette.blue),)),
                    Expanded(flex: 8,
                        child: Text(userController.user!.value.email,
                          style: const TextStyle(
                              fontSize: 18, color: ColorPalette.black),)),
                  ],
                ),
                const SizedBox(height: 25,),
                InfoToFieldSwitcher(info: userController.user!.value.firstName,
                  isEditable: widget.isEditable,
                  controller: widget.fNameController,
                  label: "First Name",),
                const SizedBox(height: 15,),
                InfoToFieldSwitcher(info: userController.user!.value.lastName,
                  isEditable: widget.isEditable,
                  controller: widget.lNameController,
                  label: "Last Name",),
                const SizedBox(height: 15,),
                InfoToFieldSwitcher(info: userController.user!.value.dateOfBirth,
                  isEditable: widget.isEditable,
                  controller: widget.dobController,
                  label: "Date of Birth",),
                const SizedBox(height: 15,),
                InfoToFieldSwitcher(info: userController.user!.value.fieldOfStudy,
                  isEditable: widget.isEditable,
                  controller: widget.fieldController,
                  label: "Field of Study",),
                const SizedBox(height: 15,),
                InfoToFieldSwitcher(info: userController.user!.value.institution,
                  isEditable: widget.isEditable,
                  controller: widget.instController,
                  label: "Institution",),
                const SizedBox(height: 15,),
                InfoToSpecificFieldSwitcher(info: userController.user!.value.graduationYear,
                  isEditable: widget.isEditable,
                  controller: widget.gradYearController,
                  label: "Graduated",
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                ),
                const SizedBox(height: 15,),
                InfoToFieldSwitcher(info: userController.user!.value.address,
                  isEditable: widget.isEditable,
                  controller: widget.addressController,
                  label: "Address",),
                const SizedBox(height: 15,),
                InfoToSpecificFieldSwitcher(info: userController.user!.value.phoneNumber,
                  isEditable: widget.isEditable,
                  controller: widget.phoneController,
                  label: "Phone No.",
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                ),
                const SizedBox(height: 15,),
                widget.isEditable ?
                SubmitButton(onPressed: () async {
                  print(widget.lNameController.text);
                  await userController.setUserInfo(
                      authController.user?.uid,
                      authController.user?.email,
                      widget.lNameController.text,
                      widget.fNameController.text,
                      widget.dobController.text,
                      widget.fieldController.text,
                      widget.instController.text,
                      int.parse(widget.gradYearController.text),
                      widget.addressController.text,
                      widget.phoneController.text,
                      []);
                  setState(() {
                    widget.lNameController.text = widget.lNameController.text;
                    widget.fNameController.text = widget.fNameController.text;
                    widget.dobController.text = widget.dobController.text;
                    widget.fieldController.text = widget.fieldController.text;
                    widget.instController.text = widget.instController.text;
                    widget.gradYearController.text = widget.gradYearController.text;
                    widget.addressController.text = widget.addressController.text;
                    widget.phoneController.text = widget.phoneController.text;
                    widget.isEditable = false;
                  });
                }, text: "Save Edit")
                    :
                EditButton(onPressed: () {
                  setState(() {
                    widget.lNameController.text = widget.currentUser.lastName;
                    widget.fNameController.text = widget.currentUser.firstName;
                    widget.dobController.text = widget.currentUser.dateOfBirth;
                    widget.fieldController.text = widget.currentUser.fieldOfStudy;
                    widget.instController.text = widget.currentUser.institution;
                    widget.gradYearController.text = widget.currentUser.graduationYear.toString();
                    widget.addressController.text = widget.currentUser.address;
                    widget.phoneController.text = widget.currentUser.phoneNumber;
                    // Do Stuff
                    widget.isEditable = true;
                  });
                })

              ],
            ),
          ),
        ),
      );

  }
}
