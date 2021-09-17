import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizzaria_tcc/helpers/validators.dart';
import 'package:pizzaria_tcc/pages/login/login_page.dart';
import 'package:pizzaria_tcc/widgets/logo.dart';

class SignUpPage extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      validator: (name){
                        if(name.isEmpty)
                        return "Campo Obrigatório";
                        else if (name.trim().split(" ").length <=1)
                          return "Preencha seu nome completo";
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Telefone ex: (11) 9999-9999',
                        icon: Icon(
                          Icons.call,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (phone){
                        if(phone.isEmpty)
                          return "Campo Obrigatório";
                        else if (phone.length <9)
                          return "Número de telefone inválido";
                        return null;
                      },
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
                      validator: (cep){
                        if(cep.isEmpty)
                          return "Campo Obrigatório";
                        else if(cep.length == 8)
                          return null;
                        return "Seu CEP precisa ter 8 dígitos";
                      },
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
                      validator: (email){
                        if(email.isEmpty)
                          return "Campo Obrigatório";
                        else if(!emailValid(email))
                          return "E-mail inválido";
                        return null;
                      },
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
                      validator: (pass){
                        if(pass.isEmpty)
                          return "Campo Obrigatório";
                        else if(pass.length < 6)
                        return "Senha muito curta";
                        return null;
                      },
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
                      validator: (pass){
                        if(pass.isEmpty)
                          return "Campo Obrigatório";
                        else if(pass.length < 6)
                          return "Senha muito curta";
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextButton.icon( onPressed: (){
                      formKey.currentState.validate();
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
