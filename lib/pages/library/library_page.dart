import 'package:flutter/material.dart';
// Kendi tema dosyanızı import ettiğinizi varsayıyorum
import 'package:termflow/core/theme/app_colors.dart'; 

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
// BÖLÜM 2: ANA EKRAN WIDGET'I (ListView.builder Mekanizması) - GÜNCELLENMİŞ
// =========================================================

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // AppBar: Başlık Çubuğu - Hizalama ve Kalınlık İçin Düzenlendi
      appBar: AppBar(
        // 1. leadingWidth: 0 ve leading: SizedBox.shrink() ile 
        //    başlığın soldan boşluğu (genellikle 20 birim) sıfırlanır.
        leadingWidth: 0, 
        leading: const SizedBox.shrink(), 

        // 2. Başlık (title) widget'ına soldan 25 birim boşluk veriyoruz
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40, 20.0, 25.0),  // 25 birim soldan boşluk
          child: Text(
            'Library',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black, 
              fontWeight: FontWeight.w900, // ÇOK DAHA KALIN YAPILDI
              fontSize: 33, 
            ),
          ),
        ),
        
        backgroundColor: Colors.transparent, 
        elevation: 0, 
        toolbarHeight: 70, // Başlık altı boşluğunu artırmak için
      ),

      // Body: Liste İçeriği - Hizalama İçin Padding Güncellendi
      body: SafeArea(
        child: ListView.builder(
          // 25 birimlik hizalama ve genel padding'i doğrudan ListView'a veriyoruz.
          // fromLTRB: Sol (25), Üst (0), Sağ (25), Alt (25)
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
// BÖLÜM 3: TEKRAR KULLANILABİLİR LİSTE ÖĞESİ (Kart Tasarımı)
// =========================================================

Widget _buildListItem(BuildContext context, LibraryItem item) {
  // Liste öğeleri (kartlar) zaten ListView.builder'ın padding'i içinde hizalanacak.
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Card(
      color:AppColors.cardBackground,
      elevation: 0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        
        // 1. Sol Kısım (leading): İkon ve Container
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
        
        // 2. Orta Kısım: Başlık ve Terim Sayısı
        title: Text(
          item.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${item.termCount} Terms',
          style: const TextStyle(color: AppColors.lightText),
        ),
        
        // 3. Sağ Kısım: İleri Ok Simgesi
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 16,
        ),
        
        // 4. Tıklama İşlemi
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${item.title} sayfasına gidiliyor...')),
          );
        },
      ),
    ),
  );
}