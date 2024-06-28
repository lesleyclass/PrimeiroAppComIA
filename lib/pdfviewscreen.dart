import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:primeiro_app_com_ia/relatorio.dart';


Future<void> createAndShowPdf(Student student, BuildContext context) async {
  final controller = await generatePDF(student);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PdfViewerScreen(controller, student.name),
    ),
  );
}

class PdfViewerScreen extends StatelessWidget {
  final PdfController controller;
  final String studentName;

  const PdfViewerScreen(this.controller, this.studentName, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do $studentName'),
      ),
      body: PdfView(
        controller: controller,
      ),
    );
  }
}
