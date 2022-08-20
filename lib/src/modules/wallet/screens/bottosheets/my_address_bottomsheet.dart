import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/action_button.dart';
import 'package:waves_crypto_app/src/shared/assets/images.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_bottomsheet.dart';

Future<dynamic> myAddressBottomSheet(BuildContext context) {
  return showCustomBottomSheet(
    context: context,
    body: const _Body(),
  );
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetBody(
      backgroundColor: AppColors.blue,
      content: [
        Dragger(color: Colors.white.withOpacity(.5)),
        SizedBox(height: 60.h),
        Icon(
          Icons.waving_hand_outlined,
          color: Colors.white,
          size: 40.sp,
        ),
        SizedBox(height: 40.h),
        Text(
          'Hello!',
          style: AppText.bold600(context).copyWith(
            fontSize: 32.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
          style: AppText.bold500(context).copyWith(
            fontSize: 15.sp,
            color: Colors.white.withOpacity(.7),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: 200.w,
          child: Row(
            children: [
              ActionButton(
                icon: Icons.copy,
                color: Colors.white.withOpacity(.5),
                backgroundColor: Colors.black.withOpacity(.5),
                label: 'Copy',
                onTap: () {},
              ),
              SizedBox(width: 20.w),
              ActionButton(
                icon: Icons.ios_share,
                label: 'Share',
                color: Colors.white.withOpacity(.5),
                backgroundColor: Colors.black.withOpacity(.5),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 30.h,
            horizontal: 30.w,
          ),
          child: Image.asset(
            AppImages.qrcode,
            height: 230.h,
            width: 230.h,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Your QR Code',
          style: AppText.bold500(context).copyWith(
            fontSize: 15.sp,
            color: Colors.white.withOpacity(.7),
          ),
        ),
        SizedBox(height: 60.h),
      ],
    );
  }
}
