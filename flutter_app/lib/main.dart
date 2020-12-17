

import 'package:flutter/material.dart';
import 'package:flutter_app/login//login.dart';


void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}