import 'package:flutter/material.dart';

class ConfettiParticle {
  final bool fromLeft;
  final double startY;
  final double velocityX;
  final double velocityY;
  final double gravity;
  final double width;
  final double height;
  final double rotation;
  final Color color;

  const ConfettiParticle({
    required this.fromLeft,
    required this.startY,
    required this.velocityX,
    required this.velocityY,
    required this.gravity,
    required this.width,
    required this.height,
    required this.rotation,
    required this.color,
  });
}
