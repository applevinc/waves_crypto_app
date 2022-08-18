import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/navbar_button.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_bottomsheet.dart';

Future<dynamic> transactionBottomSheet(BuildContext context) {
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
      content: [
        const Dragger(),
        SizedBox(height: 16.h),
        _OptionTile(
          color: Colors.orange.withOpacity(.5),
          title: 'Send',
          icon: Icons.arrow_circle_up,
        ),
        SizedBox(height: 16.h),
        _OptionTile(
          color: Colors.green.withOpacity(.5),
          title: 'Receive',
          icon: Icons.arrow_circle_down,
        ),
        SizedBox(height: 16.h),
        _OptionTile(
          color: Colors.purple.withOpacity(.5),
          title: 'Exchange',
          icon: Icons.swap_horizontal_circle_outlined,
        ),
        SizedBox(height: 16.h),
        _OptionTile(
          color: Colors.blue.withOpacity(.5),
          title: 'QR Scan',
          subtitle: 'Invoices, addresses',
          icon: Icons.qr_code_scanner,
        ),
        SizedBox(height: 40.h),
        NavBarButton(
          icon: Icons.close,
          iconColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String? subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: color.withOpacity(.07),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 25.sp,
            ),
          ),
          SizedBox(width: 16.w),
          subtitle != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppText.bold500(context).copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      subtitle!,
                      style: AppText.bold500(context).copyWith(
                        color: AppColors.grey,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: AppText.bold500(context).copyWith(
                    fontSize: 15.sp,
                  ),
                ),
        ],
      ),
    );
  }
}
