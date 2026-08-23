import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String date;
  final List<String> bullets;

  const ExperienceCard({super.key, required this.title, required this.company, required this.location, required this.date, required this.bullets});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xFF111827))),
          const SizedBox(height: 6),
          Text('$company • $location', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF6B7280))),
          const SizedBox(height: 6),
          Text(date, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF9CA3AF))),
          const SizedBox(height: 12),
          ...bullets.map((b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
                    Expanded(child: Text(b, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF4B5563))),),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
