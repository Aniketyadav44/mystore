import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/views/pages/auth/signin_screen.dart';

import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/custom_button.dart';
import 'package:mystore/utils/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final signupFormKey = GlobalKey<FormState>();
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
                "Create New Account",
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
                key: signupFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                  if (signupFormKey.currentState!.validate()) {
                    await UserServices().signUpUser(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                text: 'Sign Up',
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
                      Get.off(() => const SigninScreen());
                    },
                    child: const Text(
                      "Sign In",
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
