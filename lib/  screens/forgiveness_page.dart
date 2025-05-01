import 'package:flutter/material.dart';

void main() {
  runApp(const Directionality(
    textDirection: TextDirection.rtl,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgivenessPage(),
    ),
  ));
}

class ForgivenessPage extends StatefulWidget {
  const ForgivenessPage({super.key});

  @override
  State<ForgivenessPage> createState() => _ForgivenessPageState();
}

class _ForgivenessPageState extends State<ForgivenessPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    double progress = counter / 100;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('استغفار'),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // يرجع للي قبل
          },
        ),
      ),
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'استغفار',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // دائرة العداد
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 6),
                  ),
                  child: Center(
                    child: Text(
                      'استغفر الله',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 6,
                    backgroundColor: Colors.transparent,
                    valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              '$counter / 100',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (counter < 100) {
                    counter++;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'تسبيح',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white70,
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'تصفير',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
