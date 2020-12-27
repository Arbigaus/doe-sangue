import 'package:doe_sangue/Components/InputFieldBorder.dart';
import 'package:doe_sangue/Models/User.dart';
import 'package:doe_sangue/Provider/Users.dart';
import 'package:doe_sangue/Views/FriendsList/Components/FriendsListComponent.dart';
import 'package:doe_sangue/Views/FriendsList/Components/HeaderComponent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User userData;
    void getUserData() async {
      userData = Provider.of<Users>(context, listen: false).getUserData();
    }
    getUserData();

    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: HeaderComponent(
                userData.avatarUrl,
                userData.name,
                userData.lastDonation ?? ''
            )
          ),
          Expanded(
            flex: 3,
            child: FriendsListComponent()
          )
        ],
      ),
    );
  }
}