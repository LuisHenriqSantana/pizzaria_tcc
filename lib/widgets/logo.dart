

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.32,
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 4,
            color: Colors.red,
          ),
        ],
      ),
      child: Image(
        image: AssetImage("images/logo2.jpeg"),
        fit: BoxFit.cover,
      ),
    );
  }
}
