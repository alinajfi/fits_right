import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MeasurementScreenDialog extends StatelessWidget {
  const MeasurementScreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: Text(
                  'Please wait...',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.026),
                )),
                Flexible(child: SvgPicture.asset(r'assets/svgs/applogo.svg')),
                Flexible(
                    child: Text(
                  textAlign: TextAlign.center,
                  'Find the best brands, fit for your\nsize.',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height * 0.018),
                )),
                Flexible(child: SpinKitThreeBounce(
                  itemBuilder: (context, index) {
                    Color? color;

                    if (index == 1) {
                      color = AppColors.commonBtnColor;
                    } else {
                      color = Colors.grey;
                    }
                    return Container(
                      height: 3,
                      width: 3,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                    );
                  },
                )),
              ],
            )),
      ),
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
