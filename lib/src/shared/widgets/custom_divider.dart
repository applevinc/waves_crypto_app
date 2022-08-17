import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.isVertical = false,
    this.height,
    this.color,
  }) : super(key: key);

  final bool isVertical;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: isVertical ? height : 1.h,
      width: isVertical ? 1.w : size.width,
      color: color ?? AppColors.grey,
    );
  }
}
