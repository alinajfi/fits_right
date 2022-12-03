import 'dart:convert';

import 'package:get/get.dart';

import '../../routes/screen_names.dart';
import '../../utils/app_colors.dart';
import '../services/api_services/services.dart';
import 'package:http/http.dart' as http;

class VerifyOtpController extends GetxController {
  ApiServices _apiServices = ApiServices();
  var isLoading = false.obs;
  late http.Response response;

  void verifyOtp(String id, String otp) async {
    print('Sign up with api Controller body');
    isLoading.value = true;
    response = await _apiServices.verifyOtp(id: id, otp: otp);
    print(response.statusCode);

    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.offAndToNamed(ScreenNames.changePasswordScreen);
    } else {
      isLoading.value = false;
      var data = jsonDecode(response.body);
      Get.snackbar('Error', data["message"],
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.commonBtnColor.withOpacity(0.5));
    }
  }
}
