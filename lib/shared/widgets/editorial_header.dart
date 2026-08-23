import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class EditorialHeader extends StatelessWidget {
  final String handle;
  final String name;
  final String subtitle;
  final String statusLine;
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onPersonalTap;

  const EditorialHeader({
    Key? key,
    required this.handle,
    required this.name,
    required this.subtitle,
    required this.statusLine,
    this.onPortfolioTap,
    this.onPersonalTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  handle,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: GoogleFonts.notoSerifJp(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.charcoal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  _SmallNavItem(label: 'PORTFOLIO', index: '01', onTap: onPortfolioTap),
                  const SizedBox(width: 8),
                  _SmallNavItem(label: 'PERSONAL', index: '02', onTap: onPersonalTap),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                statusLine,
                style: GoogleFonts.notoSansJp(
                  fontSize: 10,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallNavItem extends StatelessWidget {
  final String label;
  final String index;
  final VoidCallback? onTap;

  const _SmallNavItem({Key? key, required this.label, required this.index, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Row(
          children: [
            Text(
              index,
              style: GoogleFonts.notoSansJp(
                fontSize: 10,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.notoSansJp(
                fontSize: 11,
                color: AppColors.charcoal,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
