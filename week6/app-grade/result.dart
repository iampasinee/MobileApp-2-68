import 'package:flutter/material.dart';
import 'dart:ui';

class MyResult extends StatelessWidget {
  const MyResult({
    super.key,
    required this.fname,
    required this.lname,
    required this.dept,
    required this.subject,
    required this.midterm,
    required this.finalScore,
    required this.classwork,
  });

  final String fname;
  final String lname;
  final String dept;
  final String subject;
  final String midterm;
  final String finalScore;
  final String classwork;
  @override
  Widget build(BuildContext context) {
    double m = double.tryParse(midterm) ?? 0;
    double f = double.tryParse(finalScore) ?? 0;
    double c = double.tryParse(classwork) ?? 0;
    final double total = m + f + c;
    String grade = "";

    if (total >= 80) {
      grade = 'A';
    } else if (total >= 75) {
      grade = 'B+';
    } else if (total >= 70) {
      grade = 'B';
    } else if (total >= 65) {
      grade = 'C+';
    } else if (total >= 60) {
      grade = 'C';
    } else if (total >= 55) {
      grade = 'D+';
    } else if (total >= 50) {
      grade = 'D';
    } else {
      grade = 'F';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('App Grade'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pasinee Kengklang',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('Information and Network Enginerrring ($dept)'),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (total < 50) ...[
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red[700],
                        border: Border.all(color: Colors.red[700]!),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'F',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ] else ...[
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        border: Border.all(color: Colors.green[700]!),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        grade.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],

                  SizedBox(height: 10),
                  Text(
                    '$subject',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bar_chart_sharp, size: 20),
                      SizedBox(width: 2),
                      Text(
                        'Score Total : $total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Divider(color: Colors.green[200]),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.quiz_sharp, size: 20),
                      SizedBox(width: 2),
                      Text(
                        "Midterm : $midterm",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.quiz_sharp, size: 20),
                      SizedBox(width: 2),
                      Text(
                        "Final : $finalScore",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.inventory_2_sharp, size: 20),
                      SizedBox(width: 2),
                      Text(
                        "Classwork : $classwork",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(horizontal: 10),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                elevation: 5,
              ),
              child: Text('Back to Form', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
