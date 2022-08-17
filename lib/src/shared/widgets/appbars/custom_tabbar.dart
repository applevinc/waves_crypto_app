import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.padding,
  }) : super(key: key);

  final List<Widget> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: TabBar(
        labelColor: AppColors.textDefault,
        isScrollable: isScrollable,
        physics: const BouncingScrollPhysics(),
        padding: padding ??
            EdgeInsets.only(
              right: AppPadding.horizontal,
              left: AppPadding.horizontal,
            ),
        unselectedLabelColor: AppColors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.only(right: 20.w),
        indicatorPadding: EdgeInsets.only(right: 45.w),
        labelStyle: AppText.bold600(context).copyWith(
          fontSize: 12.sp,
        ),
        indicatorWeight: 2.h,
        tabs: tabs,
      ),
    );
  }
}
