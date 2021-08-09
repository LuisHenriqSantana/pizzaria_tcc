import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/models/pizza.dart';

class DetailPage extends StatelessWidget {
  final Pizza pizza;

  DetailPage({this.pizza});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            children: <Widget>[
              Hero(
                child: Container(
                  width: size.width,
                  height: size.height * 0.45,
                  child: Image.asset(
                    pizza.image,
                    fit: BoxFit.fill,
                  ),
                ),
                tag: pizza.image,
              ),
              DraggableScrollableSheet(
                maxChildSize: 0.98,
                initialChildSize: 0.6,
                minChildSize: 0.6,
                builder: (context, controller) {
                  return Container(
                    padding: EdgeInsets.all(24),
                    height: size.height * 0.95,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 3),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Pizza " + pizza.name,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.local_pizza,
                                  color: Colors.red, size: 30),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "Sobre:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            pizza.description,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Text(
                            "Preço:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "R\$: " + pizza.price.toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: size.height * 0.1),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.black,
                              child: TextButton.icon(
                                label: Text("Adicionar ao Carrinho",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
