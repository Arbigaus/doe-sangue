import 'package:doe_sangue/Components/InputFieldBorder.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderComponent extends StatelessWidget {
  String imageUrl;
  String userName;
  String lastDonationDate;

  HeaderComponent(this.imageUrl, this.userName, this.lastDonationDate);

  final _searchFriend = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final avatar = imageUrl==null || imageUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person), minRadius: 60,)
        : CircleAvatar(backgroundImage: NetworkImage(imageUrl), minRadius: 60,);

    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: avatar,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(userName, style: nameStyle),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text("Ultima doação", style: donationLabel),
                                Text(lastDonationDate, style: donationDate)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
          InputFieldBorder("Procurar amigo", _searchFriend, _formData)
        ],
      ),
    );
  }

  static const TextStyle nameStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: Colors.black
  );

  static const TextStyle donationLabel = TextStyle(
    fontSize: 16,
    color: Colors.black54
  );

  static const TextStyle donationDate = TextStyle(
    fontSize: 16,
    color: Colors.black
  );
}