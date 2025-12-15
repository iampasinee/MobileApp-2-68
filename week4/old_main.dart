import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Myapp",
      debugShowCheckedModeBanner: true,
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
  int num = 0;
  String num1 = "";
  String num2 = "";
  String operater = "";
  String showVal = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.deepPurple[300]!,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              // SHOW display
              child: Text(
                showVal.toString(),
                style: TextStyle(fontSize: 35, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "7";
                        showVal = num1;
                      } else {
                        num2 += "7";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('7', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "8";
                        showVal = num1;
                      } else {
                        num2 += "8";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('8', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "9";
                        showVal = num1;
                      } else {
                        num2 += "9";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('9', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "+";
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "4";
                        showVal = num1;
                      } else {
                        num2 += "4";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('4', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "5";
                        showVal = num1;
                      } else {
                        num2 += "5";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('5', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "6";
                        showVal = num1;
                      } else {
                        num2 += "6";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('6', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "-";
                    });
                  },
                  child: Text('-', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "1";
                        showVal = num1;
                      } else {
                        num2 += "1";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('1', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "2";
                        showVal = num1;
                      } else {
                        num2 += "2";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('2', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        num1 += "3";
                        showVal = num1;
                      } else {
                        num2 += "3";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text('3', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "*";
                    });
                  },
                  child: Text('*', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        if (num1 != "") {
                          num1 += "0";
                          showVal = num1;
                        }
                      } else {
                        if (num2 != "") {
                          num2 += "0";
                          showVal = num2;
                        }
                      }
                    });
                  },
                  child: Text('0', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      num = 0;
                      num1 = "";
                      num2 = "";
                      operater = "";
                      showVal = "0";
                    });
                  },
                  backgroundColor: Colors.deepPurple[700],
                  child: Text(
                    'C',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num1 == "" || num2 == "") return;

                      double newNum1 = double.parse(num1);
                      double newNum2 = double.parse(num2);
                      double result = 0;

                      if (operater == "+") result = newNum1 + newNum2;
                      if (operater == "-") result = newNum1 - newNum2;
                      if (operater == "*") result = newNum1 * newNum2;
                      if (operater == "/") result = newNum1 / newNum2;
                      if (operater == "%") result = (newNum1 / 100) * newNum2;

                      if (operater == "^") {
                        result = newNum1;
                        for (int i = 1; i < newNum2; i++) {
                          result = result * newNum1;
                        }
                      }
                      showVal = result.toString();
                      num1 = result.toString();
                      num2 = "";
                      operater = "";
                    });
                  },
                  child: Text('=', style: TextStyle(fontSize: 20)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "/";
                    });
                  },
                  child: Text('/', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operater.isEmpty) {
                        if (num1 != "" && num1.length > 1) {
                          num1 = num1.substring(0, num1.length - 1);
                          showVal = num1;
                        } else {
                          num1 = "";
                          showVal = "0";
                        }
                      } else {
                        if (num2 != "" && num2.length > 1) {
                          num2 = num2.substring(0, num2.length - 1);
                          showVal = num2;
                        } else {
                          num2 = "";
                          showVal = "0";
                        }
                      }
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: Text(
                    'DEL',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "%";
                    });
                  },
                  backgroundColor: Colors.red,
                  child: Text(
                    '%',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "^";
                    });
                  },
                  backgroundColor: Colors.red,
                  child: Text(
                    '^',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operater = "√";
                      double newNum1 = double.parse(num1);
                      double result = 0;
                      result = sqrt(newNum1);

                      num1 = result.toString();
                      showVal = result.toString();
                      num2 = "";
                      operater = "";
                    });
                  },
                  backgroundColor: Colors.red,
                  child: Text(
                    '√',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
