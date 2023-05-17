import 'package:flutter/material.dart';

class Topico extends StatelessWidget {
  const Topico({super.key});

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
                  Navigator.pushNamed(context, '/Geografia');
                },
                child: Text(
                  'Geografia',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Quiz');
                },
                child: Text(
                  'Historia',
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
