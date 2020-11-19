import 'package:flutter/material.dart';

class Friend {
  final String id;
  final String name;
  final String avatarUrl;
  final String donationDate;
  final String bloodType;

  const Friend({
    this.id,
    @required this.name,
    @required this.avatarUrl,
    @required this.donationDate,
    @required this.bloodType
  });

}