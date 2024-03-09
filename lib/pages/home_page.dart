import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exportsandcharts/pages/cart_page.dart';
import 'package:exportsandcharts/pages/charts/chart1_page.dart';
import 'package:exportsandcharts/pages/charts/chart2_page.dart';
import 'package:exportsandcharts/pages/dashboard_page.dart';
import 'package:exportsandcharts/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:syncfusion_officechart/officechart.dart';

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

  Future exportExcel() async {
    final workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText("Id");
    sheet.getRangeByIndex(1, 2).setText("Partído político");

    int row = 2;
    QuerySnapshot candidateCollection = await candidateReference.get();

    List<QueryDocumentSnapshot> docs = candidateCollection.docs;
    List.generate(docs.length, (index) {
      sheet.getRangeByIndex(row, 1).setText(docs[index]["idCandidato"]);
      sheet.getRangeByIndex(row, 2).setText(docs[index]["partidoPolitico"]);
      sheet.getRangeByIndex(row, 3).setText(docs[index]["nombreCandidato"]);
      sheet.getRangeByIndex(row, 4).setText(docs[index]["nvotos"].toString());
      row++;
    });
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

  Future exportExcelWithChart() async {
    final excel.Workbook workbook = excel.Workbook();
    final excel.Worksheet sheet1 = workbook.worksheets.addWithName("CHART");

    sheet1.enableSheetCalculations();
    sheet1.getRangeByName('A1').setText("Id");
    sheet1.getRangeByIndex(1, 2).setText("Partído político");
    sheet1.getRangeByIndex(1, 3).setText("Representante");
    sheet1.getRangeByIndex(1, 4).setText("Votos");

    sheet1.getRangeByIndex(1, 1).columnWidth = 20;
    sheet1.getRangeByIndex(1, 2).columnWidth = 15;
    sheet1.getRangeByIndex(1, 3).columnWidth = 15;
    sheet1.getRangeByIndex(1, 4).columnWidth = 13;
    sheet1.getRangeByIndex(1, 5).columnWidth = 21;
    sheet1.getRangeByName('A1:A18').rowHeight = 22;

    final excel.Style style1 = workbook.styles.add("Style1");
    style1.backColor = '#0078D4';
    style1.vAlign = excel.VAlignType.center;
    style1.hAlign = excel.HAlignType.center;
    style1.bold = true;

    final excel.Style style2 = workbook.styles.add("Style2");
    // style2.backColor = '8EA9DB';
    style2.vAlign = excel.VAlignType.center;
    style2.bold = true;

    sheet1.getRangeByName('A1:D1').cellStyle = style1;

    int row = 2;
    QuerySnapshot candidateCollection = await candidateReference.get();

    List<QueryDocumentSnapshot> docs = candidateCollection.docs;
    List.generate(docs.length, (index) {
      int auxVotos = docs[index]["nvotos"];

      sheet1.getRangeByIndex(row, 1).setText(docs[index]["idCandidato"]);
      sheet1.getRangeByIndex(row, 2).setText(docs[index]["partidoPolitico"]);
      sheet1.getRangeByIndex(row, 3).setText(docs[index]["nombreCandidato"]);
      sheet1.getRangeByIndex(row, 4).setNumber(auxVotos.toDouble());
      row++;
    });

    sheet1.getRangeByIndex(row, 3).setText("TOTAL");
    sheet1.getRangeByIndex(row, 4).setFormula('=SUM(C2:D11)');

    final ChartCollection chartCollection = ChartCollection(sheet1);

    final Chart chart = chartCollection.add();
    chart.chartType = ExcelChartType.pie;
    chart.dataRange = sheet1.getRangeByName('C2:D11');
    chart.isSeriesInRows = false;
    chart.chartTitle = "RESUMEN DE VOTOS";
    sheet1.charts = chartCollection;

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
      docs.forEach((element) {
        print(element.id);
      });
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
            ElevatedButton(
              onPressed: () {
                exportExcelWithChart();
              },
              child: Text("TO EXCEL WITH CHART"),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/perfil');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => PerfilPage()));
              },
              child: Text("GO PERFIL"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DashboardPage()));
              },
              child: Text("GO DASHBOARD"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CartPage()));
              },
              child: Text("GO CART"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Chart1Page()));
              },
              child: Text("GO CHART 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Chart2Page()));
              },
              child: Text("GO CHART 2"),
            ),
          ],
        ),
      ),
    );
  }
}
