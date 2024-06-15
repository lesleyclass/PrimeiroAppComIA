import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColetasDeDados extends StatefulWidget {
  final Function(String nome, String email, double nota1, double nota2, double nota3) salvarDados;
  final TextEditingController nomeController;
  final TextEditingController emailController;
  final TextEditingController nota1Controller;
  final TextEditingController nota2Controller;
  final TextEditingController nota3Controller;

  const ColetasDeDados({
    super.key,
    required this.salvarDados,
    required this.nomeController,
    required this.emailController,
    required this.nota1Controller,
    required this.nota2Controller,
    required this.nota3Controller,
  });

  @override
  _ColetasDeDadosState createState() => _ColetasDeDadosState();
}

class _ColetasDeDadosState extends State<ColetasDeDados> {
  void _salvarDados() {
    final nome = widget.nomeController.text;
    final email = widget.emailController.text;
    final nota1 = double.tryParse(widget.nota1Controller.text) ?? -1.0;
    final nota2 = double.tryParse(widget.nota2Controller.text) ?? -1.0;
    final nota3 = double.tryParse(widget.nota3Controller.text) ?? -1.0;

    widget.salvarDados(nome, email, nota1, nota2, nota3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: widget.nomeController,
          decoration: const InputDecoration(
            labelText: 'Nome',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: widget.nota1Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // Permite apenas números double com até 2 casas decimais
                ],
                decoration: const InputDecoration(
                  labelText: 'Nota 1',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: widget.nota2Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // Permite apenas números double com até 2 casas decimais
                ],
                decoration: const InputDecoration(
                  labelText: 'Nota 2',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: widget.nota3Controller,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')), // Permite apenas números double com até 2 casas decimais
                ],
                decoration: const InputDecoration(
                  labelText: 'Nota 3',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}