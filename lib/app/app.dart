import 'package:acourse/presentation/resource/routes_manager.dart';
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
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}


