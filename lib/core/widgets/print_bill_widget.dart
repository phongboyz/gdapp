import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/cart.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintBillWidget extends StatelessWidget {
  const PrintBillWidget({super.key});
  // final doc = pw.Document();
  Future<Uint8List> generatePdf({
    required PdfPageFormat format,
    String? seller,
    Bill? bill,
    List<Cart>? product,
  }) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: false);
    final font =
        await fontFromAssetBundle('assets/fonts/Saysettha-Regular.ttf');
    final fontBold =
        await fontFromAssetBundle('assets/fonts/Saysettha-Bold.ttf');
    double normalSize = 24;
    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 24),
        pageFormat: format,
        build: (context) {
          return pw.Center(
              child: pw.SizedBox(
                  width: 350,
                  // height: 10,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text(
                              'GD ກວາງຕັງ 021214734',
                              style: pw.TextStyle(
                                font: font,
                                fontSize: normalSize,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ]),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text(
                              "ໃບສັງເຄື່ອງ 22/222/22/2 00",
                              style: pw.TextStyle(
                                  font: font, fontSize: normalSize),
                            ),
                          ]),
                      pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "ເລກບີນ: ",
                              style: pw.TextStyle(
                                  font: font, fontSize: normalSize),
                            ),
                            pw.Text(
                              'ວັນທີ:',
                              style: pw.TextStyle(
                                  font: font, fontSize: normalSize),
                            ),
                          ]),
                      pw.Text(
                        'ຜູ້ຂາຍ: ',
                        style: pw.TextStyle(font: font, fontSize: normalSize),
                      ),
                      pw.Text(
                        'ລະຫັດລູກຄ້າ: ',
                        style: pw.TextStyle(font: font, fontSize: normalSize),
                      ),
                      pw.Text('ທີຢູ່ລູກຄ້າ: ',
                          style:
                              pw.TextStyle(font: font, fontSize: normalSize)),
                      pw.SizedBox(height: 5),
                      pw.Divider(),
                      pw.Text(
                        "ລາຍການສີນຄ້າ",
                        style: pw.TextStyle(font: font, fontSize: normalSize),
                      ),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "ຊື່ສີນຄ້າ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                            pw.Text(
                              "ຈຳນວນ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                            pw.Text(
                              "ລວມ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                          ]),
                      pw.Divider(),
                      pw.SizedBox(height: 10),
                      pw.ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return pw.Column(children: [
                            pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text(
                                    'X 666',
                                    style: pw.TextStyle(
                                        font: font, fontSize: normalSize),
                                  ),
                                  pw.Text(
                                    '3',
                                    style: pw.TextStyle(
                                        font: font, fontSize: normalSize),
                                  ),
                                  pw.Text(
                                    '00 k',
                                    style: pw.TextStyle(
                                        font: font, fontSize: normalSize),
                                  ),
                                ]),
                            pw.SizedBox(height: 10)
                          ]);
                        },
                      ),
                      pw.Divider(),
                      pw.SizedBox(height: 5),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              "ລວມເງີນທີຕ້ອງຈ່າຍ:",
                              style: pw.TextStyle(
                                  fontBold: fontBold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                            pw.Text(
                              '1000 ₭',
                              style: pw.TextStyle(
                                  fontBold: fontBold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                          ]),
                      pw.SizedBox(height: 20),
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text(
                              "ຂໍຂອບໃຈ",
                              style: pw.TextStyle(
                                  fontBold: fontBold,
                                  fontWeight: pw.FontWeight.bold,
                                  font: font,
                                  fontSize: normalSize),
                            ),
                          ]),
                    ],
                  )));
        },
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          const  SizedBox(
              height: 100,
            ),
            // PdfPreview(
            //   build: (format) => generatePdf(
            //     format: PrintData.formats,
            //   ),
            // ),
            ElevatedButton(
                onPressed: () async {
                  Uint8List pdf = await generatePdf(
                    format: PrintData.formats,
                  );
                  Printing.layoutPdf(onLayout: (format) => pdf);
                },
                child: Text('print')),
          ],
        ),
      ),
    );

    //     PdfPreview(
    //   canDebug: false,
    //   allowSharing: false,
    //   allowPrinting: true,
    //   canChangePageFormat: false,
    //   loadingWidget: const LoadingDocsWidget(),
    //   padding: EdgeInsets.zero,
    //   previewPageMargin: EdgeInsets.zero,
    //   pdfPreviewPageDecoration: const BoxDecoration(
    //     color: Colors.white,
    //   ),
    //   build: (format) => generatePdf(
    //     format: PrintData.formats,
    //   ),
    // );
  }
}
