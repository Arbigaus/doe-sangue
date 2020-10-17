import 'package:doe_sangue/Components/BloodButton.dart';
import 'package:doe_sangue/Components/InputField.dart';
import 'package:doe_sangue/Routes/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'components/SelectBlood.dart';
import 'components/SelectGender.dart';

class SignUp extends StatelessWidget {
  final _signUp = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Image.asset('Images/BloodHeart.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: new BoxDecoration(color: Colors.red),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
                      child: Form(
                        key: _signUp,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 18),
                              child: Text('Seja um Doador',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white)),
                            ),
                            SizedBox(
                                child:
                                    InputField('Nome', _signUp, _formData)),
                            SizedBox(
                                child: InputField(
                                    'Email', _signUp, _formData)),
                            SizedBox(
                                child: InputField(
                                    'Senha', _signUp, _formData)),
                            SelectGender(),
                            SelectBlood(),
                            BloodButton(
                                'Finalizar', () => {
                                Navigator.pushReplacementNamed(context, AppRoutes.HOME)
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
              ],
            ),
          );
        }),
    );
  }
}
