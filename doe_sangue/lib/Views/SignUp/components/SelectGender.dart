import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectGender extends StatelessWidget {

  Widget createButton(String gender) {
    return Container(
      margin: EdgeInsets.all(12),
      child: ButtonTheme(
        height: 80,
        minWidth: 80,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Colors.white)),
          color: Colors.white,
          onPressed: () => {},
          child: Image.asset(
              'Images/gender$gender.png',
              width: 50,
              height: 50,
          )
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Selecione o gênero',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createButton('M'),
              Container(
                width: 2,
                height: 90,
                decoration: new BoxDecoration(color: Colors.white),
              ),
              createButton('F'),
            ],
          )
        ],
      ),
    );
  }

}