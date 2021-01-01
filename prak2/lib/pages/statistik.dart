import 'package:flutter/material.dart';

class Statistik extends StatefulWidget {
  const Statistik({Key key}) : super(key: key);

  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  List<String> itemIcon = [
    'eat.png',
    'spotify.png',
    'steam.png',
    'work.png',
  ];

  List<String> itemList = [
    'Makan Rp. 50.000,-',
    'Spotify Rp. 150.000,-',
    'Steam Rp. 250.000,-',
    'Work Rp. 500.000,-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.pink[100],
                child: Row(
                  children: <Widget>[
                    Image.asset('images/${itemIcon[index]}'),
                    Container(
                      margin: const EdgeInsets.only(left: 25.0),
                      child: Text('${itemList[index]}'),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
