import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;
  final VoidCallback? onTap;

  const ContactInfo({super.key, required this.icon, required this.info, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 6),
            Text(info, style: GoogleFonts.inter(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
