import 'package:flutter/material.dart';
import 'MoneyBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class InputNew extends StatelessWidget {
  const InputNew({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Account Name',
        labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
          final Color color = states.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.orange;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Enter your name';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Container App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
              height: 120,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: InputNew()),
            ),
            Moneybox("ยอดเงินคงเหลือ", 30000.050, 130, 20, Colors.blue[900]!),
            Moneybox("รายรับ", 10000.90, 100, 20, Colors.green),
            Moneybox("รายจ่าย", 8000.56, 100, 20, Colors.red),
            Moneybox("ค้างจ่าย", 4000.12, 100, 20, Colors.yellow[800]!),
            SizedBox(height: 10),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
