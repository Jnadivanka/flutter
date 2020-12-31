import 'package:flutter/material.dart';
import 'package:ngojek/constant.dart';
import 'package:ngojek/launcher/launcher_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ngojek',
      theme: new ThemeData(
        primaryColor: NgojekPalette.green,
        accentColor: NgojekPalette.green,
      ),
      home: LauncherPage(),
    );
  }
}
