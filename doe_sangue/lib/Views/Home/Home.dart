import 'package:doe_sangue/Views/FriendsList/FrindsList.dart';
import 'package:doe_sangue/Views/Profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeStatefulWidget createState() => _HomeStatefulWidget();

}

class _HomeStatefulWidget extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Profile(),
    FriendsList(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[800],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.face, color: Colors.white,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.white),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(
          size: 32,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}