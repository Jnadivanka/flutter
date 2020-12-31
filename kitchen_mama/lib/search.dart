import 'package:flutter/material.dart';
import 'package:kitchen_mama/main.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen Mama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12.0),
                border: OutlineInputBorder(),
                labelText: "Masak Apa hari ini?",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              },
              child: Text("Cari"),
            ),
          ],
        ),
      ),
    );
  }
}
