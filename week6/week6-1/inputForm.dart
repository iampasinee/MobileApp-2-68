import 'package:flutter/material.dart';
import 'shopping.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  var _customerName;

  final _productController = TextEditingController();
  final _customerController = TextEditingController();

  void initState() {
    super.initState();
    _productController.addListener(_updateText);
    _customerController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productController.text;
      _customerName = _customerController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                icon: Icon(Icons.production_quantity_limits_outlined),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _customerController,
              decoration: InputDecoration(
                labelText: 'Customer Name',
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formShopping(
                        productName: _productController.text,
                        customerName: _customerController.text,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15.0),
                fixedSize: Size(200, 50),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 7,
                shadowColor: Colors.blue,
                side: BorderSide(color: Colors.blue[800]!, width: 1),
                shape: StadiumBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SUBMIT")],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Product Name is : ${_productController.text}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Customer Name is : ${_customerController.text}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
