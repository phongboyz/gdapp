import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/date_time_extension.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

Future<Uint8List> generatePdf({
  String? seller,
  Bill? bill,
  List<Cart>? product,
  double? total,
}) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: false);
  final font = await fontFromAssetBundle('assets/fonts/Saysettha-Regular.ttf');
  final fontBold = await fontFromAssetBundle('assets/fonts/Saysettha-Bold.ttf');
  DateTime now = DateTime.now();
  double normalSize = 18;
  pdf.addPage(
    pw.Page(
      margin: const pw.EdgeInsets.symmetric(horizontal: 2, vertical: 24),
      pageFormat: PrintData.formats,
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
                            "ໃບສັງເຄື່ອງ ${bill?.transaction_date ?? ''}",
                            style:
                                pw.TextStyle(font: font, fontSize: normalSize),
                          ),
                        ]),
                    pw.SizedBox(height: 20),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                          pw.Text(
                            'ວັນທີ: ${now.shortDate()}',
                            style:
                                pw.TextStyle(font: font, fontSize: normalSize),
                          ),
                        ]),
                    pw.Text(
                      "ເລກບີນ: ${bill?.invoice_no ?? ''}",
                      style: pw.TextStyle(font: font, fontSize: normalSize),
                    ),
                    pw.Text(
                      'ຜູ້ຂາຍ: $seller',
                      style: pw.TextStyle(font: font, fontSize: normalSize),
                    ),
                    pw.Text(
                      'ລະຫັດລູກຄ້າ: ${bill?.customer ?? ''}',
                      style: pw.TextStyle(font: font, fontSize: normalSize),
                    ),
                    pw.Text('ທີຢູ່ລູກຄ້າ: ${bill?.address ?? ""}',
                        style: pw.TextStyle(font: font, fontSize: normalSize)),
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
                      itemCount: product?.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = product?[index];
                        return pw.Column(children: [
                          pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  '${data?.name}',
                                  style: pw.TextStyle(
                                      font: font, fontSize: normalSize),
                                ),
                                pw.Text(
                                  '${data?.amount}',
                                  style: pw.TextStyle(
                                      font: font, fontSize: normalSize),
                                ),
                                pw.Text(
                                  FixMoney.formateMoneyKIB(
                                      double.parse('${data?.total}')),
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
                            FixMoney.formateMoneyKIB(double.parse('$total')),
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
