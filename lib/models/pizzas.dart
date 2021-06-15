class Pizza{
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;

  Pizza({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
  });
}
    final pizza0 = Pizza(
      id: 0,
      name: "Calabresa",
      description:
          "Uma pizza saborosa com Linguiça calabresa, rodelas de cebolas frescas, molho de tomate e orégano.",
      image : "images/calabresa.jpg",
      price: 20,
    );
final pizza1 = Pizza(
      id: 1,
      name: "Mussarela",
      description:
          "Uma pizza saborosa com queijo Mussarela, molho de tomate e orégano",
      image: "images/mussarela.jpg",
      price: 20,
    );
final pizza2 = Pizza(
      id: 2,
      name: "Frango com Catupiry",
      description:
          "Uma pizza saborosa com molho de tomate fresco, frango desfiado levemente temperado, cobertura de catupiry, azeitonas pretas e orégano",
      image: "images/frango.jpg",
      price: 25,
    );
final pizza3 = Pizza(
      id: 3,
      name: "Vegana",
      description:
          "Uma pizza Vegana saborosa com pimentão, cebola, champignon, azeitona preta, tomate, tomate-seco e orégano",
      image: "images/vegana.jpg",
      price: 25,
    );
final pizza4 = Pizza(
      id: 4,
      name: "Chocolate com Morango",
      description:
          "Uma pizza doce saborosa com chocolate e morangos",
      image: "images/chocolate.jpeg",
      price: 23.50,
    );

List<Pizza> pizzas =[
  pizza0,
  pizza1,
  pizza2,
  pizza3,
  pizza4,
];

final images = [
  "images/calabresa.jpg",
  "images/vegana.jpg",
  "images/frango.jpg",
  "images/mussarela.jpg",
  "images/chocolate.jpeg",
];
final names = [
  "Calabresa",
  "Vegana",
  "Frango Com Catupiry",
  "Mussarela",
  "Chocolate com morango",
];


