import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Do Learning',
      theme: ThemeData(
        primaryColor: Colors.green[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Do Learning'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8),
          child: Row(
            children: [Image.asset("images/ipa.jpg")],
          ),
        ),
      ),
    );
  }
}
