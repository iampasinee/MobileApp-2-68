import 'package:flutter/material.dart';

class CircleVolume extends StatelessWidget {
  const CircleVolume({super.key, required this.radius, required this.height});

  final String radius;
  final String height;
  @override
  Widget build(BuildContext context) {
    double r = double.tryParse(radius) ?? 0;
    double h = double.tryParse(height) ?? 0;
    double volume = 3.14 * r * r * h;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cylinder Volume'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: Colors.green[700],
                        size: 80,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Volume : ${volume.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(thickness: 1, color: Colors.green),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    'Radius: $radius',
                    style: TextStyle(fontSize: 18, color: Colors.green[700]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Text(
                    'Height: $height',
                    style: TextStyle(fontSize: 18, color: Colors.green[700]),
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
