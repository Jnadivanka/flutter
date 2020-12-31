import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mauapanih/core/padding.dart';
import 'package:mauapanih/models/food.dart';
import 'package:mauapanih/screens/profile_screen.dart';

class DetailScreen extends StatefulWidget {
  final Food food;

  DetailScreen({Key key, this.food}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                      AppCustomBarBack(),
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
                                            blurRadius: 10,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Hero(
                                          tag: widget.food.name,
                                          child: Image.asset(
                                            widget.food.imageAsset,
                                            fit: BoxFit.cover,
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
                                      child: _FavoriteButton(),
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
                                    widget.food.name,
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Harga : ',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 14),
                                              children: [
                                                TextSpan(
                                                  text: widget.food.rangePrice,
                                                  style: GoogleFonts.montserrat(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: smallPadding,
                                            left: normalPadding,
                                            right: normalPadding,
                                          ),
                                          child: Text(
                                            widget.food.description,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 150,
                                    padding: EdgeInsets.only(
                                      top: normalPadding,
                                      left: normalPadding,
                                      right: normalPadding,
                                    ),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children:
                                          widget.food.imageUrls.map((url) {
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(url),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            normalPadding,
                                          ),
                                          child: RaisedButton(
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Ambil?'),
                                                    content: Text(
                                                        'Apakah Anda akan mengambilnya ?'),
                                                    actions: [
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        color: Colors.red,
                                                        child: Text('Ya'),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Tidak'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('AMBIL'),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
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

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({
    Key key,
  }) : super(key: key);

  @override
  __FavoriteButtonState createState() => __FavoriteButtonState();
}

class __FavoriteButtonState extends State<_FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}

class AppCustomBarBack extends StatelessWidget {
  const AppCustomBarBack({
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
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfileScreen();
            }));
          },
        ),
      ],
    );
  }
}
