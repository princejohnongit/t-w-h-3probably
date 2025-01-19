import 'package:flutter/material.dart';
import '../pages/Home.dart';
import '../pages/Profile.dart';
import '../pages/Calender.dart';
import '../pages/Chat.dart';
import '../../utils/StorageHelper.dart';
import '../pages/umi.dart';
class Navbar extends StatefulWidget {
  final StorageHelper storage;
  final Map<String, dynamic> data;

  const Navbar({super.key, required this.storage, required this.data});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
    CalendarPage(),
    ChatPage(),
    UMIPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUser = widget.data['loggedInUser'];

    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.verified_user), // Icon for the UMI page
            label: 'UMI',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
