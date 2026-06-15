import 'package:flutter/material.dart';
import 'package:w_10158/display.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _textinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ODD & EVEN'),
        backgroundColor: Colors.yellow[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _textinput,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    } else if (int.tryParse(val) == null) {
                      return 'กรอกเป็นตัวเลขเท่านั้น';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'กรอกตัวเลข',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow[800]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow[800]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyDisplay(Number: _textinput.text);
                          },
                        ),
                      );
                      //print('Correct');
                    } else {
                      print('Incorrect');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: Colors.yellow[600],
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Check Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
