import 'package:doe_sangue/Components/InputFieldBorder.dart';
import 'package:doe_sangue/Views/FriendsList/Components/FriendsListComponent.dart';
import 'package:doe_sangue/Views/FriendsList/Components/HeaderComponent.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: HeaderComponent(
                'https://www.gannett-cdn.com/-mm-/cc053686530ce446f0a27dc352961fac33dd12ac/c=1144-81-2630-920/local/-/media/2017/06/26/USATODAY/USATODAY/636340759929048028-XXX-SPIDER-MAN-HOMECOMING-87249008.JPG',
                'Peter Parker',
                '05/08/2020'
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