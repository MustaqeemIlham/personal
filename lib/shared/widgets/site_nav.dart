import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';

class SiteNavItem {
  final String label;
  final VoidCallback onTap;
  const SiteNavItem({required this.label, required this.onTap});
}

/// Small, understated text-based in-page navigation row, separated from the
/// header by a thin rule. Underlines on hover instead of using buttons/pills.
class SiteNav extends StatelessWidget {
  final List<SiteNavItem> items;

  const SiteNav({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 22,
        runSpacing: 8,
        children: [
          for (int i = 0; i < items.length; i++) _SiteNavLink(item: items[i]),
        ],
      ),
    );
  }
}

class _SiteNavLink extends StatefulWidget {
  final SiteNavItem item;
  const _SiteNavLink({required this.item});

  @override
  State<_SiteNavLink> createState() => _SiteNavLinkState();
}

class _SiteNavLinkState extends State<_SiteNavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.item.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            widget.item.label,
            style: GoogleFonts.notoSansJp(
              fontSize: 12.5,
              color: _hovering ? AppColors.accent : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              decoration: _hovering ? TextDecoration.underline : TextDecoration.none,
              decorationColor: AppColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}
