import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/io.dart';

Future<void> generatePDF(String name, String email, double nota1, double nota2, double nota3, double media) async {
  // Create a PDF document
  final pdf = Document();

  // Add a page to the document
  final page = Page(pdf);

  // Add text elements for each data field
  page.addText('Nome: $name', style: TextStyle(fontSize: 16));
  page.addText('Email: $email', style: TextStyle(fontSize: 16));
  page.addText('Nota 1: $nota1', style: TextStyle(fontSize: 16));
  page.addText('Nota 2: $nota2', style: TextStyle(fontSize: 16));
  page.addText('Nota 3: $nota3', style: TextStyle(fontSize: 16));
  page.addText('Média: $media', style: TextStyle(fontSize: 16));

  // Save the PDF document
  final file = File('result.pdf');
  await file.writeAsBytes(await pdf.outputBytes());
}