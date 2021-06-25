import 'package:pizzaria_tcc/models/pizza.dart';

final _calabresa = Pizza(
  id: 0,
  name: "De Calabresa",
  description:
      "Uma pizza saborosa com Linguiça calabresa, rodelas de cebolas frescas, molho de tomate e orégano.",
  image: "images/calabresa.jpg",
  price: 20.00,
);
final _mussarela = Pizza(
  id: 1,
  name: "De Mussarela",
  description:
      "Uma pizza saborosa com queijo Mussarela, molho de tomate e orégano",
  image: "images/mussarela.jpg",
  price: 20,
);
final _frangoCat = Pizza(
  id: 2,
  name: "De Frango com Catupiry",
  description:
      "Uma pizza saborosa com molho de tomate fresco, frango desfiado levemente temperado, cobertura de catupiry, azeitonas pretas e orégano",
  image: "images/frango.jpg",
  price: 25,
);
final _vegana = Pizza(
  id: 3,
  name: "Vegana",
  description:
      "Uma pizza Vegana saborosa com pimentão, cebola, champignon, azeitona preta, tomate, tomate-seco e orégano",
  image: "images/vegana.jpg",
  price: 25,
);
final _chocolate = Pizza(
  id: 4,
  name: "De Chocolate com Morango",
  description: "Uma pizza doce saborosa com chocolate e morangos",
  image: "images/chocolate.jpeg",
  price: 23.50,
);

List<Pizza> pizzas = [
  _calabresa,
  _mussarela,
  _frangoCat,
  _vegana,
  _chocolate,
];

final images = [
  "images/calabresa.jpg",
  "images/mussarela.jpg",
  "images/vegana.jpg",
  "images/frango.jpg",
  "images/chocolate.jpeg",
];
final names = [
  "Calabresa",
  "Mussarela",
  "Pizza Vegana",
  "Frango Com Catupiry",
  "Chocolate com morango",
];