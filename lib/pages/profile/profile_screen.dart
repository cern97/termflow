import 'package:flutter/material.dart';
import 'package:termflow/core/theme/app_colors.dart';
import 'package:termflow/pages/profile/knows_terms.dart';
import 'package:termflow/pages/profile/unkowns_terms.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Poppins', 
            fontWeight: FontWeight.bold, 
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // 1. PROFİL FOTOĞRAFI
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              const SizedBox(height: 13),
              
              // 2. İSİM VE MAİL
              const Text(
                "XYZ Developer",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "xyz.dev@example.com",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.lightText, 
                  fontSize: 14
                ),
              ),
              const SizedBox(height: 20),

              // 3. İSTATİSTİK KARTLARI
              Row(
                children: [
                  Expanded(child: _buildStatCard("128", "Terms Learned")),
                  const SizedBox(width: 16),
                  Expanded(child: _buildStatCard("21", "Streak (Days)")),
                ],
              ),
              const SizedBox(height: 11),

              // 4. MASTERY KART
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    Text(
                      "85%",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Mastery",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.lightText, 
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 5. MENÜLER (Tıklanabilir)
              _buildMenuOption(
                context: context,
                icon: Icons.check_circle_outline,
                iconColor: AppColors.primaryOrange,
                title: "Known Terminology",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KnownTermsPage()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildMenuOption(
                context: context,
                icon: Icons.help_outline,
                iconColor: AppColors.primaryOrange,
                title: "Unknown Terminology",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UnknownTermsPage()),
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildMenuOption(
                context: context,
                icon: Icons.settings_outlined,
                iconColor: Colors.grey,
                title: "Settings",
                onTap: () {
                  // Settings sayfası buraya eklenebilir
                },
              ),

              const SizedBox(height: 30),

              // 6. ÇIKIŞ BUTONU
              GestureDetector(
                onTap: () {
                  // Çıkış işlemi buraya
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100), 
            ],
          ),
        ),
      ),
    );
  }

  // YARDIMCI METOTLAR
  Widget _buildStatCard(String count, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.lightText, 
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}