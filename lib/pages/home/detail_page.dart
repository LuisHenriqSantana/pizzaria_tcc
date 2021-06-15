import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/pizzas.dart';

class DetailPage extends StatelessWidget {
  final title;
  final Pizza pizzas;

  DetailPage({Key key, this.title, this.pizzas});

  @override
  Widget build(BuildContext context){
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: Image.asset(pizza4.image),

    ),
    );
  }
}
