import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/pages/home/home_page.dart';
import 'package:pizzaria_tcc/pages/login/login_page.dart';
import 'package:pizzaria_tcc/widgets/logo.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Logo(size: size),
            Text(
              'Cadastre-se',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        icon: Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        icon: Icon(
                          Icons.library_books_sharp,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        icon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextButton.icon(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage())),
                      icon: Icon(Icons.person),
                      label: Text('Criar Conta'),
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton.icon(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginPage())),
                      label: Text('Já tem uma conta? Faça login'.toUpperCase()),
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
