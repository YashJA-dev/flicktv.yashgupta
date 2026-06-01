import 'package:flutter/material.dart';

mixin HomeAnimationMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  late AnimationController imageToMidController;
  late Animation<double> imageToMidAnimation;

  late AnimationController textController;
  late Animation<double> textAnimation;

  late AnimationController alignController;
  late Animation<AlignmentGeometry> alignAnimation;

  late AnimationController firstInfoController;
  late Animation<double> firstInfoAnimation;

  late AnimationController secondInfoController;
  late Animation<double> secondInfoAnimation;

  late AnimationController thirdInfoController;
  late Animation<double> thirdInfoAnimation;

  late AnimationController bottomController;

  bool _firstInfoAnimationStarted = false;
  bool _bottomAnimationStarted = false;

  void setupHomeAnimations() {
    imageToMidController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    imageToMidAnimation = Tween<double>(begin: -250, end: 0).animate(
      CurvedAnimation(parent: imageToMidController, curve: Curves.easeInOut),
    );

    textController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    textAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: textController, curve: Curves.easeInOut));

    alignController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    alignAnimation =
        Tween<AlignmentGeometry>(
          begin: Alignment.center,
          end: Alignment.topCenter,
        ).animate(
          CurvedAnimation(parent: alignController, curve: Curves.easeInOut),
        );

    firstInfoController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    firstInfoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: firstInfoController, curve: Curves.easeOutBack),
    );

    secondInfoController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    secondInfoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: secondInfoController, curve: Curves.easeOutBack),
    );

    thirdInfoController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    thirdInfoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: thirdInfoController, curve: Curves.easeOutBack),
    );

    bottomController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void startHomeAnimation() {
    imageToMidController.forward();
  }

  void setupHomeAnimationChain({
    required VoidCallback onImageAnimationCompleted,
    required VoidCallback onTextAnimationCompleted,
  }) {
    imageToMidController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        textController.forward();
        onImageAnimationCompleted();
      }
    });

    textController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onTextAnimationCompleted();
      }
    });

    alignController.addListener(() {
      if (!_firstInfoAnimationStarted && alignController.value >= 0.7) {
        _firstInfoAnimationStarted = true;
        firstInfoController.forward();
      }
    });

    firstInfoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        secondInfoController.forward();
      }
    });

    secondInfoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        thirdInfoController.forward();
      }
    });

    thirdInfoController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_bottomAnimationStarted) {
        _bottomAnimationStarted = true;
        bottomController.forward();
      }
    });
  }

  void disposeHomeAnimations() {
    imageToMidController.dispose();
    textController.dispose();
    alignController.dispose();
    firstInfoController.dispose();
    secondInfoController.dispose();
    thirdInfoController.dispose();
    bottomController.dispose();
  }
}
