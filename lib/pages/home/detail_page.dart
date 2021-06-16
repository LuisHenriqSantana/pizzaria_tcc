import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/pizza.dart';

class DetailPage extends StatelessWidget {
  final Pizza pizza;

  DetailPage({this.pizza});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Sobre"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(3),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: size.height * 0.3,
                width: size.width * 1,
                child: Image.asset(
                  pizza.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    pizza.description,
                    style: TextStyle(fontSize: 30, fontFamily: 'Dancing Script',color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
