import 'package:app_week7_2/circle_area.dart';
import 'package:app_week7_2/circle_volume.dart';
import 'package:app_week7_2/rec_area.dart';
import 'package:app_week7_2/rec_volume.dart';
import 'package:app_week7_2/tri_area.dart';
import 'package:app_week7_2/tri_volume.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [HomeArea(), HomeVolume()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Area',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'Volume',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

Widget InputForm({
  required String label,
  required TextEditingController control,
  required validate,
  required Color colors,
}) {
  return TextFormField(
    keyboardType: TextInputType.number,
    controller: control,
    style: TextStyle(color: colors, fontWeight: FontWeight.bold),
    validator: validate,
    decoration: InputDecoration(
      label: Text(
        label,
        style: TextStyle(color: colors, fontWeight: FontWeight.bold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colors, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
  );
}

class HomeArea extends StatefulWidget {
  const HomeArea({super.key});

  @override
  State<HomeArea> createState() => _HomeAreaState();
}

class _HomeAreaState extends State<HomeArea> {
  String selectedShape = 'Rectangle';

  final heightControl = TextEditingController();
  final widthControl = TextEditingController();
  final baseControl = TextEditingController();
  final radiusControl = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid Number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Calculator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'MENU :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ),
              Divider(height: 1),
              RadioListTile<String>(
                title: const Text('Rectangle'),
                secondary: const Icon(Icons.rectangle_outlined),
                value: 'Rectangle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Triangle'),
                secondary: const Icon(Icons.change_history),
                value: 'Triangle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Circle'),
                secondary: const Icon(Icons.circle_outlined),
                value: 'Circle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Enter Area Size :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ),
              Divider(height: 1),
              SizedBox(height: 15),
              if (selectedShape == 'Rectangle') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Height (h)',
                    control: heightControl,
                    colors: Colors.blue,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Weigth (w)',
                    control: widthControl,
                    colors: Colors.blue,
                    validate: validateNumber,
                  ),
                ),
              ] else if (selectedShape == 'Triangle') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Height (h)',
                    colors: Colors.blue,
                    control: heightControl,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Base (b)',
                    colors: Colors.blue,
                    control: baseControl,
                    validate: validateNumber,
                  ),
                ),
              ] else ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Radius (r)',
                    colors: Colors.blue,
                    control: radiusControl,
                    validate: validateNumber,
                  ),
                ),
              ],
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      if (selectedShape == 'Rectangle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RecArea(
                                width: widthControl.text,
                                height: heightControl.text,
                              );
                            },
                          ),
                        );
                      } else if (selectedShape == 'Triangle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TriArea(
                                base: baseControl.text,
                                height: heightControl.text,
                              );
                            },
                          ),
                        );
                      } else if (selectedShape == 'Circle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CircleArea(radius: radiusControl.text);
                            },
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(200, 50),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.blue,
                  ),
                  child: Text('Calculate Area'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeVolume extends StatefulWidget {
  const HomeVolume({super.key});

  @override
  State<HomeVolume> createState() => _HomeVolumeState();
}

class _HomeVolumeState extends State<HomeVolume> {
  String selectedShape = 'Rectangle';

  final heightControl = TextEditingController();
  final widthControl = TextEditingController();
  final baseControl = TextEditingController();
  final lengthControl = TextEditingController();
  final p_heightControl = TextEditingController();
  final radiusControl = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid Number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volume Calculator'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'MENU :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
              Divider(height: 1),
              RadioListTile<String>(
                title: const Text('Rectangular Prism'),
                secondary: const Icon(Icons.rectangle_outlined),
                value: 'Rectangle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Triangular Pyramid'),
                secondary: const Icon(Icons.change_history),
                value: 'Triangle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Cylinder'),
                secondary: const Icon(Icons.circle_outlined),
                value: 'Circle',
                groupValue: selectedShape,
                onChanged: (val) {
                  setState(() {
                    selectedShape = val!;
                    _formkey.currentState?.reset();
                  });
                },
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Enter Area Size :',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
              Divider(height: 1),
              SizedBox(height: 15),
              if (selectedShape == 'Rectangle') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Height (h)',
                    control: heightControl,
                    colors: Colors.green,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Length (l)',
                    control: lengthControl,
                    colors: Colors.green,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Weigth (w)',
                    control: widthControl,
                    colors: Colors.green,
                    validate: validateNumber,
                  ),
                ),
              ] else if (selectedShape == 'Triangle') ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Base (b)',
                    colors: Colors.green,
                    control: baseControl,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Height (h)',
                    control: heightControl,
                    colors: Colors.green,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Pyramid Height (h)',
                    colors: Colors.green,
                    control: p_heightControl,
                    validate: validateNumber,
                  ),
                ),
              ] else ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Radius (r)',
                    colors: Colors.green,
                    control: radiusControl,
                    validate: validateNumber,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InputForm(
                    label: 'Height (h)',
                    colors: Colors.green,
                    control: heightControl,
                    validate: validateNumber,
                  ),
                ),
              ],
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      if (selectedShape == 'Rectangle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RecVolume(
                                width: widthControl.text,
                                height: heightControl.text,
                                length: lengthControl.text,
                              );
                            },
                          ),
                        );
                      } else if (selectedShape == 'Triangle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TriVolume(
                                base: baseControl.text,
                                height: heightControl.text,
                                p_height: p_heightControl.text,
                              );
                            },
                          ),
                        );
                      } else if (selectedShape == 'Circle') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CircleVolume(
                                radius: radiusControl.text,
                                height: heightControl.text,
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    minimumSize: Size(200, 50),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.green,
                  ),
                  child: Text('Calculate Volume'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
