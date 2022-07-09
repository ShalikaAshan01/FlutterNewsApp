import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/common.dart';

class AppThemes {
  AppThemes._();

  //colors
  static const white = Color(0xFFFFFFFF);
  static const Color _lightPrimaryColor = Color(0xFFFF3A44);
  static const Color _lightTextColor = Colors.black;
  static const Color _lightPrimaryColorDark = Color(0xFFF0F1FA);
  static const Color _lightPrimaryColorLight = Color(0xFF0080FF);
  static const Color _lightSecondaryColor = Color(0xFFFFB3B6);
  static const Color _lightSecondaryTextColor = Color(0xFF818181);
  static final Color shimmerBaseColor = Colors.grey[300]!;
  static final Color shimmerHighlightColor = Colors.grey[100]!;
  static final TextStyle _titleSmall =
      TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w600);
  static final TextStyle _titleMedium =
      TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w800);
  static final TextStyle _titleLarge = GoogleFonts.merriweather(
      textStyle: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w800));

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
    fontSize: 14.0.sp,
  );
  static final TextStyle _bodyMedium = TextStyle(
    fontSize: 16.0.sp,
  );

  static const TextStyle _bodyLarge = TextStyle();

  static const TextStyle _displaySmall = TextStyle();

  static const TextStyle _displayMedium = TextStyle();
  static const TextStyle _displayLarge = TextStyle();

  static final TextStyle _labelSmall =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static final TextStyle _labelMedium =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
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
        color: _lightTextColor),
    bodyMedium: _bodyMedium.copyWith(color: _lightTextColor),
    bodyLarge: _bodyLarge.copyWith(color: _lightTextColor),
    displaySmall: _displaySmall.copyWith(color: _lightTextColor),
    displayMedium: _displayMedium.copyWith(color: _lightTextColor),
    displayLarge: _displayLarge.copyWith(color: _lightTextColor),
    labelSmall: _labelSmall.copyWith(color: _lightSecondaryTextColor),
    labelMedium: _labelMedium.copyWith(color: _lightTextColor),
    labelLarge: _labelLarge.copyWith(color: _lightTextColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: _lightPrimaryColor,
      primaryColorDark: _lightPrimaryColorDark,
      dividerColor: _lightPrimaryColorDark,
      primaryColorLight: _lightPrimaryColorLight,
      secondaryHeaderColor: _lightSecondaryColor,
      backgroundColor: white,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: _lightPrimaryColor,
          selectionHandleColor: _lightPrimaryColor),
      scaffoldBackgroundColor: white,
      inputDecorationTheme: InputDecorationTheme(
        iconColor: _lightSecondaryTextColor,
        hintStyle: _bodyMedium.copyWith(color: _lightSecondaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(
            color: _lightPrimaryColorDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(
            color: _lightPrimaryColor,
          ),
        ),
      ),
      cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.cardRadius.r))),
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.black),
          color: _lightPrimaryColor,
          titleTextStyle: _lightTextTheme.headlineSmall),
      textTheme: GoogleFonts.nunitoTextTheme(_lightTextTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: _lightPrimaryColor,
              padding: REdgeInsets.symmetric(
                  vertical: Insets.large.r, horizontal: Insets.extraLarge.r),
              textStyle: _labelMedium,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppBorderRadius.buttonRadius.r)))));

  //the dark theme
  static final ThemeData darkTheme = lightTheme;
}
