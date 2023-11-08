import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

// ...

class QRImage extends StatelessWidget {
  const QRImage({super.key, required this.controller});

  final TextEditingController controller;

  Future<void> sendQRCodeToServer(String qrText) async {
    final url = Uri.parse(
        'https://www.mindsinaction.com.na/api/parliament_app/QRcodes.php');
    final response = await http.post(
      url,
      body: {'qrText': qrText},
    );

    if (response.statusCode == 200) {
      print('QR Code data sent successfully.');
    } else {
      print('Failed to send QR Code data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String qrText = controller.text;
    print("QR Code Text: $qrText");

    sendQRCodeToServer(qrText); // Send QR code text to PHP script

    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter + QR code'),
        centerTitle: true,
      ),
      body: Center(
        child: QrImageView(
          data: qrText,
          size: 200,
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(
              100,
              100,
            ),
          ),
        ),
      ),
    );
  }
}
