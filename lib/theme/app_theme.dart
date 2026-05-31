import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    final TextTheme baseTextTheme = GoogleFonts.interTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.polarWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.tideBlue,
        brightness: Brightness.light,
        primary: AppColors.tideBlue,
        secondary: AppColors.warmSand,
        surface: AppColors.white,
        onSurface: AppColors.slateText,
      ),
      textTheme: baseTextTheme.apply(
        bodyColor: AppColors.slateText,
        displayColor: AppColors.slateText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.slateText,
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.tideBlue,
        unselectedItemColor: AppColors.tertiaryText,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white.withValues(alpha: 0.72),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.72),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.84),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(
            color: AppColors.tideBlue,
            width: 1.4,
          ),
        ),
      ),
    );
  }
}
