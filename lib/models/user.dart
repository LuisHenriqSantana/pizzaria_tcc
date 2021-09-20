import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  User({this.email, this.password, this.name, this.id});

  User.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    name = document.data["name"] as String;
    email = document.data["email"] as String;
  }

  String id;
  String name;
  String email;
  String password;
  String confirmPassword;
  String cep;

  Future<void> saveData() async{
    await Firestore.instance.collection('users').document(id).setData({
      'name': name,
      'email': email,
      'cep': cep,
    });
  }

} 