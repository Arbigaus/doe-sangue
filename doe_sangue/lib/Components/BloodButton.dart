import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BloodButton extends StatelessWidget {
  String title;
  Function action;

  BloodButton(this.title, this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: ButtonTheme(
          height: 60,
          minWidth: 200,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.white)),
            color: Colors.white,
            onPressed: action,
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}