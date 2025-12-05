import 'package:flutter/material.dart';

class AppColors {
  // Bu sınıfın örneklenmesini engelliyoruz (Sadece static ulaşsınlar diye)
  AppColors._();

  // ===========================================================================
  // 1. BUTON VE AKTİF RENKLER (Onboarding İlerleme & Kayıt Butonu)
  // ===========================================================================
  
  /// Ana Turuncu (Butonun sol tarafı veya tek renk hali)
  static const Color primaryOrange = Color(0xFFFF9800);

  /// Açık Turuncu (Butonun sağ tarafı - Gradient geçişi için)
  static const Color orangeGradientEnd = Color(0xFFFF9A06);

  /// Kullanım Kolaylığı: Butonlarda gradient (geçiş) istendiğinde bu listeyi verin.
  /// Örnek: gradient: LinearGradient(colors: AppColors.primaryGradient)
  static const List<Color> primaryGradient = [
    primaryOrange,
    orangeGradientEnd,
  ];

  // ===========================================================================
  // 2. YAZI RENKLERİ (Typography)
  // ===========================================================================

  /// Koyu Yazı (Dark Text)
  /// Kullanım: "Welcome back", "Create Account" gibi ana başlıklar.
  static const Color darkText = Color(0xFF384250);

  /// Açık Yazı (Light/Grey Text)
  /// Kullanım: Alt açıklamalar, "Please sign up to continue" gibi yazılar.
  static const Color lightText = Color(0xFF6F7684);

  // ===========================================================================
  // 3. INPUT VE FORM ALANLARI (Register Ekranı İçin)
  // ===========================================================================

  /// Pasif Gri
  /// Kullanım: Textbox çerçeveleri (Border), henüz tıklanmamış ikonlar.
  static const Color inputBorder = Color(0xFFBEC2C9);

  /// Form Arkaplanı
  /// Kullanım: Eğer input kutularının içi gri olacaksa bunu kullanın.
  static const Color inputBackground = Color(0xFFF7F7F7);

  // ===========================================================================
  // 4. GENEL ARKAPLAN
  // ===========================================================================
  
  /// Sayfa Arkaplanı (Beyaz)
  static const Color background = Colors.white;
}