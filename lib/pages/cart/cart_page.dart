import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/pages/home/home_page.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Suas Compras'),
      ),
      body: Stack(
        children:[
          Column(
            children:[ Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: "images/calabresa.jpg",
                      child: Image(
                        height: size.height * 0.15,
                        width: size.width * 0.4,
                        image: AssetImage("images/calabresa.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Pizza de calabresa",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                GestureDetector(
                                  onTap:(){},
                                  child: Text(' - ',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0,),
                                Text("1",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600
                                  ),),
                                SizedBox(width: 20.0,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text(' + ',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600
                                    ),),
                                ),

                              ],

                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
         ] ),
          Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black,
              child: TextButton.icon(
                label: Text("Confirmar Pedido",
                    style: TextStyle(
                        fontSize: 20, color: Colors.white)),
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => HomePage())),
              ),
            ),
          ),
        ),
     ] ),
    );
  }
}
