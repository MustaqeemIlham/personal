import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

class ThinDivider extends StatelessWidget {
  final double thickness;
  final EdgeInsetsGeometry padding;
  const ThinDivider({Key? key, this.thickness = 1.0, this.padding = const EdgeInsets.symmetric(vertical: 12)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(height: thickness, color: AppColors.border),
    );
  }
}
