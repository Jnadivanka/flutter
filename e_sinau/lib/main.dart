import 'package:e_sinau/home.dart';
import 'package:e_sinau/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(
        title: 'Login',
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: input1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12.0),
                border: OutlineInputBorder(),
                labelText: "Username",
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: input2,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  border: OutlineInputBorder(),
                  labelText: "Password"),
            ),
            ElevatedButton(
              onPressed: () {
                final Future pushReplacement = Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                  return HomePage();
                }));
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
