import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body:
          SafeArea(child: SingleChildScrollView(child: _changePasswordBody())),
    );
  }

  Widget _changePasswordBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          children: [
            Flexible(child: _titleRow()),
            _verticalSpace(size.height * 0.15),
            Flexible(child: _description()),
            _verticalSpace(size.height * 0.08),
            const Flexible(
                child: AppTextFeild(
              hint: 'Old Password',
              suffix: Icon(Icons.remove_red_eye_sharp),
            )),
            _verticalSpace(size.height * 0.03),
            const Flexible(
                child: AppTextFeild(
              hint: '*********',
              suffix: Icon(Icons.remove_red_eye_sharp),
            )),
            _verticalSpace(size.height * 0.03),
            const Flexible(
                child: AppTextFeild(
              hint: 'Confirm Password',
              suffix: Icon(Icons.remove_red_eye_sharp),
            )),
            _verticalSpace(size.height * 0.04),
            Flexible(child: _updateButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Get.back(),
          );
        }),
        SizedBox(
          width: size.width * 0.17,
        ),
        Flexible(
            child: Text(
          'Change Password',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _description() {
    return Text(
      'Please, enter a new password below different from the previous password.',
      style: textStyle(
          FontWeight.w400, const Color(0xff8D99AE), size.height * 0.020),
    );
  }

  Widget _updateButton() {
    return MyButton(
      onTap: () => Get.toNamed(ScreenNames.addMemberScreen),
      radius: 15,
      color: AppColors.commonBtnColor,
      height: size.height * 0.07,
      width: size.width,
      child: Text(
        'Update password',
        style: textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
      ),
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
