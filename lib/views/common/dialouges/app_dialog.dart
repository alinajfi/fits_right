// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.description,
    this.onTap,
  }) : super(key: key);
  final String description;
  final void Function()? onTap;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(flex: 1, child: SizedBox()),
                Flexible(
                    flex: 3,
                    child: Text(
                      textAlign: TextAlign.center,
                      description,
                      style: GoogleFonts.inter(
                          color: Color(0xFF8D99AE),
                          fontWeight: FontWeight.w400,
                          fontSize: size.height * 0.024),
                    )),
                Flexible(
                    flex: 1,
                    child: MyButton(
                      child: Text('OK',
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: size.height * 0.022)),
                      color: AppColors.commonBtnColor,
                      height: size.height * 0.1,
                      width: size.width * 0.9,
                      radius: 15,
                      onTap: onTap,
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
