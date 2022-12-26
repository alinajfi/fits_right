// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fits_right/utils/app_colors.dart';

class AppTextFeild extends StatelessWidget {
  const AppTextFeild({
    Key? key,
    required this.hint,
    this.controller,
    this.suffix,
    this.validator,
    this.maxLines,
    this.obesecure = false,
  }) : super(key: key);
  final String hint;
  final TextEditingController? controller;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool obesecure;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      validator: validator,
      cursorColor: AppColors.commonBtnColor,
      controller: controller,
      obscureText: obesecure,
      maxLines: maxLines,
      decoration: InputDecoration(
          constraints:
              BoxConstraints(maxWidth: size.width, minWidth: size.width),
          //  suffix: suffix,
          suffixIcon: suffix,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  width: 0.9,
                  style: BorderStyle.solid,
                  color: Color(0xffBDC6D1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  width: 0.9,
                  style: BorderStyle.solid,
                  color: AppColors.commonBtnColor)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                width: 0.9, style: BorderStyle.solid, color: Color(0xffBDC6D1)),
          )),
    );
  }
}
