import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/constants/remote_constants.dart';
import 'package:mystore/controllers/user_controller.dart';
import 'package:mystore/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/utils/http_error_handle.dart';

class ProductServices {
  //search for products
  Future<List<Product>> searchProducts({required String query}) async {
    UserController userController = Get.find<UserController>();
    List<Product> products = [];
    try {
      Uri searchProductUri =
          Uri.parse("${RemoteConstants.uri}/api/products/search/$query");

      http.Response res = await http.get(
        searchProductUri,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": userController.user.value.token,
        },
      );

      handleHttpError(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products.add(
                Product.fromMap(
                  jsonDecode(res.body)[i],
                ),
              );
            }
          });
    } catch (e) {
      Get.snackbar(
        'Some Error Occured',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
      );
    }
    return products;
  }
}
