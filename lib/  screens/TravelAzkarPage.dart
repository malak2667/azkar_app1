import 'package:flutter/material.dart';

class TravelAzkarPage extends StatefulWidget {
  const TravelAzkarPage({super.key});

  @override
  State<TravelAzkarPage> createState() => _TravelAzkarPageState();
}

class _TravelAzkarPageState extends State<TravelAzkarPage> {
  List<int> counters = List.generate(10, (index) => 0); // 10 أذكار

  List<String> azkarList = [
    'اللَّهُمَّ إنَّا نسألُك في سفرِنا هذا البرَّ والتقوى ومن العملِ ما ترضى',
    'اللَّهُمَّ هوِّن علينا سفرَنا هذا واطوِ عنَّا بُعدَه',
    'اللَّهُمَّ أنت الصاحبُ في السفرِ والخليفةُ في الأهلِ',
    'أعوذُ بكلماتِ اللهِ التامَّاتِ من شرِّ ما خلق',
    'سبحان الذي سخر لنا هذا وما كنا له مقرنين',
    'وإنا إلى ربنا لمنقلبون',
    'اللَّه أكبر، اللَّه أكبر، اللَّه أكبر',
    'اللَّهُمَّ اجعل لنا في سفرِنا هذا نصيبًا من الخيرِ والرحمةِ',
    'اللَّهُمَّ احفظنا في طريقِنا وبارك لنا في رحلتِنا',
    'اللَّهُمَّ إنا نعوذُ بك من وعثاءِ السفرِ وكآبةِ المنظرِ وسوءِ المنقلبِ في المالِ والأهلِ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أذكار السفر'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green.shade50,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: azkarList.length,
        itemBuilder: (context, index) {
          return buildZikrCard(index, azkarList[index]);
        },
      ),
    );
  }

  Widget buildZikrCard(int index, String zikrText) {
    return Card(
      color: Colors.green.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              zikrText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'التكرار: ${counters[index]}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counters[index]++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('تكرار'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counters[index] = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                  ),
                  child: const Text('تصفير'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
