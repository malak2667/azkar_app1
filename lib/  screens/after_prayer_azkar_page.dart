import 'package:flutter/material.dart';

class AfterPrayerAzkarPage extends StatefulWidget {
  const AfterPrayerAzkarPage({super.key});

  @override
  State<AfterPrayerAzkarPage> createState() => _AfterPrayerAzkarPageState();
}

class _AfterPrayerAzkarPageState extends State<AfterPrayerAzkarPage> {
  final List<String> prayerAzkar = [
    'استغفر الله (3 مرات)',
    'اللهم أنت السلام ومنك السلام تباركت يا ذا الجلال والإكرام',
    'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير',
    'اللهم أعني على ذكرك وشكرك وحسن عبادتك',
  ];

  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    counters = List.filled(prayerAzkar.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'أذكار بعد الصلاة',
            style: TextStyle(fontSize: 22),
          ),
        ),
        backgroundColor: Colors.green.shade50,
        body: ListView.builder(
          itemCount: prayerAzkar.length,
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
                      prayerAzkar[index],
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
