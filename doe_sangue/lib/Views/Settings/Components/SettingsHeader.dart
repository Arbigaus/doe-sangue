import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  String userName;
  String imageUrl;

  SettingsHeader(this.userName, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final avatar = imageUrl==null || imageUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person), minRadius: 150,)
        : CircleAvatar(backgroundImage: NetworkImage(imageUrl), minRadius: 150,);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: avatar,
              ),
            ),
          ),
          Expanded(
              child: Text(
                userName,
                style: nameStyle,
              )
          )
        ],
      ),
    );
  }

  static const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

}