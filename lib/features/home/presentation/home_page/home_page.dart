import 'package:flutter/material.dart';
import 'package:yashgupta/core/animations/confetti_animation/confetti_burst.dart';
import 'package:yashgupta/core/utils/image_assets.dart';
import 'package:yashgupta/core/widget/buttons/primary_button.dart';
import 'package:yashgupta/core/widget/card/redirect_info_card.dart';
import 'package:yashgupta/core/widget/info_widgets/info_widget.dart';
import 'package:yashgupta/features/home/presentation/home_page/mixins/home_animation_mixin.dart';
import 'package:yashgupta/features/home/presentation/home_page/mixins/home_confetti_mixin.dart';
import 'package:yashgupta/features/home/presentation/home_page/widget/animatied_info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeAnimationMixin, HomeConfettiMixin {
  @override
  void initState() {
    super.initState();

    setupHomeAnimations();

    setupHomeConfetti(
      onCompleted: () {
        hideConfetti();
        alignController.forward();
      },
    );

    setupHomeAnimationChain(
      onImageAnimationCompleted: () {},
      onTextAnimationCompleted: startConfetti,
    );

    startHomeAnimation();
  }

  @override
  void dispose() {
    disposeHomeAnimations();
    disposeHomeConfetti();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final topPadding = MediaQuery.paddingOf(context).top;
    final availableHeight = screenHeight - topPadding - kToolbarHeight;
    final moneyImageSize = availableHeight * 0.15;
    final blinkitFontSize = availableHeight * 0.03;
    final moneyTextFontSize = availableHeight * 0.04;
    final headerReservedHeight =
        moneyImageSize + 8 + blinkitFontSize + moneyTextFontSize + 36;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding + kToolbarHeight,
            left: 18,
            right: 18,
          ),
          child: Stack(
            children: [
              if (showConfetti)
                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedBuilder(
                      animation: confettiController,
                      builder: (context, child) {
                        return ConfettiBurst(
                          progress: confettiController.value,
                          particles: confettiParticles,
                        );
                      },
                    ),
                  ),
                ),

              AlignTransition(
                alignment: alignAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: imageToMidController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, imageToMidAnimation.value),
                          child: child,
                        );
                      },
                      child: Image.asset(
                        ImageAssets.money,
                        width: moneyImageSize,
                        height: moneyImageSize,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedBuilder(
                      animation: textController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, -10 * textAnimation.value),
                          child: Opacity(
                            opacity: textAnimation.value,
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        'Blinkit',
                        style: TextStyle(
                          fontSize: blinkitFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: textController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, -10 * textAnimation.value),
                          child: Opacity(
                            opacity: textAnimation.value,
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        'MONEY',
                        style: TextStyle(
                          fontSize: moneyTextFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned.fill(
                top: headerReservedHeight,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedInfoCard(
                        animation: firstInfoAnimation,
                        child: const InfoCardWidget(
                          title: 'Single Tap Payments',
                          subtitle:
                              'Enjoy seamless payments without the wait for OTPs',
                          imageAsset: ImageAssets.phone,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedInfoCard(
                        animation: secondInfoAnimation,
                        child: const InfoCardWidget(
                          title: 'Zero Failure',
                          subtitle:
                              'Zero payment failures ensure you never miss an order',
                          imageAsset: ImageAssets.phone,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedInfoCard(
                        animation: thirdInfoAnimation,
                        child: const InfoCardWidget(
                          title: 'Real-time refunds',
                          subtitle:
                              'No need to wait for refunds, Blinkit Money refunds are instant!',
                          imageAsset: ImageAssets.phone,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AnimatedBuilder(
                        animation: bottomController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: bottomController.value,
                            child: child,
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimaryButton(text: 'Add Money', onPressed: () {}),
                            const SizedBox(height: 18),
                            RedirectInfoCard(
                              title: 'Claim Gift Card',
                              subtitle:
                                  'Enter gift card details to claim your gift card',
                              imageAsset: ImageAssets.gift,
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Enjoy Seamless \n One Tap Payments',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
