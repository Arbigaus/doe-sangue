import 'package:doe_sangue/Models/User.dart';
import 'package:doe_sangue/Provider/Auth.dart';
import 'package:doe_sangue/Provider/Users.dart';
import 'package:doe_sangue/Routes/AppRoutes.dart';
import 'package:doe_sangue/Views/DonationPlaces/DonationPlaces.dart';
import 'package:doe_sangue/Views/FriendsList/FriendsList.dart';
import 'package:doe_sangue/Views/Profile/Profile.dart';
import 'package:doe_sangue/Views/Settings/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeStatefulWidget createState() => _HomeStatefulWidget();
}

class _HomeStatefulWidget extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  User userData;

  void checkAuth() async {
    try {
      final String userId = await Provider.of<Auth>(context, listen: false)
          .checkUserState();

      userData = await Provider.of<Users>(context, listen: false)
        .getUserdata(userId);

    } catch (e) {
      print(e);
      Navigator.pushNamed(context, AppRoutes.LOGIN);
    }
  }

  static List<Widget> _widgetOptions = <Widget>[
    Profile(),
    FriendsList(),
    DonationPlaces(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkAuth();
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red[800],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.face, color: Colors.white,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt, color: Colors.white),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.white),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(
          size: 33,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}