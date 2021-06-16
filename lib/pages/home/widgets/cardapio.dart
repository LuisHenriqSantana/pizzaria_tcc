import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/data/data.dart';
import 'package:pizzaria_tcc/models/pizza.dart';
import '../detail_page.dart';

class Cardapio extends StatefulWidget {
  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  _buildPizzas() {
    List<Widget> pizzaList = [];
    pizzas.forEach((Pizza pizza) {
      final size = MediaQuery.of(context).size;
      pizzaList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(pizza: pizza),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.red,
            ),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: pizza.image,
                  child: Image(
                    height: size.height * 0.15,
                    width: size.width * 0.4,
                    image: AssetImage(pizza.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          pizza.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
              ))
            ],
          ),
        ),
      ));
    });
    return Column(children: pizzaList);
  }
  @override
  Widget build(BuildContext context) {
    return _buildPizzas();
  }
}
