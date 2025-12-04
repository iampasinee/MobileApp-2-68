import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(
    String btntxt,
    Color btncolor,
    Color txtcolor,
    Function callOnPressed,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: AspectRatio(
          aspectRatio: 1.1,
          child: ElevatedButton(
            onPressed: () {
              callOnPressed(btntxt);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: btncolor,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              btntxt,
              style: TextStyle(fontSize: 30, color: txtcolor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // show display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 90),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // show button
                calcbutton('AC', Colors.grey, Colors.black, () {}),
                calcbutton('+/-', Colors.grey, Colors.black, () {}),
                calcbutton('%', Colors.grey, Colors.black, () {}),
                calcbutton('/', Colors.amber[700]!, Colors.white, () {}),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('8', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('9', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('X', Colors.amber[700]!, Colors.white, () {}),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('5', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('6', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('-', Colors.amber[700]!, Colors.white, () {}),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('3', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('2', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('1', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('+', Colors.amber[700]!, Colors.white, () {}),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.grey[850]!,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                calcbutton('.', Colors.grey[850]!, Colors.white, () {}),
                calcbutton('=', Colors.amber[700]!, Colors.white, () {}),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
