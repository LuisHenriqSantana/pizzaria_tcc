import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/pizzas.dart';

class DetailPage extends StatelessWidget {
  final title;
  final images;
  final Pizza pizzas;

  DetailPage({Key key, this.title, this.pizzas, this.images});

  @override
  Widget build(BuildContext context){

    //final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        child: Image.asset(images),

    ),
    );
  }
}
