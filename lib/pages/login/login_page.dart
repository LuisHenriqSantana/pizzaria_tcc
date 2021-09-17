import 'package:pizzaria_tcc/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria_tcc/helpers/validators.dart';
import 'package:pizzaria_tcc/models/user.dart';
import 'package:pizzaria_tcc/models/user_manager.dart';
import 'package:pizzaria_tcc/pages/signup/signup_page.dart';
import 'package:pizzaria_tcc/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Logo(size: size),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Consumer<UserManager>(
                builder: (_, userManager, __){
                  return Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          enabled: !userManager.loading,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email) {
                            if (!emailValid(email)) return 'E-mail inválido';
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 32),
                          child: TextFormField(
                            controller: passController,
                            enabled: !userManager.loading,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              icon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            obscureText: true,
                            autocorrect: false,
                            validator: (pass) {
                              if (pass.isEmpty || pass.length < 6)
                                return 'Senha Inválida';
                              return null;
                            },
                          ),
                        ),
                        TextButton.icon(
                          onPressed: userManager.loading ? null : () {
                            if (formKey.currentState.validate()) {
                              print(emailController.text);
                              userManager.signIn(
                                user: User(
                                    email: emailController.text,
                                    password: passController.text),
                                onFail: (e) {
                                  scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text("Falha ao entrar: $e"),
                                    backgroundColor: Colors.red,

                                  ));
                                },
                                onSuccess: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage())),
                              );

                            }
                          },
                          label:Text('Entrar'.toUpperCase()),
                          icon: Icon(Icons.exit_to_app),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextButton.icon(
                          onPressed: () => Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => SignUpPage())),
                          icon: Icon(Icons.person),
                          label: Text('Criar Conta'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
