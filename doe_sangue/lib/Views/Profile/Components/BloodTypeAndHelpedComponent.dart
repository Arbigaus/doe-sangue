import 'package:doe_sangue/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodTypeAndHelpedComponent extends StatelessWidget {
  final User userData;
  BloodTypeAndHelpedComponent(this.userData);

  static const TextStyle bloodTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const TextStyle titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black54
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                    children: <Widget>[
                      Text(
                        userData.bloodType,
                        style: bloodTextStyle,
                      ),
                      Text(
                        "Tipo Sanguíneo",
                        style: titleStyle,
                      ),
                    ]
                ),
              ),
              VerticalDivider(
                color: Colors.black54,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                    children: <Widget>[
                      Text(
                        "10",
                        style: bloodTextStyle,
                      ),
                      Text(
                        "Pessoas Ajudadas",
                        style: titleStyle,
                      ),
                    ]
                ),
              )
            ],
          ),
        )
    );
  }
}