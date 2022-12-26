import 'dart:convert';

import 'package:fits_right/core/models/sign_up.dart';
import 'package:fits_right/core/services/api_services/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<http.Response> signUpWithApi(SignUpModel model) async {
    print('api Sign Up body');
    late http.Response signUpResponse;

    try {
      signUpResponse = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointSignUp),
        body: jsonEncode(model.toMap()),
      );
    } catch (e) {
      print(e.toString());
      print('gfgfhgfhgfgffjf');
    }
    return signUpResponse;
  }

  Future<http.Response> loginWithApi(
      {required String email, required String password}) async {
    late http.Response loginResponse;
    //  print("Body of login API ");

    try {
      loginResponse = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointLogin),
        body: jsonEncode({
          "user_email": email,
          "user_password": password,
          "onesignal_id": "",
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return loginResponse;
  }

  Future<http.Response> sendOtpToEmail({required String email}) async {
    late http.Response sendOtpToEmailResponse;
    // print("Body of SendOtpToEmailApi");
    // print(email);

    try {
      sendOtpToEmailResponse = await http.post(
          Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointSendOtp),
          body: jsonEncode({"user_email": email}));
    } catch (e) {
      debugPrint(e.toString());
    }
    return sendOtpToEmailResponse;
  }

  Future<http.Response> verifyOtp(
      {required String id, required String otp}) async {
    late http.Response response;
    try {
      response = await http.post(
          Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointVerifyOtp),
          body: jsonEncode({"users_customers_id": id, "otp": otp}));
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }

  Future<http.Response> sendFeedback(
      {required String userId,
      required String title,
      required String body}) async {
    late http.Response response;
    print(userId);
    print(title);
    print(body);
    try {
      response = await http.put(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.endPointSendFeedback),
        body: jsonEncode({
          "users_customers_id": userId,
          "subject": title,
          "message": body,
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }
}
