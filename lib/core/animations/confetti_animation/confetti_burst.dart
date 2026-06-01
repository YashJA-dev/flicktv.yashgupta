import 'package:flutter/material.dart';
import 'package:yashgupta/core/animations/confetti_animation/congetti_particles.dart';

class ConfettiBurst extends StatelessWidget {
  final double progress;
  final List<ConfettiParticle> particles;

  const ConfettiBurst({required this.progress, required this.particles});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final curvedProgress = Curves.easeOut.transform(progress);
    final fadeProgress = Curves.easeIn.transform(progress);

    return Stack(
      children: particles.map((particle) {
        final startX = particle.fromLeft ? -24.0 : screenWidth + 24.0;
        final x = startX + (particle.velocityX * curvedProgress);
        final y =
            particle.startY +
            (particle.velocityY * curvedProgress) +
            (particle.gravity * curvedProgress * curvedProgress);

        return Positioned(
          left: x,
          top: y,
          child: Opacity(
            opacity: (1 - fadeProgress).clamp(0.0, 1.0),
            child: Transform.rotate(
              angle: particle.rotation * progress,
              child: Container(
                width: particle.width,
                height: particle.height,
                decoration: BoxDecoration(
                  color: particle.color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
