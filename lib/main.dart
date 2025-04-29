import 'package:flutter/material.dart';
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
        crossAxisCount: 3,  // زيادة عدد الأعمدة إلى 3 لتصغير الأزرار
        crossAxisSpacing: 10.0,  // تقليص المسافة بين الأعمدة
        mainAxisSpacing: 10.0,   // تقليص المسافة بين الصفوف
        padding: const EdgeInsets.all(10.0),  // تقليص المسافات داخل الحواف
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
            radius: 20, // تقليص حجم الدائرة
            child: Icon(icon, color: Colors.white, size: 20), // تقليص حجم الأيقونة
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // تقليص الخط
            textAlign: TextAlign.center,
          ),
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
            width: 50, // تقليص حجم الدائرة
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green, // تغيير اللون الداخلي إلى الأخضر
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Center(
              child: Icon(
                Icons.ring_volume, // رمز خاتم الاستغفار
                color: Colors.white, // تغيير اللون إلى الأبيض داخل الدائرة
                size: 25, // تقليص حجم الأيقونة
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'استغفار',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // تقليص الخط
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
