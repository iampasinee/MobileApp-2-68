import 'package:flutter/material.dart';

class TriArea extends StatelessWidget {
  const TriArea({super.key, required this.base, required this.height});

  final String base;
  final String height;

  @override
  Widget build(BuildContext context) {
    double b = double.tryParse(base) ?? 0;
    double h = double.tryParse(height) ?? 0;
    double area = (1 / 2) * b * h;
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangle Area'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.change_history,
                        color: Colors.blue[700],
                        size: 80,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Area : ${area.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(thickness: 1, color: Colors.blue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    'Base: $base',
                    style: TextStyle(fontSize: 18, color: Colors.blue[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    'Height: $height',
                    style: TextStyle(fontSize: 18, color: Colors.blue[700]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
