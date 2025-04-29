import 'package:flutter/material.dart';

class Azkar {
  final String content;
  final int repeatCount;
  int currentCount;

  Azkar({
    required this.content,
    required this.repeatCount,
    this.currentCount = 0,
  });
}

class EveningAzkarPage extends StatefulWidget {
  const EveningAzkarPage({super.key});

  @override
  State<EveningAzkarPage> createState() => _EveningAzkarPageState();
}

class _EveningAzkarPageState extends State<EveningAzkarPage> {
  List<Azkar> eveningAzkar = [
    Azkar(content: 'أمسينا وأمسى الملك لله والحمد لله...', repeatCount: 10),
    Azkar(content: 'رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد ﷺ نبيًا.', repeatCount: 10),
    Azkar(content: 'اللهم أنت ربي لا إله إلا أنت، خلقتني وأنا عبدك...', repeatCount: 10),
    Azkar(content: 'اللهم إني أمسيت أشهدك وأشهد حملة عرشك...', repeatCount: 10),
    Azkar(content: 'بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء...', repeatCount: 3),
    Azkar(content: 'سبحان الله وبحمده.', repeatCount: 100),
  ];

  void incrementCount(int index) {
    setState(() {
      if (eveningAzkar[index].currentCount < eveningAzkar[index].repeatCount) {
        eveningAzkar[index].currentCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أذكار المساء'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green.shade50,
      body: ListView.builder(
        itemCount: eveningAzkar.length,
        itemBuilder: (context, index) {
          final azkar = eveningAzkar[index];
          return Card(
            margin: const EdgeInsets.all(12),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    azkar.content,
                    style: const TextStyle(fontSize: 20, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    ),
                    onPressed: () => incrementCount(index),
                    child: Text(
                      'عدد التكرار: ${azkar.currentCount}/${azkar.repeatCount}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
