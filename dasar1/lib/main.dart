import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sekolah Cerdas'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text('List Mata Pelajaran'),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 80.0,
                      height: 80.0,
                      color: Colors.grey[500],
                      child: Text(
                        'Ilmu Pengetahuan Alam',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 80.0,
                      height: 80.0,
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      color: Colors.orangeAccent,
                      child: Text(
                        'Bahasa Indonesia',
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 80.0,
                      height: 80.0,
                      color: Colors.teal[400],
                      child: Text(
                        'Matematika',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text('Siswa Prestasi'),
              ),
              Container(
                  child: Image(
                image: AssetImage('images/ipa.jpeg'),
              )),
              Container(
                child: Image(
                  image: AssetImage('images/math.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
