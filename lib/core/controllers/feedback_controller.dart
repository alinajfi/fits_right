import 'dart:convert';

import 'package:fits_right/core/services/api_services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FeedBackController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  var isLoading = false.obs;
  void sendFeedback(String userId, String title, String body) async {
    isLoading.value = true;
    http.Response response = await _apiServices.sendFeedback(
        userId: userId, title: title, body: body);

    if (response.statusCode == 200) {
      isLoading.value = false;
      Get.snackbar('Success', 'FeedBack Submitted Successfully');
    } else {
      isLoading.value = false;
      var data = jsonDecode(response.body);
      Get.snackbar('Error', data["message"]);
    }
  }
}
