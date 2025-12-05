import 'package:flutter/material.dart';
import 'package:termflow/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 0: Home, 1: Library, 2: Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, Ceren",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),
              SizedBox(height: 1),
              Text(
                "👋",
                style: TextStyle(fontSize: 41), // Emojiyi büyütelim
              ),
              SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Streak 🔥",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.lightText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "13",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),
                  ],
                ),
              ),
              // Araya yine boşluk koyalım
              SizedBox(height: 24),

              // ARAMA ÇUBUĞU (TextField)
              TextField(
                decoration: InputDecoration(
                  // İpucu yazısı (Kullanıcı yazmaya başlayınca kaybolur)
                  hintText: "Search terms...",
                  hintStyle: TextStyle(
                    color: AppColors.lightText,
                    fontWeight: FontWeight.w500,
                  ),

                  // Sol taraftaki büyüteç ikonu
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.lightText,
                    fontWeight: FontWeight.w500,
                  ),

                  // Arka plan rengi ayarları
                  filled: true, // "İçini boya" komutu
                  fillColor: AppColors
                      .cardBackground, // Çok açık gri (AppColors.inputBackground)
                  // Kenarlık ayarları (Çerçeve olmasın ama köşeler yuvarlak olsun)
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  // İçerideki yazının kenarlara uzaklığı
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 24),

              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),

                // ÖNEMLİ: İçine koyacağımız renkler köşelerden taşmasın diye bunu ekliyoruz
                clipBehavior: Clip.antiAlias,

                // Şimdi kartın içini dizmeye başlıyoruz (Alt alta gelecekler)
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2E2B3C), // Koyu renk
                            Color(0xFFF9881F), // Turuncu renk
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                    SizedBox(height: 19),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Resume Learning",
                            style: TextStyle(
                              color: AppColors.lightText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Araya yine boşluk koyalım
                          Text(
                            "JavaScript ES6",
                            style: TextStyle(
                              fontSize: 21,
                              color: AppColors.darkText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 12),

                          // İlerleme Çubuğu
                          LinearProgressIndicator(
                            value: 0.35, // Çubuğun doluluk oranı (%35)
                            backgroundColor:
                                Colors.grey.shade200, // Arka plan (gri)
                            color: Colors.orange, // Dolu kısım (turuncu)
                            minHeight: 11, // Çubuğun kalınlığı
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 9),
                          // Sağ taraftaki "15/42" yazısı
                          Align(
                            alignment: Alignment.centerRight,

                            child: Text(
                              "15/42 complete",
                              style: TextStyle(
                                color: AppColors.lightText,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          SizedBox(height: 16),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  224,
                                  138,
                                  8,
                                ),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Body bittikten sonra, Scaffold kapanmadan hemen önce:
      bottomNavigationBar: Container(
        // Menüyü aşağıdan ve kenarlardan uzaklaştır (Yüzen efekt)
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 19),
        padding: const EdgeInsets.all(11), // İç boşluk

       decoration: BoxDecoration(
          color: Colors.white, // Kutunun rengi
          borderRadius: BorderRadius.circular(30), // Yuvarlatma
          
          // 1. HAMLE: İnce bir çerçeve ekle (Belirginleştirir)
          border: Border.all(color: Colors.grey.shade300, width: 1), 
          
          // 2. HAMLE: Gölgeyi biraz daha koyu yap (0.1 yerine 0.2 veya 0.3)
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // Gölge koyuluğu arttı
              blurRadius: 20, // Gölge bulanıklığı
              offset: const Offset(0, 10), // Aşağı doğru kaydır
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Butonları eşit dağıt
          children: [
            _buildNavItem(0, Icons.home_rounded, "Home"),
            _buildNavItem(1, Icons.book_rounded, "Library"),
            _buildNavItem(2, Icons.person_rounded, "Profile"),
          ],
        ),
      ),
    );
  }

  // BU KODU EN ALTA YAPIŞTIR (Helper Metot)
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Colors.orange
                : Colors.grey, // Seçiliyse Turuncu
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
