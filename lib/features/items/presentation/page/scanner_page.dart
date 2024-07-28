import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});
  @override
  State<StatefulWidget> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Barcode? barcode;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // final barcodeController = Get.put(BarcodeText());
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
            Positioned(top: 10, child: buildControlButton()),
          ],
        ),
      ),
    );
  }

  Widget buildControlButton() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                )),
          ],
        ),
      );
  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.9,
        // cutOutSize: scanArea
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    // setState(() {
    this.controller = controller;
    // });
    controller.scannedDataStream.listen((scanData) {
      barcode = scanData;
      if (barcode != null) {
        print(barcode?.code);
        AppNavigator.pushAndRemoveUntil(RoutePath.scanItemProduct,
            params: barcode?.code);
        // dispose();
        // barcodeController.barcode = '${barcode?.code}'.obs;
        // Get.to(() => ScreenBarcode());
      } else {}
    });
  }
}
