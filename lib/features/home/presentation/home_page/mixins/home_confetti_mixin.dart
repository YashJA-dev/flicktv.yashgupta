import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yashgupta/core/animations/confetti_animation/congetti_particles.dart';

mixin HomeConfettiMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  late AnimationController confettiController;
  late final List<ConfettiParticle> confettiParticles;

  bool showConfetti = false;

  void setupHomeConfetti({required VoidCallback onCompleted}) {
    confettiParticles = _createConfettiParticles();

    confettiController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    confettiController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (!mounted) return;
        onCompleted();
      }
    });
  }

  void startConfetti() {
    setState(() {
      showConfetti = true;
    });

    confettiController.forward(from: 0);
  }

  void hideConfetti() {
    setState(() {
      showConfetti = false;
    });
  }

  List<ConfettiParticle> _createConfettiParticles() {
    final random = Random(7);

    final colors = [
      Colors.yellow,
      Colors.blue,
      Colors.pink,
      Colors.green,
      Colors.orange,
    ];

    return List.generate(52, (index) {
      final fromLeft = index.isEven;
      final speedX = 140 + random.nextDouble() * 240;
      final speedY = -180 - random.nextDouble() * 180;

      return ConfettiParticle(
        fromLeft: fromLeft,
        startY: 115 + random.nextDouble() * 80,
        velocityX: fromLeft ? speedX : -speedX,
        velocityY: speedY,
        gravity: 360 + random.nextDouble() * 220,
        width: 6 + random.nextDouble() * 10,
        height: 3 + random.nextDouble() * 6,
        rotation: random.nextDouble() * pi * 4,
        color: colors[index % colors.length],
      );
    });
  }

  void disposeHomeConfetti() {
    confettiController.dispose();
  }
}
