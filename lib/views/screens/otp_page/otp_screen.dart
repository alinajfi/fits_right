import 'package:fits_right/core/controllers/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/controllers/forgot_password_controller.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Size size;
  final userIdController = Get.put(ForgotPasswordController());
  final controller = Get.put(VerifyOtpController());
  String otp = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _otpScreenBody())),
    );
  }

  Widget _otpScreenBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: _backButton()),
            _verticalSpace(size.height * 0.040),
            Flexible(child: _infoText()),
            Flexible(child: _countDown()),
            Flexible(child: _otpTextFeild()),
            _verticalSpace(size.height * 0.080),
            Flexible(child: confirmButton()),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return Row(
      children: [
        AppBackBtn(
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  Widget _infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify it’s you ',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'We send a code to ( *****@mail.com ).Enter it here to verify your identity ',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.020),
        ),
      ],
    );
  }

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _countDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CountdownTimer(endTime: DateTime.now().day + 2),
            _verticalSpace(size.height * 0.010),
            Text(
              'Send again',
              style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                  size.height * 0.016),
            ),
          ],
        ),
      ],
    );
  }

  Widget _otpTextFeild() {
    return OtpTextField(
      onSubmit: (value) => {
        otp = value,
      },
      // onCodeChanged: (value) => otp = value,
      disabledBorderColor: const Color(0xffBDC6D1),
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(18),
      fieldWidth: 55,
      borderWidth: 0.9,
      focusedBorderColor: AppColors.commonBtnColor,
      keyboardType: TextInputType.number,
    );
  }

  Widget confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () {
              if (otp.length < 4) {
                Get.snackbar('Enter Otp', 'Otp Is Empty',
                    duration: Duration(seconds: 3));
              } else {
                print(userIdController.userId);
                controller.verifyOtp(userIdController.userId, otp);
              }
            },
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Confirm',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }
}



// Widget _countDown() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Column(
//         children: [
//           Text(
//             '03:00',
//             style: textStyle(
//                 FontWeight.w700, const Color(0xFF8D99AE), size.height * 0.040),
//           ),
//           _verticalSpace(size.height * 0.010),
//           Text(
//             'Send again',
//             style: textStyle(
//                 FontWeight.w600, AppColors.commonBtnColor, size.height * 0.016),
//           ),
//         ],
//       ),
//     ],
//   );
// }
