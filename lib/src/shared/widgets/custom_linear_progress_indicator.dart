import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    Key? key,
    this.height,
    this.valueColor,
    this.backgroundColor,
  }) : super(key: key);

  final double? height;
  final Color? valueColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: LinearProgressIndicator(
        value: 0.8,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor ?? AppColors.blue),
        backgroundColor: backgroundColor ?? AppColors.blue.withOpacity(.1),
        minHeight: height ?? 8.h,
      ),
    );
  }
}
