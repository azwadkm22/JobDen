import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_den/views/authentication/password_change_request_page.dart';
import 'package:job_den/views/authentication/sign_up_page.dart';

import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/authentication/widgets/positioned_logo.dart';
import 'package:job_den/views/authentication/widgets/pressable_texts.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

import '../../commons/controller.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            const SizedBox(height: 10),
            CustomTextField(controller: emailController, hintText: "Email"),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                isPassword: true),
            PressableText(
              alignment: Alignment.bottomRight,
              onPressed: () {
                Get.to(() => PasswordChangeRequestPage());
              },
              highlightedText: "Forgot Password?",
            ),
            const SizedBox(height: 40),
            SubmitButton(
              text: "Login",
              onPressed: () {
                authController.login(
                     emailController.text, passwordController.text);
              },
            ),
            PressableText(
              onPressed: () {
                Get.to(() => SignUpPage());
              },
              highlightedText: "Register Now",
              unhighlightedText: "Don't have an account? ",
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
