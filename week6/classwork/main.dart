import 'package:flutter/material.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odd Even App',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: const FormPage(),
    );
  }
}
