import 'package:fits_right/core/controllers/login_page_controller.dart';
import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final loginController = Get.put(LoginController());
  final _loginformKey = GlobalKey<FormState>();
  final emailValidator =
      ValidationBuilder().email().minLength(9).maxLength(50).build();
  final passwordValidator =
      ValidationBuilder().minLength(5).maxLength(50).build();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: viewInsets > 0
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Obx(
              () => loginController.isLoading.value
                  ? Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                          child: SpinKitCubeGrid(
                        color: AppColors.commonBtnColor,
                      )))
                  : _loginScreenBody(),
            )),
      ),
    );
  }

  Widget _loginScreenBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: backButton()),
            Expanded(flex: 3, child: appLogo()),
            Flexible(flex: 2, child: greetingText()),
            Flexible(flex: 5, child: textFeilds()),
            _verticalSpace(size.height * 0.035),
            Flexible(flex: 2, child: loginButton()),
            _verticalSpace(size.height * 0.030),
            Flexible(child: orText()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 2, child: signInWith()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: dontHaveAccText()),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Row(
      children: [
        AppBackBtn(
          onTap: () => SystemNavigator.pop(),
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

  Widget greetingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi There! 👋',
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

  Widget textFeilds() {
    return Form(
      key: _loginformKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: AppTextFeild(
            hint: 'Email / Phone Number',
            controller: _emailController,
            validator: emailValidator,
          )),
          Flexible(
              child: AppTextFeild(
            hint: 'Password',
            controller: _passwordController,
            validator: passwordValidator,
          )),
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(ScreenNames.forogotScreen),
                child: Text(
                  'Forgot Password?',
                  style: textStyle(FontWeight.w600, const Color(0xFF000000),
                      size.height * 0.016),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget loginButton() {
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
                if (_loginformKey.currentState!.validate()) {
                  loginController.loginWithApi(
                      _emailController.text, _passwordController.text);
                } else {
                  Get.snackbar('Error', 'Check Entered Feilds');
                }
              },
              child: Text(
                'Sign In',
                style: textStyle(
                    FontWeight.w700, Colors.white, size.height * 0.020),
              )),
        ),
      ],
    );
  }

  Widget signInWith() {
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

  Widget dontHaveAccText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account?',
          style: textStyle(
              FontWeight.normal, const Color(0xFF6B7280), size.height * 0.016),
        ),
        const SizedBox(
          width: 1,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(ScreenNames.creatAccountScreen),
          child: Text(
            'Sign Up',
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

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget orText() {
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
}
