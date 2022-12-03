import 'dart:async';

import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/common/dialouges/measurement_screen_dialouge.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class MeasurementDetail extends StatefulWidget {
  const MeasurementDetail({super.key});

  @override
  State<MeasurementDetail> createState() => _MeasurementDetailState();
}

class _MeasurementDetailState extends State<MeasurementDetail>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: _measurementDetailbody()),
    );
  }

  Widget _measurementDetailbody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: _titleBar()),
            Flexible(flex: 1, child: _measurementDetailTabs()),
            Flexible(flex: 9, child: _measurementDetailTabView()),
            Flexible(flex: 1, child: _nextButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Get.back(),
          );
        }),
        SizedBox(
          width: size.width * 0.195,
        ),
        Flexible(
            child: Text(
          'Measurement',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _measurementDetailTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.043,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: TabBar(
              indicator: RectangularIndicator(
                  bottomLeftRadius: 20,
                  bottomRightRadius: 20,
                  topLeftRadius: 20,
                  topRightRadius: 20,
                  horizontalPadding: 2,
                  verticalPadding: 2,
                  color: AppColors.commonBtnColor),
              controller: _tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.all(0.8),
                  child: Text(
                    'Inches',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.015),
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.height * 0.015),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _measurementDetailTabView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: 10,
          left: 200,
          top: 70,
          child: UnconstrainedBox(
              child: SizedBox(
            height: size.height * 0.5,
            width: size.width * 0.4,
            child: Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: TabBarView(controller: _tabController, children: [
                SizedBox(
                    child: ListView.separated(
                  itemCount: 8,
                  itemBuilder: (context, index) => SizedBox(
                    child: SizedBox(
                      height: size.height * 0.030,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child:
                                  Image.asset(r'assets/pngs/appediticon.png')),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Waist',
                              style: GoogleFonts.inter(
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.commonBtnColor),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              '''5'8''',
                              style: textStyle(FontWeight.w500, Colors.black,
                                  size.height * 0.015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.black, thickness: 1),
                )),
                const Text(''),
              ]),
            ),
          )),
        ),
        Positioned(
            left: 20,
            top: 60,
            child: UnconstrainedBox(
              child: SizedBox(
                height: size.height * 0.51,
                width: size.width * 0.4,
                child: Image.asset(
                  r'assets/pngs/bust.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => MeasurementScreenDialog(),
              );
              Timer(
                Duration(seconds: 4),
                () => Get.offAndToNamed(ScreenNames.shoppingScreen),
              );
            },
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Save and next',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
