import 'package:flutter/material.dart';
import 'inputForm.dart';

class formShopping extends StatelessWidget {
  const formShopping({
    super.key,
    required this.productName,
    required this.customerName,
  });
  //formShopping({Key? key, required this.productName}) : super(key: key);

  final String productName;
  final String customerName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.apple_outlined, size: 50),
              title: Text(
                productName,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              subtitle: Text(customerName, style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
