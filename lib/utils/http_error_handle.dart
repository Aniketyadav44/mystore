import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void handleHttpError({
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      Get.snackbar("Some Problem Occurred", jsonDecode(response.body)['msg'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      break;
    case 401:
      Get.snackbar("User not logged In!", "Log In to continue",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      break;
    case 500:
      Get.snackbar("Internal Server Error", jsonDecode(response.body)['error'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.orange);
      break;
    default:
      Get.snackbar("Some Problem", jsonDecode(response.body));
  }
}
