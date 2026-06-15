import 'package:flutter/material.dart';

class CircleArea extends StatelessWidget {
  const CircleArea({super.key, required this.radius});

  final String radius;

  @override
  Widget build(BuildContext context) {
    double r = double.tryParse(radius) ?? 0;
    double area = (3.14) * r * r;
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Area'),
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
                        Icons.circle_sharp,
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
                    'Radius: $radius',
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
