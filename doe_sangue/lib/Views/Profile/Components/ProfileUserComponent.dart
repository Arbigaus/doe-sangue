import 'package:flutter/material.dart';

class ProfileUserComponent extends StatelessWidget {
  String userName;
  String imageUrl;

  ProfileUserComponent(this.userName, this.imageUrl);
  
  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.fitHeight
                    )
                ),
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