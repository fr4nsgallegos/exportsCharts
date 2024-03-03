import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

class HomePage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  Future exportPDF() async {
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.ListView(children: [
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
            pw.Text("HOLA"),
          ]),
        ];
      },
    ));

    Uint8List bytes = await pdf.save();
    print(bytes);

    Directory directory = await getApplicationSupportDirectory();
    print(directory);
    String fileName = "${directory.path}/reportPDF.pdf";
    print(fileName);

    File pdfFile = File(fileName);
    await pdfFile.writeAsBytes(bytes, flush: true);

    OpenFile.open(fileName);
  }

  exportExcel() async {
    final workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText("Id");
    sheet.getRangeByIndex(1, 2).setText("Partído político");

    //proceso de almacenado dentro del celular
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/MyFirstExcel.xlsx';
    // print(path);
    // print(fileName);

    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }

  @override
  Widget build(BuildContext context) {
    candidateReference.get().then((value) {
      QuerySnapshot candidateCollection = value;
      List<QueryDocumentSnapshot> docs = candidateCollection.docs;
      print(docs.length);
    });
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                exportPDF();
              },
              child: Text("TO PDF"),
            ),
            ElevatedButton(
              onPressed: () {
                exportExcel();
              },
              child: Text("TO EXCEL"),
            ),
          ],
        ),
      ),
    );
  }
}
