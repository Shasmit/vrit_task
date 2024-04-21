import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vrit_task/static.dart';

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'PoppinsSemiBold',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Scan the QR code to visit the URL',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PoppinsMedium',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            QrImageView(
              data: StaticVariables.shortUrl,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
