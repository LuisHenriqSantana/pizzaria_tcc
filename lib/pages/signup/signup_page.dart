import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/helpers/validators.dart';
import 'package:pizzaria_tcc/models/user.dart';
import 'package:pizzaria_tcc/models/user_manager.dart';
import 'package:pizzaria_tcc/pages/home/home_page.dart';
import 'package:pizzaria_tcc/pages/login/login_page.dart';
import 'package:pizzaria_tcc/widgets/logo.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
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
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome Completo',
                        icon: Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (name) {
                        if (name.isEmpty)
                          return "Campo Obrigatório";
                        else if (name.trim().split(" ").length <= 1)
                          return "Preencha seu nome completo";
                        return null;
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CEP',
                        icon: Icon(
                          Icons.library_books_sharp,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (cep) {
                        if (cep.isEmpty)
                          return "Campo Obrigatório";
                        else if (cep.length == 8) return null;
                        return "Seu CEP precisa ter 8 dígitos";
                      },
                      onSaved: (cep) => user.cep = cep,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        icon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email.isEmpty)
                          return "Campo Obrigatório";
                        else if (!emailValid(email)) return "E-mail inválido";
                        return null;
                      },
                      onSaved: (email) => user.email = email,
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
                      validator: (pass) {
                        if (pass.isEmpty)
                          return "Campo Obrigatório";
                        else if (pass.length < 6) return "Senha muito curta";
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Repita a senha',
                        icon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty)
                          return "Campo Obrigatório";
                        else if (pass.length < 6) return "Senha muito curta";
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextButton.icon(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          if (user.password != user.confirmPassword) {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Senhas não coincidem"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          context.read<UserManager>().signUp(
                              user: user,
                            onSuccess: ()=> Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage())),
                            onFail: (e){
                                scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text("Falha ao cadastrar: $e"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                            }
                          );
                        }
                      },
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
