import 'package:flutter/cupertino.dart';

class LoginData {
  final String id;
  final String email;
  final String password;

  const LoginData({
    this.id,
    @required this.email,
    @required this.password
  });
}