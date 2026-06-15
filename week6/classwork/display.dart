import 'package:flutter/material.dart';

class MyDisplay extends StatelessWidget {
  const MyDisplay({super.key, required this.Number});

  final String Number;
  @override
  Widget build(BuildContext context) {
    double total = double.parse(Number);
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
        backgroundColor: Colors.yellow[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                'ตัวเลขที่กรอกคือ : $Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              if (total % 2 == 0) ...[
                Text('เป็นเลขคู่', style: TextStyle(fontSize: 18)),
                Image.asset('assets/images/pic2.jpg', width: 200),
              ] else ...[
                Text('เป็นเลขคี่', style: TextStyle(fontSize: 18)),
                Image.asset('assets/images/pic1.jpg', width: 200),
              ],
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[800],
                  foregroundColor: Colors.white,
                ),
                child: Text('Back', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
