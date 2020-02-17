import 'package:flutter/material.dart';
import 'package:pokedex_app/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      home: HomePage(),
    );
  }
}
