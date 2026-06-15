import 'package:flutter/material.dart';
import 'dart:math';

class LotteryResult extends StatelessWidget {
  const LotteryResult({
    super.key,
    required this.Number_lot,
    required this.Price_buy,
  });

  final String Number_lot;
  final String Price_buy;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int ranNum1 = random.nextInt(10);
    int ranNum2 = random.nextInt(10);
    int ranNum3 = random.nextInt(10);
    double amount = double.parse(Price_buy) * 100;
    final String total = amount.toString();

    String Numresult = "";
    Numresult += ranNum3.toString() + ranNum2.toString() + ranNum1.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LOTTERY N3',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "เลขที่คุณซื้อ คือ ${Number_lot}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "จำนวนเงินที่คุณซื้อ คือ ${Price_buy} บาท",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "* เลขที่ออก คือ ${Numresult} ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 10),
            if (Numresult == Number_lot) ...[
              Row(
                children: [
                  Text(
                    "* ยินดีด้วยคุณถูกรางวัล ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green[800],
                    size: 40,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "* รับเงินรางวัล ${total} บาท ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
            ] // if
            else ...[
              Row(
                children: [
                  Text(
                    "* เสียใจด้วยคุณไม่ถูกรางวัล ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  ),
                  Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red[800],
                    size: 40,
                  ),
                ],
              ),
            ], // else
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0.0),
                  fixedSize: Size(300, 50),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 7,
                  shadowColor: Colors.blue,
                  side: BorderSide(color: Colors.blue[800]!, width: 1),
                  shape: StadiumBorder(),
                ),
                child: Text("กลับหน้าหลัก"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
