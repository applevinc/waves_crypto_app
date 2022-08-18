import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/bottosheets/start_leasing_bottomsheet.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/buttons/app_button.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_divider.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_linear_progress_indicator.dart';

class AvailableBalanCard extends StatelessWidget {
  const AvailableBalanCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.boxshadow,
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: AppPadding.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Balance',
            style: AppText.bold500(context).copyWith(
              color: AppColors.grey,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '105.0054',
            style: AppText.bold600(context).copyWith(
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 8.h),
          const CustomLinearProgressIndicator(),
          SizedBox(height: 8.h),
          tile(
            context,
            value: '1 435.000355601',
            trailingLabel: 'Leased',
            dotColor: AppColors.primary,
          ),
          const CustomDivider(),
          tile(
            context,
            value: '1 540.000355601',
            trailingLabel: 'Total',
            dotColor: AppColors.grey,
          ),
          const CustomDivider(),
          SizedBox(height: 24.h),
          AppButton(
            label: 'Start Lease',
            labelColor: AppColors.primary,
            backgroundColor: AppColors.primary.withOpacity(.15),
            onTap: () {
              startLeasingBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  Widget tile(
    BuildContext context, {
    required String value,
    required String trailingLabel,
    required Color dotColor,
  }) {
    final textStyle = AppText.bold500(context).copyWith(
      fontSize: 12.sp,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Text(
            value,
            style: textStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Text(
            trailingLabel,
            style: textStyle.copyWith(
              color: AppColors.grey,
            ),
          ),
          SizedBox(width: 4.w),
          Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
