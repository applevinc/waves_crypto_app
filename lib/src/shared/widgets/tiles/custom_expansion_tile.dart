import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    this.title,
    this.label,
    required this.children,
    this.showTrailing = true,
  }) : super(key: key);

  final Widget? title;
  final String? label;
  final List<Widget> children;
  final bool showTrailing;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      child: ListTileTheme(
        dense: true,
        contentPadding: EdgeInsets.zero,
        child: ExpansionTile(
          collapsedBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          tilePadding: EdgeInsets.zero,
          title: widget.title != null
              ? widget.title!
              : Text(
                  widget.label!,
                  style: AppText.bold700(context).copyWith(
                    fontSize: 12.sp,
                    color: AppColors.grey,
                  ),
                ),
          trailing: widget.showTrailing
              ? Icon(
                  _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 20.sp,
                  color: AppColors.grey,
                )
              : const SizedBox.shrink(),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: widget.children,
          onExpansionChanged: (bool expanded) {
            setState(() {
              _expanded = expanded;
            });
          },
        ),
      ),
    );
  }
}
