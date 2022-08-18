import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';

Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget body,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  final size = MediaQuery.of(context).size.height;

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: enableDrag,
    constraints: BoxConstraints(
      maxHeight: size,
    ),
    isDismissible: isDismissible,
    backgroundColor: Colors.transparent,
    builder: (context) => body,
  );
}

class CustomBottomSheetBody extends StatelessWidget {
  const CustomBottomSheetBody({
    Key? key,
    required this.content,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  final List<Widget> content;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: padding ??
          EdgeInsets.only(
            top: 8.h,
            right: AppPadding.horizontal,
            left: AppPadding.horizontal,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: content,
      ),
    );
  }
}

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            bottom: 10.46.h,
            right: 5.w,
          ),
          child: Icon(
            Icons.close,
            size: 20.sp,
            color: color,
          ),
        ),
      ),
    );
  }
}

class Dragger extends StatelessWidget {
  const Dragger({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 4.h,
      color: color ?? AppColors.grey,
    );
  }
}
