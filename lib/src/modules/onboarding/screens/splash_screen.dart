import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:waves_crypto_app/src/shared/assets/images.dart';
import 'package:waves_crypto_app/src/shared/utils/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      // Navigate to next screen
      AppNavigator.pushAndRemoveUntil(context, const DashboardView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          height: 50.h,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
