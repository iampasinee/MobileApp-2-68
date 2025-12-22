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
      debugShowCheckedModeBanner: false,
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
    foodMenu("ต้มยำกุ้ง", "120", "ต้ม", "assets/images/m11.jpg"),
    foodMenu("ต้มจืดเต้าหู้", "70", "ต้ม", "assets/images/m12.jpg"),
    foodMenu("แกงเขียวหวานไก่", "70", "ต้ม", "assets/images/m13.jpg"),
    foodMenu("ต้มข่าไก่", "70", "ต้ม", "assets/images/m14.jpg"),
    foodMenu("กุ้งเผา", "120", "ย่าง-เผา", "assets/images/m21.jpg"),
    foodMenu("บาร์บีคิว", "80", "ย่าง-เผา", "assets/images/m22.jpg"),
    foodMenu("ลูกชิ้นย่าง", "40", "ย่าง-เผา", "assets/images/m23.jpg"),
    foodMenu("หมูย่าง", "50", "ย่าง-เผา", "assets/images/m24.jpg"),
    foodMenu("ปลาเผา", "150", "ย่าง-เผา", "assets/images/m25.jpg"),
    foodMenu("หมูทอด", "70", "ทอด", "assets/images/m31.jpg"),
    foodMenu("ปลาทอด", "120", "ทอด", "assets/images/m33.jpg"),
    foodMenu("ปีกไก่ทอด", "70", "ทอด", "assets/images/m34.jpg"),
    foodMenu("ปอเปี๊ยะทอด", "70", "ทอด", "assets/images/m35.jpg"),
    foodMenu("ผัดไท", "70", "ผัด", "assets/images/m41.jpg"),
    foodMenu("ข้าวผัดกระเพรา", "70", "ผัด", "assets/images/m42.jpg"),
    foodMenu("ผัดคะน้าหมูกรอบ", "70", "ผัด", "assets/images/m43.jpg"),
    foodMenu("ข้าวผัดฉ่าทะเล", "70", "ผัด", "assets/images/m44.jpg"),
    foodMenu("บัวลอย", "40", "ของหวาน", "assets/images/m61.jpg"),
    foodMenu("ตะโก้", "30", "ของหวาน", "assets/images/m62.jpg"),
    foodMenu("ข้าวเหนียวมะม่วง", "60", "ของหวาน", "assets/images/m63.jpg"),
  ];

  int o_num = 0;
  int sum = 0;

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
            leading: Image.asset(
              food.img,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
            title: Text("${food.f_name}", style: TextStyle(fontSize: 18)),
            subtitle: Text("ราคา ${food.price} บาท \n ประเภท ${food.type}"),
            onTap: () {
              o_num++;
              sum += int.parse(food.price);
              AlertDialog alert = AlertDialog(
                title: Text(
                  "คุณเลือกเมนู : ${food.f_name}",
                  style: TextStyle(fontSize: 20),
                ),
                content: Row(
                  children: [
                    Text(
                      "คุณเลือกเมนูแล้ว ${o_num} จาน \nราคาทั้งหมด ${sum} บาท",
                      maxLines: 3,
                    ),
                  ],
                ),
                shape: LinearBorder(),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
    );
  }
}
