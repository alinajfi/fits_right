// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MeasureTabBar extends StatelessWidget {

  //
  const MeasureTabBar({
    Key? key,
    required this.tabName,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String tabName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        tabName,
        style: TextStyle(fontSize: size.height * 0.014, color: textColor),
      ),
    );
  }
}
