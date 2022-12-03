import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class TakeMeasurement extends StatefulWidget {
  const TakeMeasurement({super.key});

  @override
  State<TakeMeasurement> createState() => _TakeMeasurementState();
}

class _TakeMeasurementState extends State<TakeMeasurement>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;
  double _value = 0.0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //print('build is Called');
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: _takeMeasurementBody()),
    );
  }

  Widget _takeMeasurementBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 2, child: _titleBar()),
            Flexible(flex: 1, child: _tabBar()),
            Flexible(flex: 9, child: _tabBarView()),
            Flexible(flex: 1, child: _measurementSlider()),
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

  Widget _tabBar() {
    return SizedBox(
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey
            // color: const Color(0xFFEDF2F4),
            ),
        width: size.width,
        height: size.height * 0.043,
        child: TabBar(
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            controller: _tabController,
            isScrollable: true,
            enableFeedback: true,
            indicator: RectangularIndicator(
                color: AppColors.commonBtnColor,
                bottomLeftRadius: 20,
                bottomRightRadius: 20,
                topRightRadius: 20,
                topLeftRadius: 20),
            tabs: const [
              MeasureTabBar(tabName: 'Waist'),
              MeasureTabBar(tabName: 'Hips'),
              MeasureTabBar(tabName: 'Bust'),
              MeasureTabBar(tabName: 'Low hips'),
              MeasureTabBar(tabName: 'High hips'),
              MeasureTabBar(tabName: 'Collar'),
              MeasureTabBar(tabName: 'Inside leg length'),
              MeasureTabBar(tabName: 'Sleeve length'),
              MeasureTabBar(tabName: 'Height'),
            ]),
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(controller: _tabController, children: const [
      MeasureTabBarView(
          bodyPart: 'Waist', bodyPartModel: (r'assets/pngs/waist.png')),
      MeasureTabBarView(
          bodyPart: 'hips', bodyPartModel: (r'assets/pngs/hip.png')),
      MeasureTabBarView(
          bodyPart: 'bust', bodyPartModel: (r'assets/pngs/bust.png')),
      MeasureTabBarView(
          bodyPart: 'lower hips', bodyPartModel: (r'assets/pngs/lowhip.png')),
      MeasureTabBarView(
          bodyPart: 'high hips', bodyPartModel: (r'assets/pngs/highhip.png')),
      MeasureTabBarView(
          bodyPart: 'collar', bodyPartModel: (r'assets/pngs/collar.png')),
      MeasureTabBarView(
          bodyPart: 'inside leg lenght',
          bodyPartModel: (r'assets/pngs/insideleglength.png')),
      MeasureTabBarView(
          bodyPart: 'sleeve length',
          bodyPartModel: (r'assets/pngs/slevelength.png')),
      MeasureTabBarView(
          bodyPart: 'height', bodyPartModel: (r'assets/pngs/height.png'))
    ]);
  }

  Widget _measurementSlider() {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.transparent,
      child: SfSlider(
        inactiveColor: Colors.transparent,
        activeColor: Colors.transparent,
        thumbIcon: const VerticalDivider(
          thickness: 1,
          color: Colors.black,
        ),
        min: 1,
        max: 20,
        interval: 1,
        // stepSize: 2,
        enableTooltip: true,
        minorTicksPerInterval: 3,
        showTicks: true,
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.measurementDetailScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Next',
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
