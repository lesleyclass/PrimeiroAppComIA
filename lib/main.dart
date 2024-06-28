import 'package:flutter/material.dart';
import 'package:primeiro_app_com_ia/pdfviewscreen.dart';
import 'package:primeiro_app_com_ia/relatorio.dart';

import 'coletas_de_dados.dart';
import 'display_dados.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Dados',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _nota1Controller = TextEditingController();
  final _nota2Controller = TextEditingController();
  final _nota3Controller = TextEditingController();

  String _nome = '';
  String _email = '';
  double _nota1 = -1.0;
  double _nota2 = -1.0;
  double _nota3 = -1.0;
  double _media = -1.0;

  void _salvarDados(String nome, String email, double nota1, double nota2, double nota3) {
    setState(() {
      _nome = nome;
      _email = email;
      _nota1 = nota1;
      _nota2 = nota2;
      _nota3 = nota3;
      _media = (nota1 + nota2 + nota3) / 3;
    });
  }

  void _limparCampos() {
    setState(() {
      _nomeController.clear();
      _emailController.clear();
      _nota1Controller.clear();
      _nota2Controller.clear();
      _nota3Controller.clear();

      _nome = '';
      _email = '';
      _nota1 = -1.0;
      _nota2 = -1.0;
      _nota3 = -1.0;
      _media = -1.0;
    });
  }

  void _calcularMedia(String nome, String email, double nota1, double nota2, double nota3, double media) {
    setState(() {
      _nome = nome;
      _email = email;
      _nota1 = nota1;
      _nota2 = nota2;
      _nota3 = nota3;
      _media = media;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tarefa Final DPM 2021.2',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column( // Your child widgets here
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'CALCULATOR DE MÉDIA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ColetasDeDados(
                salvarDados: _salvarDados, // Pass the callback function
                nomeController: _nomeController,
                emailController: _emailController,
                nota1Controller: _nota1Controller,
                nota2Controller: _nota2Controller,
                nota3Controller: _nota3Controller,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _calcularMedia(
                    _nomeController.text,
                    _emailController.text,
                    double.tryParse(_nota1Controller.text) ?? 0.0,
                    double.tryParse(_nota2Controller.text) ?? 0.0,
                    double.tryParse(_nota3Controller.text) ?? 0.0,
                    _media,
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16),
                  // Set button color
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ), // Set rounded corners
                ),
                child: const Text('CALCULAR MÉDIA'),
              ),
              const SizedBox(height: 20),
              DisplayDados(
                nome: _nome,
                email: _email,
                nota1: _nota1,
                nota2: _nota2,
                nota3: _nota3,
                media: CaldulaMedia(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _limparCampos,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16),
                  // Set button color
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ), // Set rounded corners
                ),
                child: const Text('APAGAR OS CAMPOS'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Create a Student object with your desired data
                  final student = Student(
                    _nome,
                    _email,
                    _nota1,
                     _nota2,
                    _nota3,
                    CaldulaMedia(), // Replace with your logic
                  );
                  await createAndShowPdf(student, context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16),
                  // Set button color
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ), // Set rounded corners
                ),
                child: const Text('GERAR PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double CaldulaMedia() => (_nota1 + _nota2 + _nota3) / 3;
}
