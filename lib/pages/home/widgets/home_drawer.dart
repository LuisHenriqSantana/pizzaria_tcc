import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/pages/login/login_page.dart';
import 'package:pizzaria_tcc/models/user_manager.dart';
import 'package:provider/provider.dart';

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
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.red[200],
            ], begin: Alignment.bottomCenter, end: Alignment.topRight),
          ),
          child: Consumer<UserManager>(
            builder: (_, userManager, __) {
              return ListView(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '8 Pedaços ',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            Icon(Icons.local_pizza),
                            Icon(Icons.local_pizza_outlined),
                            Icon(Icons.local_pizza),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Olá, ${userManager.user?.name ?? " "}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            if (userManager.user != null) {
                              userManager.signOut();
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LoginPage(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            userManager.user != null
                                ? "Sair"
                                : "Entre ou cadastre-se >",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    trailing: Icon(
                      Icons.shopping_cart,
                      color: Colors.red,
                      size: 30,
                    ),
                    title: Text(
                      "Carrinho",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginPage())),
                  ),
                ],
              );
            },
          )),
    );
  }
}
