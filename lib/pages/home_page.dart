import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  exportPDF() {
    final pdf = pw.Document();
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          pw.Text("Hola"),
        ];
      },
    );
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
          ],
        ),
      ),
    );
  }
}
