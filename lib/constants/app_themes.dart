import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppThemes {
  AppThemes._();

  //colors
  static const Color _lightPrimaryColor = Color(0xFF25a0a2);
  static const Color _lightTextColor = Colors.black;
  static const Color _lightPrimaryColorDark = Color(0xFFb0bec5);
  static const Color _lightSecondaryTextColor = Color(0xFFb0bec5);

  static final TextStyle _titleSmall =
  TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w600);
  static TextStyle titleMedium = TextStyle(
    fontSize: 13.0.sp,
  );
  static final TextStyle _titleMedium =
  TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w600);
  static final TextStyle _titleLarge =
  TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w400);

  static final TextStyle _headlineSmall =
  TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.bold);
  static final TextStyle headlineMedium = TextStyle(
    fontSize: 16.0.sp,
  );
  static final TextStyle _headlineMedium =
  TextStyle(fontSize: 25.0.sp, fontWeight: FontWeight.w500);
  static final TextStyle _headlineLarge =
  TextStyle(fontSize: 30.0.sp, fontWeight: FontWeight.bold);

  static final TextStyle _bodySmall = TextStyle(
    fontSize: 16.0.sp,
  );
  static const TextStyle _bodyMedium = TextStyle();

  static const TextStyle _bodyLarge = TextStyle();

  static const TextStyle _displaySmall = TextStyle();

  static const TextStyle _displayMedium = TextStyle();
  static const TextStyle _displayLarge = TextStyle();

  static const TextStyle _labelSmall = TextStyle();
  static const TextStyle _labelMedium = TextStyle();
  static const TextStyle _labelLarge = TextStyle();

  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    titleSmall: _titleSmall.copyWith(color: _lightTextColor),
    titleMedium: _titleMedium.copyWith(color: _lightTextColor),
    titleLarge: _titleLarge.copyWith(color: _lightTextColor),
    headlineSmall: _headlineSmall.copyWith(color: _lightTextColor),
    headlineMedium: _headlineMedium.copyWith(color: _lightTextColor),
    headlineLarge: _headlineLarge.copyWith(color: _lightTextColor),
    bodySmall: _bodySmall.copyWith(
      color: _lightSecondaryTextColor,
    ),
    bodyMedium: _bodyMedium.copyWith(color: _lightTextColor),
    bodyLarge: _bodyLarge.copyWith(color: _lightTextColor),
    displaySmall: _displaySmall.copyWith(color: _lightTextColor),
    displayMedium: _displayMedium.copyWith(color: _lightTextColor),
    displayLarge: _displayLarge.copyWith(color: _lightTextColor),
    labelSmall: _labelSmall.copyWith(color: _lightTextColor),
    labelMedium: _labelMedium.copyWith(color: _lightTextColor),
    labelLarge: _labelLarge.copyWith(color: _lightTextColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    primaryColorDark: _lightPrimaryColorDark,
    dividerColor: _lightPrimaryColorDark,
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        color: _lightPrimaryColor,
        titleTextStyle: _lightTextTheme.headlineSmall),
    textTheme: _lightTextTheme,
  );

  //the dark theme
  static final ThemeData darkTheme = lightTheme;
}