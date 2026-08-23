import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String technologies;
  final String description;
  final String achievement;

  const ProjectCard({super.key, required this.title, required this.technologies, required this.description, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xFF111827))),
          const SizedBox(height: 8),
          Text(technologies, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF6B7280))),
          const SizedBox(height: 12),
          Expanded(child: Text(description, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF4B5563)))),
          const SizedBox(height: 12),
          Text(achievement, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF2563EB), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
