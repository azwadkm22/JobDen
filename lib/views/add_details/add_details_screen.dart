import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_den/commons/controller.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';
import 'package:job_den/views/common_widgets/specific_type_field.dart';
import 'package:job_den/views/placeholder_screen.dart';
import '../authentication/widgets/custom_text_field.dart';


class AddDetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Personal Information",
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorPalette.black,
              // fontFamily: FontResource.secondaryFont
          ),
        ),
        backgroundColor: ColorPalette.backgroundColor,
        bottom: PreferredSize(
            child: Container(
              color: ColorPalette.blue,
              height: 4.0,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      )
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomTextField(controller: fNameController, hintText: "First Name"),
            const SizedBox(height: 5),
            CustomTextField(controller: lNameController, hintText: "Last Name"),
            const SizedBox(height: 5),
            CustomTextField(controller: dobController, hintText: "Date of Birth"),
            const SizedBox(height: 5),
            CustomTextField(controller: fieldController, hintText: "Field of Study"),
            const SizedBox(height: 5),
            CustomTextField(controller: instController, hintText: "Institution"),
            const SizedBox(height: 5),
            SpecificTypeField(controller: gradYearController, hintText: "Graduation Year", keyboardType: TextInputType.number, maxLength: 4,),
            const SizedBox(height: 5),
            CustomTextField(controller: addressController, hintText: "Address"),
            const SizedBox(height: 5),
            SpecificTypeField(controller: phoneController, hintText: "Phone No", keyboardType: TextInputType.number, maxLength: 11,),
            const SizedBox(height: 10),
            SubmitButton(
              text: "Create Profile",
              onPressed: () {
                userController.setUserInfo(authController.user?.uid, authController.user?.email , lNameController.text , fNameController.text, dobController.text, fieldController.text, instController.text, int.parse(gradYearController.text) , addressController.text, phoneController.text, []);
                Get.to(() => const PlaceHolderScreen());
                },
            ),

          ],
        ),
      ),
    );
  }
}
