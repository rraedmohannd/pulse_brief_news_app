import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get display => GoogleFonts.plusJakartaSans(
        fontSize: 34,
        height: 1.08,
        fontWeight: FontWeight.w800,
        color: AppColors.slateText,
      );

  static TextStyle get headline => GoogleFonts.plusJakartaSans(
        fontSize: 24,
        height: 1.18,
        fontWeight: FontWeight.w800,
        color: AppColors.slateText,
      );

  static TextStyle get title => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: AppColors.slateText,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 14,
        height: 1.55,
        fontWeight: FontWeight.w500,
        color: AppColors.secondaryText,
      );

  static TextStyle get bodyStrong => GoogleFonts.inter(
        fontSize: 14,
        height: 1.45,
        fontWeight: FontWeight.w700,
        color: AppColors.slateText,
      );

  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: AppColors.tertiaryText,
      );
}
