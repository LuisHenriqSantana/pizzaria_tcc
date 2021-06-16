import 'package:pizzaria_tcc/models/pizza.dart';

class Order {
  final Pizza pizza;
  final int id;
  final double price;

  Order({
    this.pizza,
    this.id,
    this.price
  });
}