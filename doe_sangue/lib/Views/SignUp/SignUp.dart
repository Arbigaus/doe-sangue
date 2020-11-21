import 'package:doe_sangue/Components/BloodButton.dart';
import 'package:doe_sangue/Components/InputField.dart';
import 'package:doe_sangue/Models/LoginData.dart';
import 'package:doe_sangue/Provider/Auth.dart';
import 'package:doe_sangue/Models/User.dart';
import 'package:doe_sangue/Provider/Users.dart';
import 'package:doe_sangue/Routes/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import 'components/SelectBlood.dart';
import 'components/SelectGender.dart';

class SignUp extends StatelessWidget {
  final _signUp = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {

    createUser(String id) async {
      try {
        final user = User(
            id: id,
            name: _formData['name'],
            avatarUrl: 'https://lorempixel.com/400/400/people/',
            bloodType: _formData['bloodType'],
            gender: _formData['gender'],
            weight: '72');
        final String createdUser = await Provider.of<Users>(context, listen: false)
            .createUser(user);
        print(createdUser);
      } catch (e) {
        print(e);
      }
    }

    void onPressedSignUpButton() async {
      try {
        final String userId = await Provider.of<Auth>(context, listen: false)
            .register(LoginData(email: _formData['email'],
            password: _formData['password']));
        createUser(userId);
        Navigator.pushNamed(context, AppRoutes.HOME);

      } catch (e) {
        print(e);
        // await _showMyDialog();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset : false,
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
                                    InputField('Nome', (value) => _formData['name'] = value)),
                            SizedBox(
                                child: InputField(
                                    'Email',  (value) => _formData['email'] = value)),
                            SizedBox(
                                child: InputField(
                                    'Senha', (value) => _formData['password'] = value)),
                            SelectGender((value) => _formData['gender'] = value),
                            SelectBlood((value) => _formData['bloodType'] = value),
                            BloodButton('Finalizar', onPressedSignUpButton)
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
