import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/pizzas.dart';
import '../detail_page.dart';

class Cardapio extends StatelessWidget {
   Cardapio({
    this.pizza,
  });

  final Pizza pizza;

  final images = [
    "images/chocolate.jpeg",
    "images/mussarela.jpg",
    "images/frango.jpg",
    "images/vegana.jpg",
    "images/calabresa.jpg",
  ];

   final pizzaNames = [
     "Calabresa",
     "Vegana",
     "Frango Com Catupiry",
     "Mussarela",
     "Chocolate com morango",
   ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white12,
      height: size.height * 0.55,
      child: ListView.separated(
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: images[4 - index],
                child: Image(
                  height: 110.0,
                  width: 160.0,
                  image: AssetImage(images[4 - index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(pizzaNames[index],
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                child: IconButton(
                  onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => DetailPage(title: pizzaNames[index],))),
                  icon: Icon(Icons.add_circle, color: Colors.red),
                ))
          ]);
        },
        separatorBuilder: (context, _) => SizedBox(
          height: size.height * 0.01,
        ),
        itemCount: images.length,
      ),
    );
  }
}
