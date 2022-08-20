import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color ?? AppColors.textDefault,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppText.bold600(context).copyWith(
                color: color ?? AppColors.textDefault,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
