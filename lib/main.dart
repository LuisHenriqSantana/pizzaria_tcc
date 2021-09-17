import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'pages/login/login_page.dart';
void main() {
  runApp(MyApp());

  Firestore.instance.collection('teste').add({"teste":'teste'});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return ChangeNotifierProvider(
      create: (_) => UserManager() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizzaria Busque Pizza',
        theme: ThemeData(
          primaryColor: Colors.red,
          primaryColorLight: Colors.red[900]
        ),
        home: LoginPage(),
      ),
    );
  }
}