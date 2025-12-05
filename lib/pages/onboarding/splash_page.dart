import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Bu sadece yer tutucu. Arkadaşın burayı silip gerçeğini yapacak.
      body: Center(
        child: Text(
          "Splash Screen (Arkadaşın Burayı Kodlayacak)",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}