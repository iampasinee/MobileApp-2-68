import 'package:flutter/material.dart';

void main() {
  runApp(MyST());
}

class MyST extends StatelessWidget {
  const MyST({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NEW CAL",
      debugShowCheckedModeBanner: true,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String num1 = "";
  String num2 = "";
  String op = "";
  String display = "0";

  Widget calcBtn(String txt, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Text(txt, maxLines: 3, style: TextStyle(fontSize: 22)),
      ),
    );
  }

  void pressNum(String val) {
    setState(() {
      if (op.isEmpty) {
        if (num1 == "" && val == "0") {
          display = "0";
        } else {
          num1 += val;
          display = num1;
        }
      } else {
        if (num2 == "" && val == "0") {
          display = "0";
        } else {
          num2 += val;
          display = num2;
        }
      }
    });
  }

  void onoperator(String oper) {
    setState(() {
      op = oper;
    });
  }

  void clear() {
    setState(() {
      num1 = "";
      num2 = "";
      op = "";
      display = "0";
    });
  }

  void calculate() {
    if (num1.isEmpty || num2.isEmpty || op.isEmpty) return;
    double n1 = double.parse(num1);
    double n2 = double.parse(num2);
    double result = 0;

    switch (op) {
      case "+":
        result = n1 + n2;
        break;
      case "-":
        result = n1 - n2;
        break;
      case "*":
        result = n1 * n2;
        break;
      case "/":
        result = n1 / n2;
        break;
    }
    setState(() {
      display = result.toString();
      num1 = result.toString();
      num2 = "";
      op = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NEW CAL")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 20),
              child: Text(
                display.toString(),
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("7", () => pressNum("7")),
                calcBtn("8", () => pressNum("8")),
                calcBtn("9", () => pressNum("9")),
                calcBtn("+", () => onoperator("+")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("4", () => pressNum("4")),
                calcBtn("5", () => pressNum("5")),
                calcBtn("6", () => pressNum("6")),
                calcBtn("-", () => onoperator("-")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("1", () => pressNum("1")),
                calcBtn("2", () => pressNum("2")),
                calcBtn("3", () => pressNum("3")),
                calcBtn("*", () => onoperator("*")),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("0", () => pressNum("0")),
                calcBtn("C", () => clear()),
                calcBtn("=", () => calculate()),
                calcBtn("/", () => onoperator("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
