import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:fits_right/views/common/widgets/app_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late Size size;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      drawer: const AppDrawer(),
      body: _homePageBody(),
    );
  }

  Widget _homePageBody() {
    return SizedBox(
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          _backGrounImage(),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: UnconstrainedBox(
              child: Container(
                height: size.height * 0.9,
                width: size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.black,
                    ])),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.height * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: _backButton()),
                const Expanded(flex: 7, child: SizedBox()),
                Flexible(child: _infoText()),
                Flexible(child: _nextButton()),
                Flexible(child: _skipText()),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _backGrounImage() {
    return Image.asset(
      r'assets/pngs/home_page_bg.jpg',
      fit: BoxFit.cover,
    );
  }

  Widget _backButton() {
    return Row(
      children: [
        Builder(builder: (context) {
          return AppMenuButton(
            onTap: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ],
    );
  }

  Widget _infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi,',
          style: textStyle(FontWeight.w700, Colors.white, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'Wade Warren',
          style: textStyle(FontWeight.w700, Colors.white, size.height * 0.024),
        ),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.measurementScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Start Measuring',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }

  Widget _skipText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Skip now and go to Shopping',
          style: textStyle(
              FontWeight.w400, const Color(0xFF8D99AE), size.height * 0.016),
        ),
        const SizedBox(
          width: 5,
        ),
        Image.asset(r'assets/pngs/arrowforword.png')
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}
