import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final title;
  final images;
  final descriptions;

  DetailPage({Key key, this.title, this.images, this.descriptions});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(3),
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.3,
                width: size.width * 1,
                child: Image.asset(
                  images,
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
                    descriptions,
                    style: TextStyle(fontSize: 30, fontFamily: 'Dancing Script',color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
