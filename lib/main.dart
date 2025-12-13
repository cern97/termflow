import 'package:flutter/material.dart';
import 'package:termflow/pages/onboarding/splash_page.dart';




// 1. Senin hazırladığın tema dosyasını (Renkler + Fontlar) çağırıyoruz
import 'core/theme/app_theme.dart';

// 2. Geçici oluşturduğumuz Splash (Açılış) ekranını çağırıyoruz


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Sağ üstteki "Debug" bandını kaldırır
      debugShowCheckedModeBanner: false,

      // Uygulamanın görünen adı
      title: 'TermFlow', // Proje ismin (istersen değiştirebilirsin)

      // 3. İŞTE BÜYÜK AN:
      // theme.dart içinde Poppins fontunu ayarladığımız için,
      // bu satır sayesinde tüm uygulama artık o fontu kullanacak.
      theme: AppTheme.lightTheme,

      // Başlangıç rotası (Splash ekranı)
      home: const SplashScreen(),
      //const Scaffold(
  //body: Center(
    //child: Text("Uygulama Çalışıyor!", style: TextStyle(fontSize: 30, color: Colors.black)),
  //),
   //)
    );
  }
}