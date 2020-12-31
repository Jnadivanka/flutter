import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/statistik.dart';
import 'pages/tabungan.dart';
import 'pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prak-2',
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedMenu = 0;
 
  final List<Widget> _page = <Widget>[
    Home(),
    Statistik(),
    Tabungan(),
    Profile(),
  ];

  void _onMenuTapped(int index) {
    setState(() {
      _selectedMenu = index;
    });
  }

  final warnaIcons = Color.fromRGBO(34, 48, 92, 100);
  final backgroundColor = Colors.pink[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: warnaIcons,
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                size: 26.0,
                color: warnaIcons,
              ),
            ),
          ),
        ],
      ),
      body: _page[_selectedMenu],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Statistik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Dompet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedMenu,
        selectedItemColor: Colors.pink[100],
        unselectedItemColor: warnaIcons,
        showUnselectedLabels: true,
        onTap: _onMenuTapped,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
    );
  }
}
