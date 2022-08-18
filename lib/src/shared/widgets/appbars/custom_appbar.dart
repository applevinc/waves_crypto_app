import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.actions,
    this.logoColor,
    this.showGradientBackground = true,
    this.automaticallyImplyLeading = true,
    this.title,
    this.label,
  }) : super(key: key);

  final Color? logoColor;
  final Widget? leading;
  final Widget? title;
  final String? label;
  final List<Widget>? actions;
  final bool showGradientBackground;
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xfffafafa),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 0,
      leading: leading,
      title: title,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: AppPadding.horizontal),
          child: Row(children: actions == null ? [] : actions!),
        ),
      ],
    );
  }
}
