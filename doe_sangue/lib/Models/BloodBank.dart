import 'package:flutter/material.dart';

class BloodBank {
  final String id;
  final String title;
  final String phone;
  final String map;
  final String address;
  final String lat;
  final String long;

  const BloodBank({
    this.id,
    @required this.title,
    @required this.phone,
    @required this.map,
    @required this.address,
    @required this.lat,
    @required this.long
  });

}