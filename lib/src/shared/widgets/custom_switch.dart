import 'package:flutter/cupertino.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
  }) : super(key: key);

  final bool value;
  final Function(bool newValue) onToggle;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      alignment: Alignment.topLeft,
      child: CupertinoSwitch(
        value: value,
        activeColor: AppColors.blue,
        onChanged: onToggle,
      ),
    );
  }
}
