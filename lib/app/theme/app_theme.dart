import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static final TextTheme _displayText = GoogleFonts.notoSerifJpTextTheme().apply(
    bodyColor: AppColors.textPrimary,
    displayColor: AppColors.textPrimary,
  );

  static final TextTheme _bodyText = GoogleFonts.notoSansJpTextTheme().apply(
    bodyColor: AppColors.textPrimary,
    displayColor: AppColors.textPrimary,
  );

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.accent,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.surface,
    textTheme: _bodyText.merge(_displayText),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.charcoal),
    ),
    dividerColor: AppColors.border,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent, background: AppColors.background),
  );
}
