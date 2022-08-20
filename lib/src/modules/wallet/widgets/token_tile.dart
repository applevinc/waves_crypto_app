import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/wallet/models/token.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class TokenTile extends StatelessWidget {
  const TokenTile(this.token, {Key? key, this.width}) : super(key: key);

  final Token token;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppText.bold400(context).copyWith(
      fontSize: 13.sp,
      color: AppColors.grey,
    );

    return Container(
      width: width ?? 335.w,
      margin: EdgeInsets.only(bottom: 8.h),
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
          Image.asset(
            token.icon,
            height: 60.h,
            width: 60.h,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              token.isMyToken
                  ? RichText(
                      text: TextSpan(
                        text: token.name,
                        style: titleStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: ' / My Token',
                            style: titleStyle.copyWith(
                              color: AppColors.blue.withOpacity(.5),
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  : token.name == 'Waves'
                      ? Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: token.name,
                                style: titleStyle,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.favorite,
                              size: 13.sp,
                              color: AppColors.blue,
                            )
                          ],
                        )
                      : RichText(
                          text: TextSpan(
                            text: token.name,
                            style: titleStyle,
                          ),
                        ),
              SizedBox(height: 4.h),
              Text(
                token.value.toString(),
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
