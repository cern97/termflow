import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  // Tıklanınca çalışacak fonksiyonu dışarıdan alıyoruz.
  final Function(int) onItemTapped;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Navigasyon çubuğunu aşağıdan ve kenarlardan uzaklaştıran tasarım (Floating Bar)
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 19),
      padding: const EdgeInsets.all(11),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_rounded, "Home"),
          _buildNavItem(1, Icons.book_rounded, "Library"),
          _buildNavItem(2, Icons.person_rounded, "Profile"),
        ],
      ),
    );
  }

  // Her bir navigasyon butonunu oluşturan yardımcı metot
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        // Tıklama olayını ana ekrana iletiyoruz
        onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.orange : Colors.grey,
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