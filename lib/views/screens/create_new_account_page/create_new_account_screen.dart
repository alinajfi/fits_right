import 'package:fits_right/core/controllers/sign_up_page_controller.dart';
import 'package:fits_right/core/models/sign_up.dart';
import 'package:fits_right/routes/screen_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../common/widgets/app_text_feild.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  late Size size;
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  final singUpController = Get.put(SignUpPageController());
  final _signUpFormKey = GlobalKey<FormState>();

  final emailValidator =
      ValidationBuilder().email().minLength(9).maxLength(50).build();
  final passwordValidator =
      ValidationBuilder().minLength(5).maxLength(50).build();
  final nameValidator = ValidationBuilder().minLength(3).maxLength(50).build();
  final phoneNumberValidator =
      ValidationBuilder().minLength(11).maxLength(11).build();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(() => singUpController.isLoading.value
            ? SizedBox(
                height: size.height,
                width: size.width,
                child: const Center(
                    child: SpinKitCubeGrid(
                  color: AppColors.commonBtnColor,
                )))
            : _createNewAccountBody()),
      )),
    );
  }

  Widget _createNewAccountBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: _backButton()),
            Flexible(flex: 1, child: _infoText()),
            Flexible(flex: 2, child: _profilePic()),
            Flexible(flex: 5, child: _textFeilds()),
            Flexible(flex: 1, child: _nextButton()),
            Flexible(flex: 1, child: _orText()),
            Flexible(flex: 1, child: _signInWith()),
            Flexible(flex: 1, child: _dontHaveAccText()),
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
          'Create New Account',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          'Welcome back, Sign in to your account',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.020),
        ),
      ],
    );
  }

  Widget _profilePic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          height: size.height * 0.15,
          width: size.width - size.width / 2,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),

              //   borderRadius: BorderRadius.circular(20),
              shape: BoxShape.circle),
          child: SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.09,
              child: SvgPicture.asset(
                r'assets/svgs/personicon.svg',
                fit: BoxFit.fill,
              )),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Form(
      key: _signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: AppTextFeild(
            hint: 'Full Name',
            controller: nameController,
            validator: nameValidator,
          )),
          _verticalSpace(size.height * 0.015),
          Flexible(
              child: AppTextFeild(
            hint: 'Email',
            controller: emailController,
            validator: emailValidator,
          )),
          _verticalSpace(size.height * 0.015),
          Flexible(
              child: AppTextFeild(
            hint: 'Phone Number',
            controller: phoneNumberController,
            validator: phoneNumberValidator,
          )),
          _verticalSpace(size.height * 0.015),
          Flexible(
            child: Obx(() {
              return AppTextFeild(
                maxLines: 1,
                obesecure: singUpController.obesecureText.value,
                hint: 'Password',
                controller: passwordController,
                validator: passwordValidator,
                suffix: GestureDetector(
                    onTap: () {
                      if (singUpController.obesecureText.value == false) {
                        singUpController.obesecureText.value = true;
                      } else {
                        singUpController.obesecureText.value = false;
                      }
                    },
                    child: singUpController.obesecureText.value
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          )),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Row(
      children: [
        Flexible(
          child: MyButton(
              onTap: () {
                if (_signUpFormKey.currentState!.validate()) {
                  singUpController.singUpWithApi(SignUpModel(
                      fullName: nameController.text.toString(),
                      userEmail: emailController.text.toString(),
                      userPassword: passwordController.text.toString(),
                      userPhone: phoneNumberController.text.toString()));

                  // print(nameController.text);
                  // print(emailController.text);
                  // print(passwordController.text);
                  // print(phoneNumberController.text);
                } else {
                  Get.snackbar('Error', 'Check Entered Feilds');
                }
              },
              radius: 15,
              color: AppColors.commonBtnColor,
              height: size.height * 0.07,
              width: size.width,
              child: Text(
                'Next',
                style: textStyle(
                    FontWeight.w700, Colors.white, size.height * 0.020),
              )),
        ),
      ],
    );
  }

  Widget _orText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
            child: Divider(
          thickness: 1,
        )),
        const SizedBox(
          width: 4,
        ),
        Flexible(
            child: Text(
          'OR',
          style: textStyle(
              FontWeight.w400, const Color(0xFF6B7280), size.height * 0.011),
        )),
        const SizedBox(
          width: 4,
        ),
        const Flexible(
            child: Divider(
          thickness: 1,
        )),
      ],
    );
  }

  Widget _signInWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: SvgPicture.asset(r'assets/svgs/fbsvg.svg')),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: SvgPicture.asset(r'assets/svgs/googlesvg.svg')),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: SvgPicture.asset(r'assets/svgs/applesvg.svg')),
      ],
    );
  }

  Widget _dontHaveAccText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: textStyle(
              FontWeight.normal, const Color(0xFF6B7280), size.height * 0.016),
        ),
        const SizedBox(
          width: 1,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(ScreenNames.loginScreen),
          child: Text(
            'Sign In',
            style: textStyle(
                FontWeight.bold, AppColors.commonBtnColor, size.height * 0.016),
          ),
        ),
      ],
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
