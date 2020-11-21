import 'package:doe_sangue/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDataComponent extends StatelessWidget {
  final User userData;
  UserDataComponent(this.userData);

  static const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: <Widget>[
            UserDataListItem("Sexo", userData.gender == 'M' ? 'Masculino' : 'Feminino'),
            UserDataListItem("Peso", userData.weight),
            UserDataListItem("Idade", "33 Anos"),
            Divider(
              color: Colors.black54,
              thickness: 2,
            ),
            UserDataListItem("Ultima Doação", userData.lastDonation ?? ""),
            UserDataListItem("PRóxima Doação", userData.nextDonation ?? "")
          ],
        ),
      )
    );
  }
}

// ignore: must_be_immutable
class UserDataListItem extends StatelessWidget {
  String title;
  String value;

  UserDataListItem(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: titleStyle),
          Text(value, style: valueStyle)
        ],
      ),
    );
  }

  static const TextStyle valueStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  static const TextStyle titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black54
  );

}