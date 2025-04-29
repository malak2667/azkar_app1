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
        backgroundColor: Colors.green, // تغيير اللون إلى الأخضر
      ),
      backgroundColor: Colors.green.shade50, // تغيير اللون إلى الأخضر
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          // زر أذكار الصباح
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MorningAzkarPage()));
            },
            child: _buildAzkarBox('أذكار الصباح', Icons.wb_sunny),
          ),
          // زر أذكار المساء
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EveningAzkarPage()));
            },
            child: _buildAzkarBox('أذكار المساء', Icons.nightlight_round),
          ),
          // زر أذكار النوم
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepAzkarPage()));
            },
            child: _buildAzkarBox('أذكار النوم', Icons.bed),
          ),
          // زر أذكار بعد الصلاة
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AfterPrayerAzkarPage()));
            },
            child: _buildAzkarBox('أذكار بعد الصلاة', Icons.access_time),
          ),
          // زر الاستغفار مع الخاتم
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgivenessPage())); // فتح صفحة الاستغفار
            },
            child: _buildForgivenessBox(),
          ),
          // زر أذكار السفر
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TravelAzkarPage())); // فتح صفحة أذكار السفر
            },
            child: _buildAzkarBox('أذكار السفر', Icons.directions_bus),
          ),
        ],
      ),
    );
  }

  Widget _buildAzkarBox(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade100, // تغيير اللون إلى الأخضر الفاتح
        borderRadius: BorderRadius.circular(12), // تقليص الزوايا
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade200, // تغيير اللون إلى الأخضر الفاتح
            radius: 25, // تقليص حجم الدائرة
            child: Icon(icon, color: Colors.white, size: 25), // تقليص حجم الأيقونة
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // تقليص الخط
        ],
      ),
    );
  }

  // دالة لإنشاء مربع الاستغفار مع الخاتم
  Widget _buildForgivenessBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade100, // تغيير اللون إلى الأخضر الفاتح
        borderRadius: BorderRadius.circular(12), // تقليص الزوايا
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70, // تقليص حجم الدائرة
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 4),
            ),
            child: Center(
              child: Icon(
                Icons.ring_volume, // رمز خاتم الاستغفار
                color: Colors.green,
                size: 30, // تقليص حجم الأيقونة
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('استغفار', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // تقليص الخط
        ],
      ),
    );
  }
}
