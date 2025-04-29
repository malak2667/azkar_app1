import 'package:flutter/material.dart';

class SleepAzkarPage extends StatefulWidget {
  const SleepAzkarPage({super.key});

  @override
  State<SleepAzkarPage> createState() => _SleepAzkarPageState();
}

class _SleepAzkarPageState extends State<SleepAzkarPage> {
  final List<String> sleepAzkar = [
    'باسمك ربي وضعت جنبي وبك أرفعه، إن أمسكت نفسي فارحمها، وإن أرسلتها فاحفظها بما تحفظ به عبادك الصالحين.',
    'اللهم قني عذابك يوم تبعث عبادك.',
    'اللهم باسمك أموت وأحيا.',
    'اللهم إني أسلمت نفسي إليك، ووجهت وجهي إليك...',
    'سبحان الله (33)، الحمد لله (33)، الله أكبر (34).',
    'آية الكرسي: الله لا إله إلا هو الحي القيوم...'
  ];

  // قائمة التكرارات
  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    counters = List.filled(sleepAzkar.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أذكار النوم'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green.shade50,
      body: ListView.builder(
        itemCount: sleepAzkar.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    sleepAzkar[index],
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: counters[index] < 10
                        ? () {
                      setState(() {
                        counters[index]++;
                      });
                    }
                        : null, // يعطل الزر بعد 10
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'تكرار (${counters[index]})',
                      style: const TextStyle(fontSize: 18),
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
