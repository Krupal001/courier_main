import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../features/authentication/controllers/parcel_booking_controller.dart';

Future<void> printDoc(ParcelBookingController controller) async {
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
                              child: pw.Text('Name: ${controller.recipientNameController.text}',textAlign: pw.TextAlign.start,)),
                          pw.SizedBox(
                              width: 100,
                              child: pw.Text(controller.recipientAddressController.text,textAlign: pw.TextAlign.start)),
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
                            controller.sendername.text,
                            controller.itemDescriptionController.text,
                            controller.recipientAddressController.text,
                            controller.recipientNameController.text,
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
                'Send By: ${controller.sendername.text}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.normal),
              ),
              pw.Divider(thickness: 2.0, color: PdfColors.grey),
              pw.Text(
                'Description',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Divider(thickness: 2.0, color: PdfColors.grey),
              pw.Text(controller.itemDescriptionController.text),
            ],
          ),
        );
      },
    ),
  );
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
}
