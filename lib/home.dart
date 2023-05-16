import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Quiz'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlutterLogo(
                size: 300,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Quiz');
                },
                child: Text(
                  'Começar',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
