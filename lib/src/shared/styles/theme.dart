import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: AppColors.textDefault,
        bodyColor: AppColors.textDefault,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
