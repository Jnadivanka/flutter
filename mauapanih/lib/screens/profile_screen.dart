import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mauapanih/core/padding.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(bigPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppCustomBarBackProfile(),
                      SizedBox(
                        height: 100,
                      ),
                      Card(
                        elevation: 10,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                overflow: Overflow.visible,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 125,
                                    color: Colors.transparent,
                                  ),
                                  Positioned(
                                    top: -75,
                                    child: Container(
                                      width: 175,
                                      height: 175,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                          ),
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 10,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Hero(
                                          tag: 'profile',
                                          child: LayoutBuilder(
                                            builder: (context, constraint) {
                                              return Icon(Icons.account_circle,
                                                  size: constraint
                                                      .biggest.height);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 50,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(.2),
                                            blurRadius: 2,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: bigPadding),
                              padding: EdgeInsets.only(
                                  left: normalPadding, right: normalPadding),
                              child: Column(
                                children: [
                                  Text(
                                    'Arif Nur Rochman',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _Contact(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Contact extends StatefulWidget {
  const _Contact({
    Key key,
  }) : super(key: key);

  @override
  __ContactState createState() => __ContactState();
}

class __ContactState extends State<_Contact> {
  String contact = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(normalPadding),
      child: Container(
        padding: EdgeInsets.all(normalPadding),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(normalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Image.asset('images/instagram.png'),
                            onPressed: () {
                              setState(() {
                                contact = '@arifblogger77';
                              });
                            }),
                        IconButton(
                            icon: Image.asset('images/telegram.png'),
                            onPressed: () {
                              setState(() {
                                contact = 't.me/arifblogger77';
                              });
                            }),
                        IconButton(
                            icon: Image.asset('images/github.png'),
                            onPressed: () {
                              setState(() {
                                contact = 'github.com/arifblogger77';
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: normalPadding, bottom: normalPadding),
                      padding: EdgeInsets.all(normalPadding),
                      child: Text(
                        contact,
                        style: GoogleFonts.montserrat(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppCustomBarBackProfile extends StatelessWidget {
  const AppCustomBarBackProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(fontSize: 16),
              ),
              Text(
                'Arif Nur Rochman',
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
