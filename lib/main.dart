import 'package:flutter/material.dart';
import 'package:quiz_app/screens/geografia.dart';
import 'package:quiz_app/screens/quiz.dart';
import 'package:quiz_app/screens/resultado.dart';
import 'package:quiz_app/widgets/topico.dart';
import 'widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/Topico': (context) => Topico(),
        '/Geografia': (context) => Geografia(),
        '/Quiz': (context) => Historia(),
        '/Resultado': (context) => Resultado(
              acertos: 0,
            ),
      },
    );
  }
}
