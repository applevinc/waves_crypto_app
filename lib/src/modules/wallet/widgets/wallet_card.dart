import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
    required this.label,
    this.labelColor,
    required this.icon,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  final String label;
  final Color? labelColor;
  final Widget icon;
  final Color? backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: AppColors.boxshadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              label,
              style: AppText.bold500(context).copyWith(
                fontSize: 10.sp,
                color: labelColor ?? AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
