import 'package:doe_sangue/Models/Friend.dart';
import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final Friend friend;
  const FriendTile(this.friend);

  @override
  Widget build(BuildContext context) {
    final avatar = friend.avatarUrl==null || friend.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(friend.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(friend.name),
      subtitle: Text("Ultima doação"),
      trailing: Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                friend.bloodType,
                textAlign: TextAlign.end,
              ),
              Text(friend.donationDate)
            ],
          )
      ),
    );
  }

}