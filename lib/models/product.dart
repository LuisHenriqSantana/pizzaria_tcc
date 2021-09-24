import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  Product.fromDocument(DocumentSnapshot document){

    id = document.documentID;
    name = document["name"] as String;
    description = document["description"] as String;
    image = document["images"] as String;
  }

  String id;
  String name;
  String description;
  String image;
}