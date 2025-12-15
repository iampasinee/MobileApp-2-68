import 'package:flutter/material.dart';
import 'foodMenu.dart';

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
      home: const MyHomePage(title: 'Food Menu '),
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
  List<foodMenu> menu = [
    foodMenu("กุ้งเผา", "500"),
    foodMenu("กระเพราหมู", "80"),
    foodMenu("กระเพราหมู", "80"),
    foodMenu("กระเพราหมู", "80"),
    foodMenu("ข้าวมันไก่", "40"),
  ];

  List<Widget> getdata(int count) {
    List<Widget> data = [];

    data.add(
      Text("click button to add number", style: TextStyle(fontSize: 15)),
    );

    for (int i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "เมนูที่ $i",
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        subtitle: Text("ชื่ออาหารที่ $i"),
      );
      data.add(menu);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodMenu food = menu[index];
          return ListTile(
            title: Text("เมนูที่ ${index + 1}"),
            subtitle: Text("${food.f_name} ราคา ${food.price} บาท"),
          );
        },
      ),
    );
  }
}
