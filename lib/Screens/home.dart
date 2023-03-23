import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/Screens/home_messages.dart';
import 'package:sociolite/Screens/home_posts.dart';
import 'package:sociolite/Screens/home_profile.dart';
import 'package:sociolite/Screens/home_search.dart';
import 'package:sociolite/utils/themes.dart';
import '../providers/main_user_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Posts(),
    Messages(),
    Search(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false);
    return Material(
      child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: MyTheme.containerColorSecondary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          backgroundColor: MyTheme.primary,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyTheme.icon1,
            unselectedItemColor: MyTheme.icon1,
            showUnselectedLabels: false,
            backgroundColor: MyTheme.primary,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.text_bubble), label: "Message"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: "Profile"),
            ],
          )),
    );
  }
}
