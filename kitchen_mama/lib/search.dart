import 'package:flutter/material.dart';
import 'package:kitchen_mama/main.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController cari1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen Mama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: cari1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12.0),
                border: OutlineInputBorder(),
                labelText: 'Masak Apa hari ini?',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ignore: always_specify_types
               final Future push = Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return MyHomePage();
                }));
              },
              child: const Text('Cari'),
            ),
          ],
        ),
      ),
    );
  }
}
