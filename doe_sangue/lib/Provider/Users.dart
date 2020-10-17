import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, String> _items = {'1': "test"};

  List<String> get all {
    return [..._items.values];
  }

}