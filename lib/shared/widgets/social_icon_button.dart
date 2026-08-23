import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils/url_utils.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;

  const SocialIconButton({super.key, required this.icon, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (url.startsWith('mailto:')) {
            UrlUtils.launchEmail(url);
          } else {
            UrlUtils.launchExternal(url);
          }
        },
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: color,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
