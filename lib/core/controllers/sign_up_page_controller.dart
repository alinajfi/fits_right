import 'dart:convert';

import 'package:fits_right/core/models/sign_up.dart';
import 'package:fits_right/core/services/api_services/services.dart';
import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpPageController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  var isLoading = false.obs;
  late http.Response response;
  var obesecureText = false.obs;

  void singUpWithApi(SignUpModel model) async {
    // print('Sign up with api Controller body');
    isLoading.value = true;
    response = await _apiServices.signUpWithApi(model);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.offAndToNamed(ScreenNames.homeScreen);
    } else {
      isLoading.value = false;
      var data = jsonDecode(response.body);
      Get.snackbar('Error', data["message"],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: AppColors.commonBtnColor.withOpacity(0.5));
    }
  }

  void isObsecure(bool obesecure) {
    obesecureText.value = obesecure;
  }
}
