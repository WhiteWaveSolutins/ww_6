import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_doc/ui/resurses/colors.dart';
import 'package:scan_doc/ui/resurses/text.dart';

final lightThemeData = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    surfaceTintColor: AppColors.black,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
    ),
    titleTextStyle: AppText.text16,
  ),
  scaffoldBackgroundColor: AppColors.black,
  textTheme: TextTheme(
    bodyMedium: AppText.text2,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        vertical: 18.5,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: AppText.text2.copyWith(color: Colors.white),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: AppText.text16.copyWith(
      height: 1,
      color: Colors.white.withOpacity(0.3),
    ),
    filled: true,
    fillColor: AppColors.white.withOpacity(.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.black,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
  ),
);
