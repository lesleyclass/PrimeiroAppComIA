import 'package:flutter/cupertino.dart';

class DisplayDados extends StatelessWidget {
  final String nome;
  final String email;
  final double nota1;
  final double nota2;
  final double nota3;
  final double media;

  const DisplayDados({
    Key? key,
    required this.nome,
    required this.email,
    required this.nota1,
    required this.nota2,
    required this.nota3,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Resultado:',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Nome: $nome',
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          'Email: $email',
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          'Notas: ${nota1 < 0 ? '' : nota1} - ${nota2 < 0 ? '' : nota2} - ${nota3 < 0 ? '' : nota3}',
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          'Média: ${media < 0 ? '' : media.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}