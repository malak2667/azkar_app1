import 'package:flutter/material.dart';

import '  screens/after_prayer_azkar_page.dart';
import '  screens/evening_azkar_page.dart';
import '  screens/morning_azkar_page.dart';
import '  screens/sleep_azkar_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality( //
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
        backgroundColor: Colors.green,
        title: const Text(
          'تطبيق الأذكار',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true, //
      ),
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, 'أذكار الصباح', const MorningAzkarPage()),
            const SizedBox(height: 20),
            buildButton(context, 'أذكار المساء', const EveningAzkarPage()),
            const SizedBox(height: 20),
            buildButton(context, 'أذكار النوم', const SleepAzkarPage()),
            const SizedBox(height: 20),
            buildButton(context, 'أذكار بعد الصلاة', const AfterPrayerAzkarPage()),

          ],
        ),
      ),
    );
  }

  // دالة تصميم زر
  Widget buildButton(BuildContext context, String text, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 22),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
