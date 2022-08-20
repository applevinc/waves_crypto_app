import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const blue = Colors.blue;
  static const textDefault = Color(0xff061725);
  static Color grey = textDefault.withOpacity(.3);
  static const backgroundColor = Color(0xffF8FDFF);
  static const error = Color(0xffEF1313);
  static final border = AppColors.blue.withOpacity(.6);

  static final boxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 0,
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
  static const gradient = LinearGradient(
    colors: [
      Color(0xff1C71B7),
      Color(0xff09263D),
    ],
  );
}
