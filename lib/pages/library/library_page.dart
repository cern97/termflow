import 'package:flutter/material.dart';
import 'package:termflow/core/theme/app_colors.dart'; // Tema dosyan
import 'flashcard_view.dart'; // Flashcard sayfasını tanıması için
import 'flashcard_data.dart'; // Verileri (flashcardsData) tanıması için BURASI ÇOK ÖNEMLİ

// =========================================================
// BÖLÜM 1: VERİ YAPISI VE ÖRNEK VERİLER (Model)
// =========================================================

class LibraryItem {
  final String title;
  final int termCount;
  final IconData icon;

  LibraryItem({required this.title, required this.termCount, required this.icon});
}

final List<LibraryItem> libraryItems = [
  LibraryItem(title: 'Data Structures', termCount: 42, icon: Icons.storage),
  LibraryItem(title: 'Algorithms', termCount: 50, icon: Icons.timeline),
  LibraryItem(title: 'Git', termCount: 35, icon: Icons.compare_arrows),
  LibraryItem(title: 'Docker', termCount: 28, icon: Icons.layers),
  LibraryItem(title: 'Kubernetes', termCount: 33, icon: Icons.widgets),
  LibraryItem(title: 'SQL', termCount: 45, icon: Icons.dns),
];

// =========================================================
// BÖLÜM 2: ANA EKRAN WIDGET'I
// =========================================================

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // AppBar Ayarları
      appBar: AppBar(
        leadingWidth: 0, 
        leading: const SizedBox.shrink(), 
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40, 20.0, 25.0),
          child: const Text(
            'Library',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black, 
              fontWeight: FontWeight.w900, 
              fontSize: 33, 
            ),
          ),
        ),
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        toolbarHeight: 70, 
      ),

      // Liste İçeriği
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 25.0), 
          itemCount: libraryItems.length,
          itemBuilder: (context, index) {
            final item = libraryItems[index]; 
            return _buildListItem(context, item); 
          },
        ),
      ),
    );
  }
}

// =========================================================
// BÖLÜM 3: TEKRAR KULLANILABİLİR LİSTE ÖĞESİ
// =========================================================

Widget _buildListItem(BuildContext context, LibraryItem item) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Card(
      color: AppColors.cardBackground,
      elevation: 0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        
        // 1. Sol Kısım (İkon)
        leading: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(51, 255, 155, 6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            item.icon,
            color: AppColors.primaryOrange,
            size: 28,
          ),
        ),
        
        // 2. Orta Kısım (Başlık)
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${item.termCount} Terms',
          style: const TextStyle(color: AppColors.lightText),
        ),
        
        // 3. Sağ Kısım (Ok)
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 16,
        ),
        
        // --- DÜZELTİLEN KISIM BURASI ---
       // library_page.dart dosyasındaki onTap kısmı:
       onTap: () {
          List<Flashcard> selectedCards = flashcardsData[item.title] ?? [];

          Navigator.push(
            context,
            MaterialPageRoute(
              // BURAYI DOLDURMAN LAZIM:
              builder: (context) => FlashcardView(
                topicName: item.title,      
                flashcards: selectedCards,  
              ),
            ),
          );
        },
      ),
    ),
  );
}