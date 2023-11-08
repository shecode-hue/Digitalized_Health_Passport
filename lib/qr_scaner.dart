import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;

class QRScaner extends StatefulWidget {
  const QRScaner({super.key});

  @override
  State<QRScaner> createState() => _QRScanerState();
}

class _QRScanerState extends State<QRScaner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool dataSent = false; // Track data transfer status

  void sendScannedDataToServer(String scannedData) async {
    final url = Uri.parse('https://www.mindsinaction.com.na/api/parliament_app/Sending_scanned.php');
    final response = await http.post(
      url,
      body: {'scanned_code': scannedData},
    );

    if (response.statusCode == 200) {
      print('Scanned data sent successfully.');
      setState(() {
        dataSent = true; // Update the status when data is sent
      });
    } else {
      print('Failed to send scanned data: ${response.statusCode}');
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCamera,
            ),
          ),
          Expanded(
            child: Center(
              child: (result != null)
                  ? Column(
                      children: [
                        Text('Data:  ${result!.code}'),
                        dataSent
                            ? Icon(
                                Icons.check, // Show check/tick icon when data is sent
                                color: Colors.green,
                                size: 48,
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  final scannedCode = result!.code ??
                                      ''; // Provide a default value if result!.code is null
                                  sendScannedDataToServer(scannedCode);
                                  // You can navigate to another page or perform other actions here
                                  print("QR Code Text: $scannedCode");
                                },
                                child: Text('Transfer'),
                              ),
                      ],
                    )
                  : Text('Scan a Code'),
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((ScanData) {
      setState(() {
        result = ScanData;
        dataSent = false; // Reset the status when a new code is scanned
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
