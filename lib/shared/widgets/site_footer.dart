import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app/theme/app_colors.dart';
import '../../core/utils/url_utils.dart';
import 'content_container.dart';

/// Small, quiet footer — a thin rule, a line of copyright text and a row of
/// text-weight icon links. No dark full-bleed band.
class SiteFooter extends StatelessWidget {
  final String copyrightText;

  const SiteFooter({super.key, required this.copyrightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: ContentContainer(
        verticalPadding: const EdgeInsets.symmetric(vertical: 22),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 12,
          children: [
            Text(
              copyrightText,
              style: GoogleFonts.notoSansJp(
                fontSize: 11.5,
                color: AppColors.muted,
                letterSpacing: 0.3,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _FooterIcon(icon: FontAwesomeIcons.github, url: 'https://github.com/ilham-mustaqeem'),
                const SizedBox(width: 16),
                _FooterIcon(icon: FontAwesomeIcons.linkedin, url: 'https://www.linkedin.com/in/ilham-mustaqeem-130797269/'),
                const SizedBox(width: 16),
                _FooterIcon(icon: FontAwesomeIcons.envelope, url: 'mailto:ilhammustaqeem8@gmail.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _FooterIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => url.startsWith('mailto:') ? UrlUtils.launchEmail(url) : UrlUtils.launchExternal(url),
        child: FaIcon(icon, size: 14, color: AppColors.muted),
      ),
    );
  }
}
