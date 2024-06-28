import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:pdfx/pdfx.dart';

class Student {
  final String name;
  final String email;
  final double nota1;
  final double nota2;
  final double nota3;
  final double media;

  Student(this.name, this.email, this.nota1, this.nota2, this.nota3, this.media);
}

Future<PdfController> generatePDF(Student student) async {
  final pdf = Document();
  pdf.addPage(
    Page(
      build: (context) => Center(
        child: Column(
          children: [
            Text(
              'Nome: ${student.name}',
                style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Email: ${student.email}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Nota 1: ${student.nota1.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Nota 2: ${student.nota2.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Nota 3: ${student.nota3.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Média: ${student.media.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    ),
  );

  String directory = (await getApplicationDocumentsDirectory()).path;
  final pdfName = "$directory/resultado_${student.name.replaceAll(' ', '_')}.pdf";
  final File file = File(pdfName);
  await file.writeAsBytes(await pdf.save());
  return PdfController(
    document: PdfDocument.openFile(file.path),
  );
}




