import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Colors.blue;
  static const textDefault = Color(0xff061725);
  static Color grey = textDefault.withOpacity(.3);
  static const backgroundColor = Color(0xffF8FDFF);
  static const error = Color(0xffEF1313);
  static final border = AppColors.primary.withOpacity(.6);

  static final boxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 2,
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
  ];
  static const gradient = LinearGradient(
    colors: [
      Color(0xff1C71B7),
      Color(0xff09263D),
    ],
  );
}