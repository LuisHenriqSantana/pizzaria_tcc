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
            trailing: Icon(Icons.sensor_door_outlined),
            title: Text("Voltar à tela de login",
              style: TextStyle(fontSize: 20),
            ),
            onTap:  () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginPage())),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, size.width * 0.6, 0),
            child: ListTile(
              title: Icon(Icons.sensor_door_outlined,
              ),
              onTap:  () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage())),
            ),
          ),
        ],
      ),
    );
  }
}