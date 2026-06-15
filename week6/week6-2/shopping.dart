import 'package:flutter/material.dart';
import 'form.dart';

class formShopping extends StatelessWidget {
  const formShopping({
    super.key,
    required this.productName,
    required this.productDes,
  });
  //formShopping({Key? key, required this.productName}) : super(key: key);

  final String productName;
  final String productDes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping Screen')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_outlined, size: 50),
              title: Text(
                productName,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              subtitle: Text(productDes, style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
