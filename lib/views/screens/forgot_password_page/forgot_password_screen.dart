import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../core/controllers/forgot_password_controller.dart';
import '../../common/widgets/back_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _emailController;
  late Size size;
  final controller = Get.put(ForgotPasswordController());

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Obx(
        () => controller.isLoading.value
            ? Container(
                height: size.height,
                width: size.width,
                child: Center(
                    child: SpinKitCubeGrid(
                  color: AppColors.commonBtnColor,
                )))
            : forgotScreenBody(),
      ))),
    );
  }

  Widget forgotScreenBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 1, child: backButton()),
            _verticalSpace(size.height * 0.040),
            Flexible(flex: 4, child: appLogo()),
            _verticalSpace(size.height * 0.060),
            Flexible(flex: 1, child: infoText()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: enterEmail()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: confirmButton()),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Row(
      children: [
        AppBackBtn(
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  Widget appLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(r'assets/svgs/applogo.svg'),
      ],
    );
  }

  Widget infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            'Forgot Passsword ',
            style: textStyle(
                FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
          ),
        ),
        _verticalSpace(size.height * 0.010),
        Flexible(
          flex: 2,
          child: Text(
            textAlign: TextAlign.start,
            'Enter your registered email/Phone number below to receive security code ',
            style: textStyle(FontWeight.normal, const Color(0xFF8D99AE),
                size.height * 0.020),
          ),
        ),
      ],
    );
  }

  Widget enterEmail() {
    return AppTextFeild(
      hint: 'Enter Your Email',
      controller: _emailController,
    );
  }

  Widget confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            onTap: () {
              controller.sendOtpToEmail(_emailController.text.toString());
            },
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

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}
