import 'package:flutter/material.dart';
import 'package:termflow/pages/onboarding/onboarding_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    // 3 Saniye sonra Onboarding Sayfasına git
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()), 
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bu sadece yer tutucu. Arkadaşın burayı silip gerçeğini yapacak.
      body: SizedBox.expand(
        child: Image.asset("assets/images/splash.jpg",fit: BoxFit.cover)
    )
    );
  }
}

