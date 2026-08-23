import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class ProjectEntry extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String tech;
  final String description;
  final Map<String, String>? metrics;
  final VoidCallback? onView;

  const ProjectEntry({
    Key? key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.tech,
    required this.description,
    this.metrics,
    this.onView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.charcoal, width: 2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withOpacity(0.12),
            offset: const Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: AppColors.accent,
              border: Border.all(color: AppColors.charcoal, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                index.toString().padLeft(2, '0'),
                style: GoogleFonts.notoSansJp(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.surface,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.notoSerifJp(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.charcoal,
                          height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border, width: 1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'GAME',
                        style: GoogleFonts.notoSansJp(
                          fontSize: 9,
                          color: AppColors.textSecondary,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  tech,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                    height: 1.7,
                  ),
                ),
                if (metrics != null && metrics!.isNotEmpty) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 18,
                    runSpacing: 10,
                    children: metrics!.entries
                        .map((e) => _MetricTile(label: e.key, value: e.value))
                        .toList(),
                  ),
                ],
                const SizedBox(height: 14),
                InkWell(
                  onTap: onView,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'VIEW PROJECT',
                          style: GoogleFonts.notoSansJp(
                            fontSize: 11,
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_right_alt, color: AppColors.accent, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;

  const _MetricTile({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSansJp(
              fontSize: 10,
              color: AppColors.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.notoSansJp(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.charcoal,
            ),
          ),
        ],
      ),
    );
  }
}
