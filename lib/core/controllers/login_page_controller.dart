import 'dart:convert';

import 'package:fits_right/routes/screen_names.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/api_services/services.dart';

class LoginController extends GetxController {
  ApiServices _apiServices = ApiServices();
  var isLoading = false.obs;
  late http.Response response;

  void loginWithApi(String email, String password) async {
    isLoading.value = true;
    print('login api controller body');
    response =
        await _apiServices.loginWithApi(email: email, password: password);
    print(response.statusCode);

    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.offAndToNamed(ScreenNames.homeScreen);
    } else {
      isLoading.value = false;
      var data = jsonDecode(response.body);
      Get.snackbar('Error', data["message"],
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
    }
  }
}
