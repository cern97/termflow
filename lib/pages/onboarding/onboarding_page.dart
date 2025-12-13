import 'package:flutter/material.dart';
// Ana sayfanın importu (Eğer hata verirse başına // koyarak yorum satırı yapabilirsin)
// import '../home/home_page.dart'; 

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  // RESİM LİSTESİ (Burada tam 3 resim olduğundan emin ol)
  final List<String> onboardingImages = [
    "assets/images/bilgi.jpg",      // 1. Sayfa
    "assets/images/kartBilgisi.jpg",// 2. Sayfa
    "assets/images/baslayalim.png", // 3. Sayfa (Başla butonu burada çıkacak)
  ];

  @override
  Widget build(BuildContext context) {
    // Son sayfada mıyız kontrolü
    bool isLastPage = _currentPage == onboardingImages.length - 1;

    return Scaffold(
      // SafeArea kullanmıyoruz ki resim en tepeye kadar (saatin arkasına) çıksın
      body: Stack(
        children: [
          // KATMAN 1: TAM EKRAN RESİMLER (ARKAPLAN)
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemCount: onboardingImages.length, // Listenin uzunluğu kadar sayfa olsun
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingImages[index],
                fit: BoxFit.cover, // SİHİRLİ KOD: Resmi tüm ekrana yayar, boşluk bırakmaz
                width: double.infinity, // Ekran genişliği kadar
                height: double.infinity, // Ekran yüksekliği kadar
              );
            },
          ),

          // KATMAN 2: NOKTALAR VE BUTON (RESMİN ÜZERİNE BİNER)
          Positioned(
            bottom: 50, // Ekranın altından 50 piksel yukarıda
            left: 20,
            right: 20,
            child: Column(
              children: [
                // 1. NOKTALAR (Eğer son sayfadaysak gizleyebiliriz veya gösterebiliriz)
                // Son sayfada sadece buton olsun dersen bu if'i kullan: if (!isLastPage)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingImages.length,
                    (index) => buildDot(index: index),
                  ),
                ),

                const SizedBox(height: 30), // Noktalar ile buton arası boşluk

                // 2. BAŞLA BUTONU (Sadece Son Sayfada Görünür)
                if (isLastPage)
                  ElevatedButton(
                    onPressed: () {
                      debugPrint("Başla butonuna basildi!");
                      // Ana sayfaya yönlendirme kodunu buraya açabilirsin:
                      /*
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                      */
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7F00), // Turuncu
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56), // Tam genişlik
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Hemen Başla",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Nokta Tasarımı
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 6),
      height: 8,
      // Seçili olan nokta daha geniş (24), diğerleri (8)
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        // Resim koyu renkse noktalar görünsün diye beyaz veya turuncu yapıyoruz
        color: _currentPage == index ? const Color(0xFFFF7F00) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}