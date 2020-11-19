import 'package:doe_sangue/Models/Friend.dart';
import 'package:doe_sangue/Views/FriendsList/Components/FriendTile.dart';
import 'package:flutter/cupertino.dart';

class FriendsListComponent extends StatelessWidget {
  final List<Friend> friends = [
    Friend(
      id: '1',
      name: 'Tony Stark',
      avatarUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpwWPMzlLsW8-DQYO9qqON7oLIJAdUCLeT5g&usqp=CAU',
      donationDate: '12/11/2020',
      bloodType: 'B+',
    ),
    Friend(
      id: '1',
      name: 'Mey Parker',
      avatarUrl: 'https://jovemnerd.com.br/wp-content/uploads/2017/03/v-homem-aranha-marisa-tomei.jpg',
      donationDate: '12/11/2020',
      bloodType: 'A+',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: friends.length,
          itemBuilder: (ctx, i) => FriendTile(friends[i])
        )
    );
  }

}