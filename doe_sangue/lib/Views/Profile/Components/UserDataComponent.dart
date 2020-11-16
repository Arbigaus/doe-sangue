import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDataComponent extends StatelessWidget {

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
            UserDataListItem("Sexo", "Masculino"),
            UserDataListItem("Peso", "85kg"),
            UserDataListItem("Idade", "23 Anos"),
            Divider(
              color: Colors.black54,
              thickness: 2,
            ),
            UserDataListItem("Ultima Doação", "27/03/2020"),
            UserDataListItem("PRóxima Doação", "27/05/2020")
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