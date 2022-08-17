import 'package:flutter/material.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';

class AppText {
  AppText._();

  static TextStyle bold400(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle bold300(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w300,
        );
  }

  static TextStyle bold500(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle bold600(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle bold700(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle bold900(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.textDefault,
          fontWeight: FontWeight.w900,
        );
  }
}
