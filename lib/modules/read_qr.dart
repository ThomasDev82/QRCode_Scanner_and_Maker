import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrStr = "let's Scan it";

  get height => MediaQuery.of(context).size.height;

  get width => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanning QR code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              qrStr,
              style: const TextStyle(color: Colors.blue, fontSize: 30),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: scanQr,
              child: const Text(
                'Scanner',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: height),
          ],
        ),
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value) {
        setState(() {
          qrStr = value;
        });
      });
    } catch (e) {
      setState(() {
        qrStr = 'unable to read this';
      });
    }
  }
}
