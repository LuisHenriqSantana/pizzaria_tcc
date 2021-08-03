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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.orange.shade300,
                Colors.orange.shade50,
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter
          ),
        ),
        child: ListView(
          children:[
            DrawerHeader(
              child: Row(
                children: [
                  Text(
                    '8 Pedaços ', style: TextStyle(fontSize: 40,),
                  ),
                  Icon(Icons.local_pizza),
                  Icon(Icons.local_pizza_outlined),
                  Icon(Icons.local_pizza),
                ],
              ),
              ),
            ListTile(
              trailing: Icon(Icons.subdirectory_arrow_left_rounded, color: Colors. red, size: 30,),
              title: Text("Sair",
                style: TextStyle(fontSize: 20),
              ),
              onTap:  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage())),
            ),
            ListTile(
              trailing: Icon(Icons.shopping_cart, color: Colors. red, size: 30,),
              title: Text("Carrinho",
                style: TextStyle(fontSize: 20),
              ),
              onTap:  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage())),
            ),
          ],
        ),
      ),
    );
  }
}