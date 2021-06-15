import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Suas Compras'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: Text('Seu carrinho está vazio.',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black26
              ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
