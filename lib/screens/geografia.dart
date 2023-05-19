import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/resultado.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Geografia(),
    );
  }
}

class Geografia extends StatefulWidget {
  const Geografia({Key? key}) : super(key: key);

  @override
  _GeografiaState createState() => _GeografiaState();
}

class _GeografiaState extends State<Geografia> {
  List<Map<String, dynamic>> quiz = [
    {
      "pergunta": "Testando route",
      "imagem": "assets/images/brasil.png",
      "respostas": [
        "Fortalecer o Estado e enriquecer a sociedade.",
        "Auxiliar no desenvolvimento da sociedade proletária.",
        "Fortalecer a sociedade proletária em ascensão.",
        "Diminuir a cobrança de impostos favorecendo a sociedade.",
        "Fortalecer o Estado e enriquecer a burguesia.",
      ],
      "alternativa_correta": 4,
    },
    {
      "pergunta": "Eu aqui",
      "imagem": "assets/images/brasil.png",
      "respostas": [
        "Fortalecer o Estado e enriquecer a sociedade.",
        "Auxiliar no desenvolvimento da sociedade proletária.",
        "Fortalecer a sociedade proletária em ascensão.",
        "Diminuir a cobrança de impostos favorecendo a sociedade.",
        "Fortalecer o Estado e enriquecer a burguesia.",
      ],
      "alternativa_correta": 4,
    },
  ];

  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle(Random());
    quiz[perguntaNumero]['respostas'].shuffle(Random());
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: perguntaNumero >= quiz.length
              ? Text('Quiz concluído!')
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Pergunta ${perguntaNumero + 1} de ${quiz.length}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pergunta: ${quiz[perguntaNumero]['pergunta']}',
                      style: TextStyle(fontSize: 25),
                    ),
                    Image.asset(
                      quiz[perguntaNumero]['imagem'] ?? '',
                      width: 200,
                      height: 200,
                    ),
                    ...List.generate(
                      quiz[perguntaNumero]['respostas'].length,
                      (index) => Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            verificarResposta(index);
                          },
                          child: Text(
                            quiz[perguntaNumero]['respostas'][index],
                            style: TextStyle(fontSize: 30),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void verificarResposta(int index) {
    if (quiz[perguntaNumero]['alternativa_correta'] == index) {
      setState(() {
        acertos++;
      });
    } else {
      setState(() {
        erros++;
      });
    }

    if (perguntaNumero < quiz.length - 1) {
      setState(() {
        perguntaNumero++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Resultado(acertos: acertos),
        ),
      );
    }
  }
}
