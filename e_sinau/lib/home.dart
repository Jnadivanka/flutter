import 'package:e_sinau/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    "Matematika.png",
    "bahasaIndonesia.jpg",
    "bahasaInggris.jpg",
    "IPA.jpg",
    "IPS.png",
    "agamaislam.jpg",
  ];

  List<String> menuList = [
    "Matematika",
    "Bahasa Indonesia",
    "Bahasa Inggris",
    "Ilmu Pengetahuan Alam",
    "Ilmu Pengetahuan Sosial",
    "Agama Islam",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
              child: Icon(
                Icons.account_circle,
                size: 26.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent,
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
              color: Colors.cyan[80],
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.all(12.0),
                    child: Image.asset('images/${imageList[index]}'),
                  ),
                  Column(
                    children: <Widget>[Text("${menuList[index]}")],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
