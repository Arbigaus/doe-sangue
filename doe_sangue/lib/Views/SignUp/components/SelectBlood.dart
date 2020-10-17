import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectBlood extends StatelessWidget {
  var bloodList = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  Widget createButton(String label) {
    return Container(
      margin: EdgeInsets.all(12),
      child: ButtonTheme(
        height: 65,
        minWidth: 65,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.5),
              side: BorderSide(color: Colors.white)),
          color: Colors.white,
          onPressed: () => {print(label)},
          child: Text(
            label,
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> strings) {
    return new Wrap(
        children: strings.map((item) => createButton(item)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Selecione o tipo sanguíneo',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: getTextWidgets(bloodList)),
        ],
      ),
    );
  }
}
