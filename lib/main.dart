import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/resultado.dart';

import 'home.dart';

void main() {
  //runApp(const Resultado(acertos: 5));
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
        '/Quiz' :(context) => Quiz(),
        '//Resultado' :(context) => Resultado(acertos: 5,),
      },
    );
  }
}
