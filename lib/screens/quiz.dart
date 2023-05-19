import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_app/screens/resultado.dart';

class Historia extends StatefulWidget {
  const Historia({Key? key}) : super(key: key);

  @override
  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  List<Map<String, dynamic>> quiz = [
    
    {
      "pergunta": "Qual o objetivo do Mercantilismo?",
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
      "pergunta": "Quem foi o primeiro presidente do Brasil?",
      "respostas": [
        "Getúlio Vargas",
        "Juscelino Kubitschek",
        "Deodoro da Fonseca",
        "Fernando Henrique Cardoso",
        "Tancredo Neves",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta": "Qual foi o período conhecido como Renascimento Cultural?",
      "respostas": [
        "Século XIX",
        "Século XVI",
        "Século XVIII",
        "Século XIV",
        "Século XV",
      ],
      "alternativa_correta": 4,
    },
    {
      "pergunta": "Quem foi o líder da Revolução Russa de 1917?",
      "respostas": [
        "Vladimir Lenin",
        "Josef Stalin",
        "Nikita Khrushchev",
        "Mikhail Gorbachev",
        "Boris Yeltsin",
      ],
      "alternativa_correta": 0,
    },
    {
      "pergunta":
          "Qual foi o evento que marcou o início da Segunda Guerra Mundial?",
      "respostas": [
        "Ataque a Pearl Harbor",
        "Bombardeio de Hiroshima",
        "Invasão da Polônia",
        "Batalha de Stalingrado",
        "Declaração de Guerra da Alemanha",
      ],
      "alternativa_correta": 2,
    },
    {
      "pergunta": "Qual foi o primeiro imperador do Império Romano?",
      "respostas": [
        "Augusto",
        "Nero",
        "Trajano",
        "César",
        "Tibério",
      ],
      "alternativa_correta": 0,
    },
    {
      "pergunta": "Qual foi o último faraó do Antigo Egito?",
      "respostas": [
        "Ramsés II",
        "Cleópatra",
        "Tutancâmon",
        "Akhenaton",
        "Ptolomeu XIII",
      ],
      "alternativa_correta": 1,
    },
    {
      "pergunta":
          "Quem foi o líder do movimento pelos direitos civis nos Estados Unidos?",
      "respostas": [
        "Martin Luther King Jr.",
        "Malcolm X",
        "Rosa Parks",
        "Harriet Tubman",
        "Barack Obama",
      ],
      "alternativa_correta": 0,
    },
    {
      "pergunta": "Qual foi o primeiro país a abolir a escravidão?",
      "respostas": [
        "Reino Unido",
        "Estados Unidos",
        "França",
        "Brasil",
        "Haiti",
      ],
      "alternativa_correta": 4,
    },
    {
      "pergunta": "Quem foi o líder da Revolução Cubana em 1959?",
      "respostas": [
        "Che Guevara",
        "Fidel Castro",
        "Hugo Chávez",
        "Augusto Sandino",
        "José Martí",
      ],
      "alternativa_correta": 1,
    },
  ];

  int perguntaNumero = 0;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle(Random());
    quiz[perguntaNumero]['respostas'].shuffle(Random());

    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Quiz'),
          ),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pergunta: ${quiz[perguntaNumero]['pergunta']}',
                        style: TextStyle(fontSize: 25),
                      ),
                      ...List.generate(
                        quiz[perguntaNumero]['respostas'].length,
                        (index) => Container(     
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
