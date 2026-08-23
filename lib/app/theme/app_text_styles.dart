import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final headline = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final body = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
