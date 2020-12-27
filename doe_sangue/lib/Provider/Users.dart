import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/User.dart';

class Users with ChangeNotifier {
  final CollectionReference _users = Firestore.instance.collection("users");

  User userData;

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

  Future<User> fetchUserdata(String documentID) async {
    try {
      DocumentSnapshot documentSnapshot = await _users.document(documentID).get();
      Map<String, dynamic> data = documentSnapshot.data;
      User user = User(
          name: data['name'],
          avatarUrl: data['avatarUrl'],
          bloodType: data['bloodType'],
          gender: data['gender'],
          weight: data['weight'],
          lastDonation: data['lastDonation'],
          nextDonation: data['nextDonation']
      );
      userData = user;
      return user;
    } catch (e) {
      throw(e);
    }

  }

  User getUserData() {
    return userData;
  }
}