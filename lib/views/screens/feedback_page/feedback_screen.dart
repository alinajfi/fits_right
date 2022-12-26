import 'package:fits_right/core/controllers/feedback_controller.dart';
import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:fits_right/views/common/widgets/app_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  late Size size;
  final controller = Get.put(FeedBackController());
  late final feedBackTextController;

  @override
  void initState() {
    super.initState();
    feedBackTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    feedBackTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(child: SingleChildScrollView(child: _feedbackBody())),
    );
  }

  Widget _feedbackBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 8,
              child: Column(
                children: [
                  Flexible(child: _titleRow()),
                  _verticalSpace(size.height * 0.10),
                  Flexible(
                      child: Text(
                    'Please give us your feedback and the team will get back to you.',
                    style: textStyle(FontWeight.w400, const Color(0xff8D99AE),
                        size.height * 0.021),
                  )),
                  _verticalSpace(size.height * 0.10),
                  Flexible(
                    flex: 8,
                    child: textField(),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Flexible(child: _nextButton())],
                )),
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
          return AppMenuButton(
            onTap: () => Scaffold.of(context).openDrawer(),
          );
        }),
        SizedBox(
          width: size.width * 0.23,
        ),
        Flexible(
            child: Text(
          'Feedback',
          style: textStyle(
              FontWeight.w700, const Color(0xff8D99AE), size.height * 0.025),
        )),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Text(
                      'Send',
                      style: textStyle(
                          FontWeight.w700, Colors.white, size.height * 0.020),
                    ),
            ),
            onTap: () {
              controller.sendFeedback(
                  '', 'Message', feedBackTextController.text);
            },
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

  Widget textField() {
    return TextFormField(
      controller: feedBackTextController,
      maxLines: 40,
      decoration: InputDecoration(
          hintText: 'FeedBack',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffBDC6D1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffBDC6D1))),
          constraints: BoxConstraints(
            maxHeight: size.height,
            minHeight: size.height,
          )),
    );
  }
}
