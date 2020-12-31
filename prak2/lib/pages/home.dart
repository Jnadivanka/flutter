import 'package:flutter/material.dart';
import 'statistik.dart';
import 'tabungan.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imageList = [
    "wallet.png",
    "profile.png",
    "cart.png",
    "list.png",
    "backup.png",
    "chart.png",
  ];

  List<String> menuList = [
    "Dompet Anda",
    "Edit Account",
    "Add List Shop",
    "List Outcome",
    "Backup Data",
    "Chart Progress Income",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.pink[100],
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.all(15.0),
                      child: Image.asset('images/${imageList[index]}'),
                    ),
                    Column(
                      children: <Widget>[
                        Text("${menuList[index]}"),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      
    );
  }
}
