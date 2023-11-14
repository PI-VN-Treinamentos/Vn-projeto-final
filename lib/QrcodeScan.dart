import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeScan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeScanState();
}

class _QRCodeScanState extends State<QRCodeScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Adicione a lógica para processar o QR code escaneado
                processScannedData();
              },
              child: Text('Processar QR Code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // Faça algo com os dados escaneados (pode ser vazio se nenhum QR code for encontrado)
      if (scanData.code != null) {
        print('Scanned Data: ${scanData.code}');
        launchURL(scanData.code!); // Abre o link no navegador
      }
    });
  }

  void processScannedData() {
    // Adicione a lógica para processar os dados escaneados aqui
    if (controller != null && controller!.scannedDataStream != null) {
      controller!.scannedDataStream.listen((scanData) {
        if (scanData.code != null) {
          print('QR Code Processado: ${scanData.code}');
          launchURL(scanData.code!); // Abre o link no navegador
        }
      });
    } else {
      print('Nenhum QR Code foi escaneado.');
    }
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Não foi possível abrir o link: $url');
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

