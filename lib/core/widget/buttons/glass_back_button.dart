import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBackButton extends StatelessWidget {
  const GlassBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
