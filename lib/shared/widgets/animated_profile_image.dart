import 'package:flutter/material.dart';

class AnimatedProfileImage extends StatefulWidget {
  const AnimatedProfileImage({super.key});

  @override
  State<AnimatedProfileImage> createState() => _AnimatedProfileImageState();
}

class _AnimatedProfileImageState extends State<AnimatedProfileImage> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _ctrl,
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: const DecorationImage(
            image: AssetImage('assets/images/photo_6145403992587046632_y.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12)],
        ),
      ),
    );
  }
}
