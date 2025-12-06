import 'package:flutter/material.dart';
import 'package:termflow/core/theme/app_colors.dart'; 
import '../../widgets/navbar.dart'; // Navigasyon çubuğu widget'ını import ediyoruz
import '../library/library_page.dart'; // Library sayfanızı import ediyoruz
import '../profile/profile_screen.dart'; // Profile sayfanızı import ediyoruz


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Sayfalar Arası Geçiş Fonksiyonu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  // Tüm Sayfaların Listesi
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // 🥇 DÜZELTME YAPILAN YER: 
      // Home içeriğini oluşturmak için metodu çağırıyoruz, 
      // sınıfın kendisini değil (Sonsuz döngüyü önler).
      _buildHomePageContent(), // Index 0: Home sayfasının detaylı içeriği
      const LibraryScreen(),    // Index 1: Library sayfası
      const ProfileScreen(),      // Index 2: Profile sayfası
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY: Seçili Index'e karşılık gelen sayfayı gösterir
      body: Center(
        // Tema kontrolü için Center'da tutmak yerine doğrudan döndürüyoruz.
        child: _pages.elementAt(_selectedIndex),
      ),

      // BOTTOM NAVIGATION BAR: NavBar widget'ını kullanıyoruz
      bottomNavigationBar:NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Tıklama fonksiyonunu iletiyoruz
      ),
    );
  }

  // --- HOME SAYFASININ TÜM DETAYLI İÇERİĞİ İÇİN METOT ---
  Widget _buildHomePageContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        // Home sayfasının tüm içeriği (Column)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Karşılama Alanı
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
              style: TextStyle(fontSize: 41),
            ),
            SizedBox(height: 24),

            // Daily Streak Kartı
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
                  Text("Daily Streak 🔥", style: TextStyle(fontSize: 16, color: AppColors.lightText, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text("13", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.darkText)),
                ],
              ),
            ),
            SizedBox(height: 24),

            // ARAMA ÇUBUĞU (TextField)
            TextField(
              decoration: InputDecoration(
                hintText: "Search terms...",
                hintStyle: TextStyle(color: AppColors.lightText, fontWeight: FontWeight.w500),
                prefixIcon: Icon(Icons.search, color: AppColors.lightText, fontWeight: FontWeight.w500),
                filled: true,
                fillColor: AppColors.cardBackground,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 24),

            // Resume Learning Kartı (Geri Kalan İçerik)
            Expanded(
              // İçeriğin taşma ihtimaline karşı SingleChildScrollView ile sarıyoruz.
              child: SingleChildScrollView( 
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2E2B3C), Color(0xFFF9881F)],
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
                            Text("Resume Learning", style: TextStyle(color: AppColors.lightText, fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("JavaScript ES6", style: TextStyle(fontSize: 21, color: AppColors.darkText, fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: 0.35,
                              backgroundColor: Colors.grey.shade200,
                              color: Colors.orange,
                              minHeight: 11,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            SizedBox(height: 9),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text("15/42 complete", style: TextStyle(color: AppColors.lightText, fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 224, 138, 8),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                ),
                                child: const Text("Continue", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}