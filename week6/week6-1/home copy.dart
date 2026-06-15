import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int ranNum = random.nextInt(10);
    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('ELEVATED BUTTON'),
                    style: ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('OUTLINED BUTTON'),
                    style: OutlinedButton.styleFrom(fixedSize: Size(200, 50)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('TEXT BUTTON'),
                    style: TextButton.styleFrom(fixedSize: Size(200, 50)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
