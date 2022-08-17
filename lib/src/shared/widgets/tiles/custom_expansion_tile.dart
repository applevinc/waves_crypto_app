import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class CustomExpansionTile extends StatefulWidget {
  CustomExpansionTile({
    Key? key,
    this.title,
    this.label,
    required this.children,
    this.showTrailing = true,
    this.onExpansionChanged,
    this.isTileExpanded,
  }) : super(key: key);

  final Widget? title;
  final String? label;
  final List<Widget> children;
  final bool showTrailing;
  final Function(bool)? onExpansionChanged;
  bool? isTileExpanded;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    final isTileExpanded = widget.isTileExpanded;
    if (isTileExpanded != null) {
      _expanded = isTileExpanded;
    } else {
      _expanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        child: ExpansionTile(
          collapsedBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
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
            if (widget.onExpansionChanged != null) {
              widget.onExpansionChanged!(expanded);
            }

            if (widget.isTileExpanded != null) {
              widget.isTileExpanded = expanded;
            }

            setState(() {
              _expanded = expanded;
            });
          },
        ),
      ),
    );
  }
}
