import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Api.dart';
import 'User.dart';

class Users with ChangeNotifier {
  final CollectionReference _users = Firestore.instance.collection("users");

  List<User> users;

  Future<String> createUser(User data) async{

    return _users
        .document(data.id)
        .setData({
          'name': data.name,
          'bloodType': data.bloodType,
          'avatarUrl': data.avatarUrl,
          'gender': data.gender,
          'weight': data.weight
        })
        .then((value) => data.id)
        .catchError((error) => throw(error));
  }

}