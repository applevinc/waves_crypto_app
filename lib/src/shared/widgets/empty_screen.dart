import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          size: 45.sp,
          color: AppColors.textDefault,
        ),
        SizedBox(height: 10.h),
        Text(
          'Nothing to see here.',
          textAlign: TextAlign.center,
          style: AppText.bold600(context).copyWith(
            fontSize: 15.sp,
          ),
        ),
        Text(
          'Enjoy the moment.',
          textAlign: TextAlign.center,
          style: AppText.bold400(context).copyWith(
            fontSize: 12.sp,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
