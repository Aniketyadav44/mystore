import 'package:get/get.dart';
import 'package:mystore/models/user.dart';

class UserController extends GetxController {
  final user = User(
          id: '',
          name: '',
          email: '',
          password: '',
          address: '',
          type: '',
          cart: [],
          token: '')
      .obs;

  final isLoading = true.obs;

  void setIsLoading(bool isLoadingData) {
    isLoading(isLoadingData);
  }

  void setUser(String userData) {
    user.value = User.fromJson(userData);
  }
}
