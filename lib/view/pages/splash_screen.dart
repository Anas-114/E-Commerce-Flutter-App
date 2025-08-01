import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF6B35),
            Color(0xFFF7931E),
            Color(0xFFFFB347),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            const SizedBox(height: 20),
            Title(),
            const SizedBox(height: 8),
            Tagline(),
            const SizedBox(height: 50),
            LoadingText(),
          ],
        ),
      ),
    );
  }

  Widget Logo() {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Icon(
        Icons.storefront_rounded,
        size: 50,
        color: Color(0xFFFF6B35),
      ),
    );
  }

  Widget Title() {
    return const Text(
      'MARKET HUB',
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 3.0,
        shadows: [
          Shadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }

  Widget Tagline() {
    return const Text(
      'Your Shopping Destination',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 1.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget LoadingText() {
    return const Text(
      'Setting up your marketplace...',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
