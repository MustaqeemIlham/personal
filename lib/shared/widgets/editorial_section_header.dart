import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class EditorialSectionHeader extends StatelessWidget {
  final String number; // e.g. '01'
  final String title; // e.g. 'PROFILE'
  final String jpLabel; // small Japanese label

  const EditorialSectionHeader({
    Key? key,
    required this.number,
    required this.title,
    this.jpLabel = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          style: GoogleFonts.notoSansJp(
            fontSize: 14,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$title',
                    style: GoogleFonts.notoSerifJp(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.charcoal,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (jpLabel.isNotEmpty)
                    Text(jpLabel,
                        style: GoogleFonts.notoSansJp(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        )),
                ],
              ),
              const SizedBox(height: 6),
              Container(height: 1, color: AppColors.border),
            ],
          ),
        ),
      ],
    );
  }
}
