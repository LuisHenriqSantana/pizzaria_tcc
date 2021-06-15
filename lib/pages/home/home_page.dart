import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/models/pizzas.dart';
import 'package:pizzaria_tcc/pages/cart/cart_page.dart';
import 'package:pizzaria_tcc/pages/home/widgets/cardapio.dart';

import 'widgets/home_drawer.dart';


class HomePage extends StatelessWidget {
  final Pizza pizza;


  HomePage({this.pizza});

  @override  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: Text('Busque Pizza',
            style: TextStyle(color: Colors.black, fontSize: 30)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartPage())),
          ),
        ],
      ),
      drawer: HomeDrawer(size: size),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Pizzas mais populares",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 0.9 / 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: ClipRRect(
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                pizzaNames[index],
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, _) => SizedBox(
                      width: size.width * 0.02,
                    ),
                    itemCount: 3,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.4,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    "Cardápio",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Cardapio(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}