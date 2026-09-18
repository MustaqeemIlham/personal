import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../core/utils/url_utils.dart';

/// A single project row in the editorial project list:
/// number · title · description · tech line · optional [GitHub] [Demo] links.
/// No card border, no shadow — separation comes from a ThinDivider between
/// entries in the parent list.
class ProjectEntry extends StatelessWidget {
  final int index;
  final String title;
  final String tech;
  final String description;
  final String? achievement;
  final String? githubUrl;
  final String? demoUrl;

  const ProjectEntry({
    Key? key,
    required this.index,
    required this.title,
    required this.tech,
    required this.description,
    this.achievement,
    this.githubUrl,
    this.demoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 34,
            child: Text(
              index.toString().padLeft(2, '0'),
              style: GoogleFonts.notoSansJp(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.notoSerifJp(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.charcoal,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 13.5,
                    color: AppColors.textPrimary,
                    height: 1.7,
                  ),
                ),
                if (achievement != null && achievement!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    achievement!,
                    style: GoogleFonts.notoSansJp(
                      fontSize: 12,
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Text(
                  tech,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6,
                  ),
                ),
                if ((githubUrl != null && githubUrl!.isNotEmpty) ||
                    (demoUrl != null && demoUrl!.isNotEmpty)) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (githubUrl != null && githubUrl!.isNotEmpty)
                        _ProjectLink(label: 'GitHub', url: githubUrl!),
                      if (githubUrl != null &&
                          githubUrl!.isNotEmpty &&
                          demoUrl != null &&
                          demoUrl!.isNotEmpty)
                        const SizedBox(width: 18),
                      if (demoUrl != null && demoUrl!.isNotEmpty)
                        _ProjectLink(label: 'Demo', url: demoUrl!),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectLink extends StatefulWidget {
  final String label;
  final String url;
  const _ProjectLink({required this.label, required this.url});

  @override
  State<_ProjectLink> createState() => _ProjectLinkState();
}

class _ProjectLinkState extends State<_ProjectLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => UrlUtils.launchExternal(widget.url),
        child: Text(
          '[${widget.label}]',
          style: GoogleFonts.notoSansJp(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.accent,
            decoration: _hovering ? TextDecoration.underline : TextDecoration.none,
            decorationColor: AppColors.accent,
          ),
        ),
      ),
    );
  }
}
