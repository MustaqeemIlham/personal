import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

/// Flat, text-first list item for a single education record — institution,
/// degree, and an optional period line. No card, no border box.
class EducationEntry extends StatelessWidget {
  final String institution;
  final String degree;
  final String period;

  const EducationEntry({
    super.key,
    required this.institution,
    required this.degree,
    this.period = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: GoogleFonts.notoSerifJp(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.charcoal,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          degree,
          style: GoogleFonts.notoSansJp(
            fontSize: 13.5,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        if (period.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            period,
            style: GoogleFonts.notoSansJp(
              fontSize: 11.5,
              color: AppColors.muted,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ],
    );
  }
}
