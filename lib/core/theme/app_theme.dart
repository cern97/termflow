import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // 1. Paketi içeri aldık
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // 1. ARKA PLAN RENGİ (Duvarlar)
      scaffoldBackgroundColor: AppColors.background,

      // 2. ANA RENK TANIMI (Opsiyonel ama iyidir)
      // Bazı widget'lar (loading çubuğu vs.) otomatik bu rengi alır.
      primaryColor: AppColors.primaryOrange,

      // 3. YAZI TİPİ (FONT) AYARI - İŞTE SİHİR BURADA ✨
      // Uygulamadaki TÜM yazılar artık "Poppins" fontuyla yazılacak.
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}