import 'package:flutter/material.dart';

import 'package:job_den/views/authentication/widgets/custom_text_field.dart';
import 'package:job_den/views/authentication/widgets/positioned_logo.dart';
import 'package:job_den/views/authentication/widgets/pressable_texts.dart';
import 'package:job_den/views/authentication/widgets/submit_button.dart';
import 'package:job_den/views/common_widgets/color_palette.dart';

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
            SizedBox(height: 20),
            PositionedLogo(),
            SizedBox(height: 10),
            CustomTextField(controller: emailController, hintText: "Email"),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                isPassword: true),
            PressableText(
              alignment: Alignment.bottomRight,
              onPressed: () {
                // Get.to(() => PasswordChangeRequestPage());
              },
              highlightedText: "Forgot Password?",
            ),
            SizedBox(height: 40),
            SubmitButton(
              text: "Login",
              onPressed: () {
                // authController.login(
                //     emailController.text, passwordController.text);
              },
            ),
            PressableText(
              onPressed: () {
                // Get.to(() => SignUpPage());
              },
              highlightedText: "Register Now",
              unhighlightedText: "Don't have an account? ",
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
