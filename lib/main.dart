import 'package:flutter/material.dart';
import '  screens/TravelAzkarPage.dart';
import '  screens/after_prayer_azkar_page.dart';
import '  screens/evening_azkar_page.dart';
import '  screens/forgiveness_page.dart';
import '  screens/morning_azkar_page.dart';
import '  screens/sleep_azkar_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,





      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تطبيق الأذكار',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق الأذكار'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green.shade50,
      body: GridView.count(
        crossAxisCount: 3, // ثلاث مربعات في الصف
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildAzkarButton(context, 'الصباح', Icons.wb_sunny, const MorningAzkarPage()),
          _buildAzkarButton(context, 'المساء', Icons.nightlight_round, const EveningAzkarPage()),
          _buildAzkarButton(context, 'النوم', Icons.bed, const SleepAzkarPage()),
          _buildAzkarButton(context, 'بعد الصلاة', Icons.access_time, const AfterPrayerAzkarPage()),
          _buildAzkarButton(context, 'السفر', Icons.airplanemode_active, const TravelAzkarPage()),
          _buildForgivenessButton(context),
        ],
      ),
    );
  }

  // دالة زر الأذكار
  Widget _buildAzkarButton(BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green.shade200,
              radius: 20, // صغرنا حجم الدائرة
              child: Icon(icon, color: Colors.white, size: 15), // صغرنا حجم الأيقونة
            ),
            const SizedBox(height: 1),
            Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), // صغرنا الخط
          ],
        ),
      ),
    );
  }

  // زر الاستغفار
  Widget _buildForgivenessButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgivenessPage()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.mosque, color: Colors.green, size: 20),
            ),
            const SizedBox(height: 5),
            const Text('استغفار', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
