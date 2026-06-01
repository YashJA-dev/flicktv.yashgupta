import 'package:flutter/material.dart';

class AnimatedInfoCard extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  AnimatedInfoCard({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, 100 * (1 - animation.value)),
            child: Transform.scale(
              scale: 0.6 + (0.4 * animation.value),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
