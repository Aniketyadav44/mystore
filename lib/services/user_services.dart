import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/constants/remote_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/utils/http_error_handle.dart';
import 'package:mystore/views/auth/signin_screen.dart';
import 'package:mystore/views/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //signup the user
  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    UserController userController = Get.find<UserController>();

    userController.setIsLoading(true);
    try {
      Uri signinUserUri = Uri.parse("${RemoteConstants.uri}/api/signup");

      http.Response res = await http.post(
        signinUserUri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "name": name,
          },
        ),
      );

      handleHttpError(
          response: res,
          onSuccess: () {
            Get.off(() => const SigninScreen());
          });
    } catch (e) {
      Get.snackbar(
        'Some Error Occured',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
      );
    }
    userController.setIsLoading(false);
  }

  //signin the user
  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    UserController userController = Get.find<UserController>();

    userController.setIsLoading(true);
    try {
      Uri signinUserUri = Uri.parse("${RemoteConstants.uri}/api/signin");

      http.Response res = await http.post(
        signinUserUri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );

      handleHttpError(
          response: res,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();

            userController.setUser(res.body);

            await pref.setString('auth-token', jsonDecode(res.body)['token']);

            Get.offAll(() => const HomePage());
          });
    } catch (e) {
      Get.snackbar(
        'Some Error Occured',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
      );
    }
    userController.setIsLoading(false);
  }

  //get user details
  Future<void> getUser() async {
    UserController userController = Get.find<UserController>();

    userController.setIsLoading(true);
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String? token = pref.getString('auth-token');

      if (token == null) {
        throw ("User not logged in!");
      }

      Uri getUserUri = Uri.parse("${RemoteConstants.uri}/");

      http.Response res = await http.get(
        getUserUri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token,
        },
      );

      handleHttpError(
          response: res,
          onSuccess: () {
            userController.setUser(res.body);
          });
    } catch (e) {
      print("This is error ${e.toString()}");
      // Get.snackbar(
      //   'Some Error Occured',
      //   e.toString(),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.orange,
      // );
    }
    userController.setIsLoading(false);
  }

  //logout user
  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString('auth-token', '');

    Get.offAll(() => const SigninScreen());
  }
}
