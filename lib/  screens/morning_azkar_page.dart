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

class MorningAzkarPage extends StatefulWidget {
  const MorningAzkarPage({super.key});

  @override
  State<MorningAzkarPage> createState() => _MorningAzkarPageState();
}

class _MorningAzkarPageState extends State<MorningAzkarPage> {
  List<Azkar> morningAzkar = [
    Azkar(content: 'أصبحنا وأصبح الملك لله والحمد لله...', repeatCount: 10),
    Azkar(content: 'رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد ﷺ نبيًا.', repeatCount: 10),
    Azkar(content: 'اللهم أنت ربي لا إله إلا أنت، خلقتني وأنا عبدك...', repeatCount: 10),
    Azkar(content: 'اللهم إني أصبحت أشهدك وأشهد حملة عرشك...', repeatCount: 10),
    Azkar(content: 'بسم الله الذي لا يضر مع اسمه شيء في الأرض ولا في السماء...', repeatCount: 3),
    Azkar(content: 'رضيت بالله ربًا وبالإسلام دينًا وبمحمد ﷺ نبيًا ورسولًا.', repeatCount: 3),
    Azkar(content: 'سبحان الله وبحمده.', repeatCount: 100),
  ];

  void incrementCount(int index) {
    setState(() {
      if (morningAzkar[index].currentCount < morningAzkar[index].repeatCount) {
        morningAzkar[index].currentCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('أذكار الصباح'),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView.builder(
          itemCount: morningAzkar.length,
          itemBuilder: (context, index) {
            final azkar = morningAzkar[index];
            return Card(
              margin: const EdgeInsets.all(12),
              color: Colors.green.shade100,
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
      ),
    );
  }
}
