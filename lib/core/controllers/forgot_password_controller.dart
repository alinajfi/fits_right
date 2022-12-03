import 'dart:convert';

import 'package:fits_right/routes/screen_names.dart';
import 'package:get/get.dart';

import '../services/api_services/services.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  ApiServices _apiServices = ApiServices();
  var isLoading = false.obs;
  late http.Response response;
  String userId = '';

  void sendOtpToEmail(String email) async {
    print(email);
    isLoading.value = true;
    response = await _apiServices.sendOtpToEmail(email: email);

    if (response.statusCode == 200) {
      Get.toNamed(ScreenNames.otpScreen);
      var data = jsonDecode(response.body);

      try {
        userId = data["data"]["users_customers_id"];
      } catch (e) {
        isLoading.value = false;
      }
      isLoading.value = false;
      print(userId);
    } else {
      isLoading.value = false;
      // var data = jsonDecode(response.body.toString());
      Get.snackbar('Error', "",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
    }
  }
}
