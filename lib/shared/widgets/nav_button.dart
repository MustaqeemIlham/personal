import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHighlighted;

  const NavButton({super.key, required this.text, required this.onTap, this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: isHighlighted
              ? BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(6),
                )
              : null,
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: isHighlighted ? Colors.white : const Color(0xFF1F2937),
              fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
