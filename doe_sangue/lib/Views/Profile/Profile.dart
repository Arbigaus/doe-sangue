import 'package:doe_sangue/Models/User.dart';
import 'package:doe_sangue/Provider/Users.dart';
import 'package:doe_sangue/Views/Profile/Components/BloodTypeAndHelpedComponent.dart';
import 'package:doe_sangue/Views/Profile/Components/ProfileUserComponent.dart';
import 'package:doe_sangue/Views/Profile/Components/UserDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
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
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ProfileUserComponent(
                    userData.name ?? "",
                    userData.avatarUrl ?? "")
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        BloodTypeAndHelpedComponent(userData),
                        UserDataComponent(userData)
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }

  static const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

}
