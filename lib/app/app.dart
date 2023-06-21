import 'package:acourse/presentation/resource/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();
 static MyApp _instance = MyApp._internal();
  factory MyApp()=> _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ahmed',
          style: TextStyle(
           fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800
          ),
        ),
      ),
    );
  }
}

