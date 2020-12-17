import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/randomWord.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "My first flutter demo",
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home:Scaffold(
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }


}

