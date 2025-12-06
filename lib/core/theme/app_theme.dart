import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart'; // <<< Google Fonts İÇERİ ALIMI KALDIRILDI
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // 🥇 1. YEREL FONT TANIMLAMASI (fontFamily): 
      // pubspec.yaml'de tanımladığınız 'Poppins' ismini buraya yazarak 
      // tüm uygulamayı internetten bağımsız hale getiriyoruz.
      fontFamily: 'Poppins', 

      // 2. ARKA PLAN RENGİ (Duvarlar)
      scaffoldBackgroundColor: AppColors.background,

      // 3. ANA RENK TANIMI
      primaryColor: AppColors.primaryOrange,

      // 4. TEXTTHEME: 
      // GoogleFonts.poppinsTextTheme() çağrısı yerine boş bırakıyoruz.
      // Tüm Text widget'ları otomatik olarak yukarıdaki 'fontFamily: Poppins' ayarını miras alacaktır.
      // Eğer özel stilleriniz varsa (başlık, gövde vb.), onları burada tanımlayabilirsiniz:
      // textTheme: const TextTheme(
      //   titleLarge: TextStyle(fontWeight: FontWeight.bold),
      //   bodyMedium: TextStyle(fontSize: 14),
      // ),
      
    );
  }
}