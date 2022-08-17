import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    required this.onChanged,
    required this.onClose,
  }) : super(key: key);

  final Function(String) onChanged;
  final Function() onClose;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffeef0f3),
        hintText: 'Search ',
        hintStyle: AppText.bold400(context).copyWith(
          color: AppColors.grey,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 9.h,
          horizontal: 11.5.w,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.grey,
          size: 20.sp,
        ),
        suffixIcon: controller.text.isNotEmpty
            ? GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  controller.clear();
                  widget.onClose();
                  setState(() {});
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
