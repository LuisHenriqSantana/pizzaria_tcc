import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/login/login_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzaria Busque Pizza',
      theme: ThemeData(
        primaryColor: Colors.red,
        primaryColorLight: Colors.red[900]
      ),
      home: LoginPage(),
    );
  }
}