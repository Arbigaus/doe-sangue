import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String avatarUrl;
  final String bloodType;
  final String gender;
  final String weight;
  final String lastDonation;
  final String nextDonation;

  const User({
    this.id,
    @required this.name,
    @required this.avatarUrl,
    @required this.bloodType,
    @required this.gender,
    @required this.weight,
    this.lastDonation,
    this.nextDonation
  });

}