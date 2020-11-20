import 'package:doe_sangue/Components/BloodButton.dart';
import 'package:doe_sangue/Components/InputField.dart';
import 'package:doe_sangue/Models/LoginData.dart';
import 'package:doe_sangue/Provider/Auth.dart';
import 'package:doe_sangue/Routes/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final _login = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {

    void onPressedSignInButton() async {
      print(_formData['email']);
      await Provider.of<Auth>(context, listen: false)
          .signIn(LoginData(email: _formData['email'],
          password: _formData['password']));
    }

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Image.asset('Images/BloodBag1.png'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: new BoxDecoration(color: Colors.red),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Form(
                    key: _login,
                      child: Column(
                        children: <Widget>[
                          InputField('Email', (value) => _formData['email'] = value ),
                          InputField('Senha', (value) => _formData['password'] = value ),
                          BloodButton('Entrar', onPressedSignInButton),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                              child: Column(
                                children: <Widget>[
                                  FlatButton(
                                    child: Text('Cadastrar'),
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(context, AppRoutes.SIGN_UP);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Esqueci a senha'),
                                    textColor: Colors.white,
                                    onPressed: () {  },
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                  ),
                ),
              )
            )
          ],
        ),
    );
  }
}