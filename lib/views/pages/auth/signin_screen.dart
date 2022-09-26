import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/custom_button.dart';
import 'package:mystore/utils/custom_textfield.dart';
import 'package:mystore/views/pages/auth/signup_screen.dart';

import 'package:mystore/constants/color_constants.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final signinFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "MyStore",
                style: TextStyle(
                  fontSize: 40,
                  color: ColorConstants.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Log In to your Account",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstants.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: signinFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressedFunc: () async {
                  if (signinFormKey.currentState!.validate()) {
                    await UserServices().signInUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                text: 'Sign In',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New user?   ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => const SignupScreen());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
