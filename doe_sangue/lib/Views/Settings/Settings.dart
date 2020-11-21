import 'package:doe_sangue/Models/User.dart';
import 'package:doe_sangue/Provider/Users.dart';
import 'package:doe_sangue/Views/Settings/Components/SettingsHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {

  static const TextStyle buttonStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    User userData;
    void getUserData() async {
      userData = Provider.of<Users>(context, listen: false).getStorageUserData();
    }
    getUserData();

    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.red[800]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: SettingsHeader(
                userData.name,
                userData.avatarUrl)
              ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Container()),
                    Expanded(child: Center(
                        child: Text("Informações para doar", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Editar perfil", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Sobre", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Sair", style: buttonStyle, textAlign: TextAlign.center))),
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