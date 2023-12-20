import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: const Text('Magic 8 Ball'),
          elevation: 5,
          centerTitle: true,
          shadowColor: Colors.blue[200],
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ballAnswer = 1;

  void generateAnswer() {
    int currentAnswer = ballAnswer;
    int newAnswer = 1;
    do {
      newAnswer = Random().nextInt(5) + 1;
    } while (currentAnswer == newAnswer);

    setState(() {
      ballAnswer = newAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: TextButton(
              child: Image.asset('images/ball$ballAnswer.png'),
              onPressed: () {
                generateAnswer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
