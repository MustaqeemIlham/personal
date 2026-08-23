import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillContainer extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final double proficiency;
  final String description;
  final bool useMaterialIcon;

  const SkillContainer({super.key, required this.label, required this.icon, required this.iconColor, required this.proficiency, required this.description, this.useMaterialIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 6)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: useMaterialIcon
                  ? Icon(icon, color: iconColor, size: 20)
                  : FaIcon(icon, color: iconColor, size: 20),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          SizedBox(
            height: 6,
            child: LinearProgressIndicator(value: proficiency, color: iconColor, backgroundColor: Colors.grey[200]),
          ),
          const SizedBox(height: 6),
          Text(description, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF6B7280))),
        ],
      ),
    );
  }
}
