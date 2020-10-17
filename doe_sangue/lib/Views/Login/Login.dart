import 'package:doe_sangue/Components/BloodButton.dart';
import 'package:doe_sangue/Components/InputField.dart';
import 'package:doe_sangue/Routes/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatelessWidget {
  final _login = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
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
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          InputField('Email', _login, _formData),
                          InputField('Senha', _login, _formData),
                          BloodButton('Entrar', () => {
                            Navigator.pushReplacementNamed(context, AppRoutes.HOME)
                          }),
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
                ),
              )
            )
          ],
        ),
    );
  }
}