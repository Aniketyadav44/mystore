import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/custom_button.dart';
import 'package:mystore/views/pages/auth/signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  UserServices userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomButton(
              onPressedFunc: () {
                userServices.logOut();
                Get.offAll(
                  () => const SigninScreen(),
                );
              },
              text: 'Log Out'),
        ],
      ),
    );
  }
}
