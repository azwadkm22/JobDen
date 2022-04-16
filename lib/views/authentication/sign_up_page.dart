import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:job_den/views/authentication/widgets/positioned_logo.dart';
import 'package:job_den/views/authentication/widgets/pressable_texts.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

import '../../commons/controller.dart';
import 'widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
            const SizedBox(height: 20),

            PositionedLogo(),

            CustomTextField(controller: emailController, hintText: "Email"),

            CustomTextField(controller: passwordController, hintText: "Password", isPassword: true),

            CustomTextField(controller: confirmPasswordController, hintText: "Confirm Password", isPassword: true),

            const SizedBox(height: 40),

            SubmitButton(
              text: "Register",
              onPressed: () {
                authController.createUser(
                  emailController.text, passwordController.text);
              },
            ),

            PressableText(
                onPressed: () {
                  Get.back();
                },
                unhighlightedText: "Already have an account? ",
                highlightedText: "Sign in."
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
