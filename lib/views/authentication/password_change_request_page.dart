
import 'package:flutter/material.dart';
import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/authentication/widgets/positioned_logo.dart';
import 'package:job_den/views/authentication/widgets/pressable_texts.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';

import '../../commons/controller.dart';
import '../common_widgets/color_palette.dart';

class PasswordChangeRequestPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PositionedLogo(),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: ColorPalette.secondaryColorDark,
                ),
              ),
            ),

            // SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Enter your mail and we will send you a link to reset your password",
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.secondaryColorDark,
                ),
              ),
            ),

            SizedBox(height: 20),

            CustomTextField(controller: emailController, hintText:  "Email"),


            SizedBox(height: 40),

            SubmitButton(text: 'Send Request', onPressed: () {
              authController.resetPassword(emailController.text);
            },),

            SizedBox(height: 5),

            PressableText(
                onPressed: () {
                  // Get.back();
                },
                unhighlightedText: "< ",
                highlightedText: "Back to Login"),


            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
