import 'package:flutter/material.dart';
import 'dart:ui';
import 'result.dart';

enum Department { INE, INET }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mid_score = TextEditingController();
  TextEditingController final_score = TextEditingController();
  TextEditingController class_score = TextEditingController();

  String? _selectedItem;
  List<String> _dropdownmenu = [
    'MOBILE APPLICATION DEVELOPMENT',
    'FULL STACK SYSTEM DEVELOPMENT',
    'COMP NET DESIGN & IMPLEMENT',
    'DATABASE SYSTEM',
  ];

  final num1con = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Department? _department;

  void initState() {
    super.initState();
    _selectedItem = _dropdownmenu[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Grade'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputName(
                  label: 'Firstname',
                  control: firstname,
                  icon: Icons.person,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please Enter Firstname';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextInputName(
                  label: 'Lastname',
                  control: lastname,
                  icon: Icons.person,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please Enter Lastname';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Field of Study",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 5),
                FormField<Department>(
                  validator: (value) {
                    if (_department == null) {
                      return 'Please choose Department';
                    }
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green.shade200,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: RadioListTile<Department>(
                                  title: Text(
                                    Department.INE.name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  value: Department.INE,
                                  groupValue: _department,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (val) {
                                    setState(() {
                                      _department = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green.shade200,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: RadioListTile<Department>(
                                  title: Text(
                                    Department.INET.name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  value: Department.INET,
                                  groupValue: _department,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  onChanged: (val) {
                                    setState(() {
                                      _department = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 5),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Subject",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green.shade100, width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      value: _selectedItem,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Choose subject';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      items: _dropdownmenu
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedItem = val;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextInputScore(
                  label: 'Midterm Exam',
                  control: mid_score,
                  icon: Icons.quiz_sharp,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please Enter midterm score';
                    } else if (double.tryParse(val) == null) {
                      return 'Please Enter type number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextInputScore(
                  label: 'Final Exam',
                  control: final_score,
                  icon: Icons.quiz_sharp,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please Enter final score';
                    } else if (double.tryParse(val) == null) {
                      return 'Please Enter type number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextInputScore(
                  label: 'Classwork score',
                  control: class_score,
                  icon: Icons.inventory_2_sharp,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please Enter classwork score';
                    } else if (double.tryParse(val) == null) {
                      return 'Please Enter type number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double m = double.tryParse(mid_score.text) ?? 0;
                      double f = double.tryParse(final_score.text) ?? 0;
                      double c = double.tryParse(class_score.text) ?? 0;
                      double total = m + f + c;
                      if (total > 100) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'คะแนนรวมไม่ถูกต้อง (เกิน 100 คะแนน)',
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyResult(
                                fname: firstname.text,
                                lname: lastname.text,
                                dept: _department?.name ?? "",
                                subject: _selectedItem ?? "",
                                midterm: mid_score.text,
                                finalScore: final_score.text,
                                classwork: class_score.text,
                              );
                            },
                          ),
                        );
                      }
                    } else {
                      print("กรุณากรอกข้อมูลให้ครบ");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(double.infinity, 50),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.green[800]!, width: 1),
                    shape: StadiumBorder(),
                  ),
                  child: Text('Calculate Grade'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget TextInputName({
  required String label,
  required TextEditingController control,
  required IconData icon,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: control,
    validator: validator,
    keyboardType: TextInputType.text,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 30),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.green, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.green.shade100, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.5),
      ),
    ),
  );
}

Widget TextInputScore({
  required String label,
  required TextEditingController control,
  required IconData icon,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: control,
    validator: validator,
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.green, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.green.shade100, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2.5),
      ),
    ),
  );
}
