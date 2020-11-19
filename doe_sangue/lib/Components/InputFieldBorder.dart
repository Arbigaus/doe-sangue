
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFieldBorder extends StatelessWidget {
  GlobalKey _key;
  Map<String, String> _formData;
  String placeholder;

  InputFieldBorder(this.placeholder, this._key, this._formData);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 60,
          decoration: new BoxDecoration(
            color: Colors.red[50],
            borderRadius: new BorderRadius.all(Radius.circular(40)),
            border: Border.all(
                width: 1,
                color: Colors.red[600]
              )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: placeholder,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none
              ),
              onSaved: (value) => _formData['email'] = value,
            ),
          ),
        ),
      ],
    );
  }

}