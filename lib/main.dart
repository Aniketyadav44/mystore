import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/views/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: ColorConstants.secondaryColor,
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
