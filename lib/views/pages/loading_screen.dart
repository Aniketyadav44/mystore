import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/services/user_services.dart';
import 'package:mystore/utils/loader.dart';

import 'auth/signin_screen.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  UserController userController = Get.find<UserController>();
  UserServices userServices = UserServices();

  @override
  void initState() {
    userServices.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return !userController.isLoading.value
          ? userController.user.value.token.isEmpty
              ? const SigninScreen()
              : const HomeScreen()
          : Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "MyStore",
                        style: TextStyle(
                          fontSize: 40,
                          color: ColorConstants.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Loader(),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
