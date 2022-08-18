import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.backgroundColor,
    this.isLoading = false,
    this.child,
    this.elevation = 0,
    this.icon,
    this.border,
    this.padding,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color? labelColor;
  final Color? backgroundColor;
  final bool isLoading;
  final Widget? child;
  final double elevation;
  final IconData? icon;
  final BorderSide? border;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor ?? AppColors.primary,
          elevation: elevation,
          padding: padding ?? EdgeInsets.symmetric(vertical: 13.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
            side: border ?? BorderSide.none,
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 50.w,
                width: 50.w,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: labelColor,
                        size: 15.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        label,
                        style: AppText.bold600(context).copyWith(
                          color: labelColor ?? Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  )
                : Text(
                    label,
                    style: AppText.bold600(context).copyWith(
                      color: labelColor ?? Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
      ),
    );
  }
}

class BorderAppButton extends StatelessWidget {
  const BorderAppButton({
    Key? key,
    required this.label,
    required this.labelColor,
    this.borderColor,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Color labelColor;
  final Color? borderColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: label,
      labelColor: labelColor,
      backgroundColor: Colors.transparent,
      elevation: 0,
      border: BorderSide(color: borderColor ?? AppColors.border),
      onTap: onTap,
    );
  }
}
