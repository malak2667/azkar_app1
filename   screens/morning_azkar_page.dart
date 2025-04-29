import 'package:flutter/material.dart';

class MorningAzkarPage extends StatefulWidget {
  const MorningAzkarPage({super.key});

  @override
  State<MorningAzkarPage> createState() => _MorningAzkarPageState();
}

class _MorningAzkarPageState extends State<MorningAzkarPage> {
  final List<String> morningAzkar = [
    'اللهم بك أصبحنا وبك أمسينا، وبك نحيا وبك نموت وإليك المصير',
    'أصبحنا على فطرة الإسلام، وكلمة الإخلاص، ودين نبينا محمد صلى الله عليه وسلم',
    'اللهم إني أسالك العافية في الدنيا والآخرة',
    'اللهم اجعلنا من أهل الذكر والشكر والطاعة',
  ];

  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    counters = List.filled(morningAzkar.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'أذكار الصباح',
            style: TextStyle(fontSize: 22),
          ),
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView.builder(
          itemCount: morningAzkar.length,
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
                      morningAzkar[index],
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
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        ' (${counters[index]})',
                        style: const TextStyle(fontSize: 18),
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
