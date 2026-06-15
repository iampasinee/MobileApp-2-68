import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_plus/flutter_barcode_scanner_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ตัวแปรสำหรับเก็บผลลัพธ์จากการสแกน
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // ฟังก์ชัน 1: สแกนแบบต่อเนื่อง (Stream)
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    )!.listen((barcode) {
      if (!mounted) return;
      setState(() {
        _scanBarcode = barcode;
      });
    });
  }

  // ฟังก์ชัน 2: สแกน QR Code แบบครั้งเดียว
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // ฟังก์ชัน 3: สแกน Barcode ปกติแบบครั้งเดียว
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดแถบ Debug
      home: Scaffold(
        appBar: AppBar(title: const Text('Barcode scan')),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ปุ่มสำหรับสแกนบาร์โค้ดปกติ
                  ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: Text('Start barcode scan'),
                  ),
                  // ปุ่มสำหรับสแกน QR Code
                  ElevatedButton(
                    onPressed: () => scanQR(),
                    child: Text('Start QR scan'),
                  ),
                  // ปุ่มสำหรับเริ่มการสแกนแบบ Stream
                  ElevatedButton(
                    onPressed: () => startBarcodeScanStream(),
                    child: Text('Start barcode scan stream'),
                  ),
                  const SizedBox(height: 20),
                  // แสดงผลลัพธ์ที่ได้จากการสแกน
                  Text(
                    'Scan result : $_scanBarcode\n',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
