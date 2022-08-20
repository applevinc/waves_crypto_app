import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/action_button.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/buttons/app_button.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_bottomsheet.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_divider.dart';

Future<dynamic> startLeasingBottomSheet(BuildContext context) {
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
      padding: EdgeInsets.zero,
      content: [
        SizedBox(height: 8.h),
        const Dragger(),
        SizedBox(height: 40.h),
        const _BalanceSection(),
        SizedBox(height: 35.h),
        const _NodeAddressSection(),
        SizedBox(height: 35.h),
        const _LeaseInformationSection(),
        SizedBox(height: 20.h),
        const _Actions(),
        SizedBox(height: 60.h),
        const _DownButton(),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget downButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 41.h,
        width: 41.h,
        margin: AppPadding.symetricHorizontalOnly,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_downward,
          color: AppColors.textDefault,
          size: 15.sp,
        ),
      ),
    );
  }
}

class _BalanceSection extends StatelessWidget {
  const _BalanceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symetricHorizontalOnly,
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.07),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.power_outlined,
              color: Colors.green,
              size: 25.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Leasing',
                style: AppText.bold500(context).copyWith(
                  fontSize: 13.sp,
                  color: AppColors.grey,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    '100.666',
                    style: AppText.bold600(context).copyWith(
                      fontSize: 23.sp,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  tag(context),
                ],
              ),
            ],
          ),
          SizedBox(width: 30.w),
        ],
      ),
    );
  }

  Widget tag(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue.withOpacity(.1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Text(
        'Waves',
        style: AppText.bold500(context).copyWith(
          fontSize: 9.sp,
          color: AppColors.blue,
        ),
      ),
    );
  }
}

class _NodeAddressSection extends StatelessWidget {
  const _NodeAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.horizontal,
        vertical: 8.h,
      ),
      color: AppColors.grey.withOpacity(.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Node Address',
            style: AppText.bold500(context).copyWith(
              fontSize: 15.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            '3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5',
            style: AppText.bold500(context).copyWith(
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 120.w,
                child: AppButton(
                  icon: Icons.person_add_alt_1_outlined,
                  label: 'Save Address',
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  onTap: () {},
                ),
              ),
              Icon(
                Icons.copy,
                color: AppColors.textDefault,
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LeaseInformationSection extends StatelessWidget {
  const _LeaseInformationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppText.bold600(context).copyWith(
      fontSize: 13.sp,
    );
    final leadingTitleStyle = textStyle.copyWith(color: AppColors.grey);
    final gap = 8.h;

    return Padding(
      padding: AppPadding.symetricHorizontalOnly,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Block',
                style: leadingTitleStyle,
              ),
              Text(
                '106060',
                style: textStyle,
              ),
            ],
          ),
          SizedBox(height: gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirmations',
                style: leadingTitleStyle,
              ),
              Text(
                '09090',
                style: textStyle,
              ),
            ],
          ),
          SizedBox(height: gap),
          Row(
            children: [
              Text(
                'Fees',
                style: leadingTitleStyle,
              ),
              const Spacer(),
              Text(
                '0.001',
                style: textStyle,
              ),
              SizedBox(width: 4.w),
              _RoundedRectangleBadge(
                label: 'Waves',
                labelSize: 9.sp,
                color: AppColors.blue,
              ),
            ],
          ),
          SizedBox(height: gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Timestamp',
                style: leadingTitleStyle,
              ),
              Text(
                'DD.MM.YYYY at 00:00',
                style: textStyle,
              ),
            ],
          ),
          SizedBox(height: gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: leadingTitleStyle,
              ),
              _RoundedRectangleBadge(
                label: 'Active Now',
                labelSize: 13.sp,
                color: Colors.green,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CustomDivider(color: AppColors.grey.withOpacity(.1)),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gap = 8.w;

    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: AppPadding.symetricHorizontalOnly,
        children: [
          ActionButton(
            icon: Icons.search,
            label: 'View on explorer',
            onTap: () {},
          ),
          SizedBox(width: gap),
          ActionButton(
            icon: Icons.copy,
            label: 'Copy TX ID',
            onTap: () {},
          ),
          SizedBox(width: gap),
          ActionButton(
            icon: Icons.search,
            label: 'View on explorer',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _RoundedRectangleBadge extends StatelessWidget {
  const _RoundedRectangleBadge({
    Key? key,
    required this.label,
    required this.labelSize,
    required this.color,
  }) : super(key: key);

  final String label;
  final double labelSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Text(
        label,
        style: AppText.bold500(context).copyWith(
          fontSize: labelSize,
          color: color,
        ),
      ),
    );
  }
}

class _DownButton extends StatelessWidget {
  const _DownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 41.h,
          width: 41.h,
          margin: AppPadding.symetricHorizontalOnly,
          decoration: BoxDecoration(
            color: AppColors.grey.withOpacity(.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_downward,
            color: AppColors.textDefault,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
