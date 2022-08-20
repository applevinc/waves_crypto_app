import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
     this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 15.sp,
        ),
      ),
    );
  }
}
