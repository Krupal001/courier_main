import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> printDoc(SharedPreferences preferences) async {
  final doc = pw.Document();
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text(
                'Ordered through\nDynamic Courier Service',
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Divider(thickness: 2.0, color: PdfColors.grey),
              pw.SizedBox(height: 10.0),
              pw.Text(
                'Shipping/Customer address:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                    color: PdfColors.grey,
                    width: 1.0,
                  ),
                ),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      height: 100,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          color: PdfColors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: pw.Column(
                        children: [
                          pw.SizedBox(
                              width:100,
                              child: pw.Text('Name: ${preferences.getString("recivername")}',textAlign: pw.TextAlign.start,)),
                          pw.SizedBox(
                              width: 100,
                              child: pw.Text(preferences.getString("address").toString(),textAlign: pw.TextAlign.start)),
                        ],
                      ),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          color: PdfColors.grey,
                          width: 2.0,
                        ),
                      ),

                      child: pw.BarcodeWidget(
                          data: [
                            preferences.getString("sendername"),
                            preferences.getString("recivername"),
                            preferences.getString("address"),
                            preferences.getString("description"),
                          ].join("\n"),
                          barcode: pw.Barcode.qrCode(),
                          backgroundColor: PdfColors.white,
                          width: 100,
                          height: 100
                      ),
                    ),
                  ],
                ),
              ),
              pw.Text(
                'Send By: ${preferences.getString("sendername")}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.normal),
              ),
              pw.Divider(thickness: 2.0, color: PdfColors.grey),
              pw.Text(
                'Description',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Divider(thickness: 2.0, color: PdfColors.grey),
              pw.Text(preferences.getString("description").toString()),
            ],
          ),
        );
      },
    ),
  );
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
}
