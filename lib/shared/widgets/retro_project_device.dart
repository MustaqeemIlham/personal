import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/theme/app_colors.dart';
import '../../data/models/project_model.dart';

class RetroProjectDevice extends StatelessWidget {
  final Project project;
  final int index;
  final VoidCallback? onView;

  const RetroProjectDevice({
    Key? key,
    required this.project,
    required this.index,
    this.onView,
  }) : super(key: key);

  static const double deviceWidth = 230;
  static const double deviceHeight = 380;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onView,
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(
                color: AppColors.charcoal,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.charcoal.withOpacity(0.08),
                  offset: const Offset(6, 6),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                // =========================
                // TOP
                // =========================
                SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Container(
                        width: 14,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),

                      const Spacer(),

                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // =========================
                // SCREEN
                // =========================
                SizedBox(
                  width: 200,
                  height: 140,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF203020),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: RetroProjectScreen(
                      project: project,
                      index: index,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // =========================
                // CONTROLS
                // =========================
                SizedBox(
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _Dpad(),
                      _ActionButtons(),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // =========================
                // PROJECT INFORMATION
                // =========================
                SizedBox(
                  width: 200,
                  height: 82,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index.toString().padLeft(2, '0')} — ${project.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.notoSansJp(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.charcoal,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        project.technologies,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.notoSansJp(
                          fontSize: 11,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RetroProjectScreen extends StatelessWidget {
  final Project project;
  final int index;

  const RetroProjectScreen({
    Key? key,
    required this.project,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.notoSansJp(
      fontSize: 11,
      color: const Color(0xFFB7F5A7),
      letterSpacing: 0.8,
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // PROJECT NUMBER
              // =========================
              Text(
                'PROJECT ${index.toString().padLeft(2, '0')}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: textStyle.copyWith(
                  fontSize: 9,
                  color: const Color(0xFF9BC49C),
                ),
              ),

              const SizedBox(height: 4),

              // =========================
              // PROJECT TITLE
              // =========================
              Text(
                project.title.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 5),

              // =========================
              // DESCRIPTION
              // =========================
              Expanded(
                child: Text(
                  project.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.copyWith(
                    fontSize: 9,
                    color: const Color(0xFFD6EFD0),
                    letterSpacing: 0.4,
                    height: 1.15,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // =========================
              // BUTTON AREA
              // =========================
              SizedBox(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ScreenButton(
                      label: 'A',
                      filled: true,
                    ),

                    Text(
                      'VIEW',
                      style: textStyle.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    _ScreenButton(
                      label: 'B',
                      filled: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // =========================
        // SCANLINES
        // =========================
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _ScanlinePainter(
                intensity: 0.06,
                spacing: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScreenButton extends StatelessWidget {
  final String label;
  final bool filled;

  const _ScreenButton({
    required this.label,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled
            ? const Color(0xFFB7F5A7)
            : AppColors.border,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: GoogleFonts.notoSansJp(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.charcoal,
        ),
      ),
    );
  }
}

class _ScanlinePainter extends CustomPainter {
  final double intensity;
  final double spacing;

  _ScanlinePainter({this.intensity = 0.05, this.spacing = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(intensity)
      ..style = PaintingStyle.fill;

    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, 1), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Dpad extends StatelessWidget {
  const _Dpad({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.charcoal, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(width: 18, height: 8, color: AppColors.charcoal),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(width: 8, height: 18, color: AppColors.charcoal),
                const SizedBox(width: 6),
                Container(width: 8, height: 18, color: AppColors.charcoal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.charcoal, width: 2),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 44,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.charcoal, width: 2),
          ),
        ),
      ],
    );
  }
}
