import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

/// A single labelled row of skills, rendered as running text separated by
/// middle dots rather than a grid of icon cards.
class SkillGroup extends StatelessWidget {
  final String label;
  final List<String> items;

  const SkillGroup({super.key, required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSansJp(
            fontSize: 11.5,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          items.join('  ·  '),
          style: GoogleFonts.notoSansJp(
            fontSize: 14.5,
            color: AppColors.charcoal,
            height: 1.9,
          ),
        ),
      ],
    );
  }
}
