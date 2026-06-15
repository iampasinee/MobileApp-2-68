import 'dart:ui';

import 'package:flutter/material.dart';
import 'shopping.dart';
import 'my_radio_button.dart';

//enum ProductTypeEnum { Downloadable, Deliverable }

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  var _customerName;
  var _selectChoice;

  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  final _customerController = TextEditingController();

  final _productSizeList = ["Small", "Meduim", "Large", "XLarge"];
  String? _selectedVal;

  /*_MyformState() {
    _selectedVal = _productSizeList[0];
  }*/

  bool? _checkBox, _listTitleCheckBox = false;

  ProductTypeEnum? _productTypeEnum;

  void initState() {
    super.initState();
    _productController.addListener(_updateText);
    _customerController.addListener(_updateText);
    _selectedVal = _productSizeList[0];
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
      appBar: AppBar(
        title: Text("PRODUCT"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text('PRODUCT APP', style: TextStyle(fontSize: 30)),
            Text('Add Product detail in the form '),
            SizedBox(height: 10),
            MyTextField(
              fieldName: 'Product Name',
              myController: _productController,
              MyIcon: Icons.pin_drop_sharp,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 20),
            MyTextField(
              fieldName: 'Product Desscription',
              myController: _productDesController,
              MyIcon: Icons.pin_drop_sharp,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            SizedBox(height: 20),

            /*Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.deepPurple,
              tristate: true,
              value: _checkBox,
              onChanged: (val) {
                setState(() {
                  _checkBox = val;
                });
              },
            ),*/
            CheckboxListTile(
              value: _listTitleCheckBox,
              title: Text('Top Product'),
              onChanged: (val) {
                setState(() {
                  _listTitleCheckBox = val;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),

            /*ListTile(
              title: Text('1'),
              leading: Radio(
                value: 1,
                groupValue: _selectChoice,
                onChanged: (val) {
                  setState(() {
                    _selectChoice = val;
                  });
                },
              ),
            ),*/
            /*RadioListTile(
              title: Text(ProductTypeEnum.Downloadable.name),
              value: ProductTypeEnum.Downloadable,
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              },
            ),*/
            SizedBox(height: 5),
            Row(
              children: [
                MyRadioButton(
                  title: ProductTypeEnum.Deliverable.name,
                  value: ProductTypeEnum.Deliverable,
                  selectProductType: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),
                MyRadioButton(
                  title: ProductTypeEnum.Downloadable.name,
                  value: ProductTypeEnum.Downloadable,
                  selectProductType: _productTypeEnum,
                  onChanged: (val) {
                    setState(() {
                      _productTypeEnum = val;
                    });
                  },
                ),
              ],
            ),

            //Dropdown
            /*DropdownButton(
              value: _selectedVal,
              items: _productSizeList
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedVal = val as String;
                });
              },
            ),*/
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: _selectedVal,
              items: _productSizeList
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedVal = val as String;
                });
              },
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.deepPurple,
              ),
              dropdownColor: Colors.deepPurple.shade50,
              decoration: InputDecoration(
                labelText: 'Product Size',
                prefixIcon: Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.deepPurple,
                ),
                border: OutlineInputBorder(),
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
                        productDes: _productDesController.text,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                children: [
                  Text("Go To Shopping"),
                  Icon(Icons.add_shopping_cart_outlined, size: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.fieldName,
    required this.myController,
    this.MyIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  final String fieldName;
  final IconData MyIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(MyIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
