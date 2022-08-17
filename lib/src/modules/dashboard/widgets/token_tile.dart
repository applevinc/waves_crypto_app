import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class TokenTile extends StatelessWidget {
  const TokenTile({Key? key, this.width}) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.boxshadow,
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 60.h,
                width: 60.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: -3.h,
                right: -3.w,
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppColors.textDefault,
                    size: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Waves',
                style: AppText.bold400(context).copyWith(
                  fontSize: 11.sp,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '5.0054',
                style: AppText.bold600(context).copyWith(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
