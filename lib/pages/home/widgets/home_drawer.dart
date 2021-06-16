import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/pages/login/login_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset('images/logo.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            trailing: Icon(Icons.subdirectory_arrow_left_rounded, color: Colors. red, size: 30,),
            title: Text("Voltar à tela de login",
              style: TextStyle(fontSize: 20),
            ),
            onTap:  () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginPage())),
          ),
        ],
      ),
    );
  }
}