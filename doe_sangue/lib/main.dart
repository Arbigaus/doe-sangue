import 'package:doe_sangue/Views/Home/Home.dart';
import 'package:doe_sangue/Views/SignUp/SignUp.dart';
import 'package:doe_sangue/Views/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Auth.dart';
import 'Provider/Users.dart';
import 'Routes/AppRoutes.dart';
import 'Views/Profile/Profile.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(create: (ctx) => Auth()),
        Provider<Users>(create: (ctx) => Users())
      ],
      child: MaterialApp(
        title: 'Doe Sangue',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          AppRoutes.HOME    : (_) => Home(),
          AppRoutes.LOGIN   : (_) => Login(),
          AppRoutes.SIGN_UP : (_) => SignUp(),
          AppRoutes.PROFILE : (_) => Profile()
        }
      ),
    );
  }
}
