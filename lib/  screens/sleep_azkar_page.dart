import 'package:flutter/material.dart';

class SleepAzkarPage extends StatefulWidget {
  const SleepAzkarPage({super.key});

  @override
  State<SleepAzkarPage> createState() => _SleepAzkarPageState();
}

class _SleepAzkarPageState extends State<SleepAzkarPage> {
  final List<String> sleepAzkar = [
    'باسمك اللهم أموت وأحيا',
    'اللهم قني عذابك يوم تبعث عبادك',
    'اللهم اغفر لي ذنبي، ووسّع لي في قبري، واغسلني من خطاياي بالماء والثلج والبرد',
    'اللهم إني أسألك العافية في الدنيا والآخرة',
  ];

  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    counters = List.filled(sleepAzkar.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'أذكار النوم',
            style: TextStyle(fontSize: 22),
          ),
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView.builder(
          itemCount: sleepAzkar.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.green.shade100,
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
