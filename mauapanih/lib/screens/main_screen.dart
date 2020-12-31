import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mauapanih/core/padding.dart';
import 'package:mauapanih/data/food_list.dart';
import 'package:mauapanih/models/food.dart';
import 'package:mauapanih/screens/detail_screen.dart';
import 'package:mauapanih/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
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
                      AppCustomBar(),
                      _GreetingMessage(),
                      _MenuFood(),
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

class _MenuFood extends StatelessWidget {
  const _MenuFood({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0, // soften the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: extraBigPadding),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: extraBigPadding,
                        left: bigPadding,
                        right: normalPadding,
                        bottom: normalPadding,
                      ),
                      width: 500,
                      child: Text(
                        'MENU',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 475,
                      margin: EdgeInsets.only(bottom: bigPadding),
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: bigPadding),
                        itemCount: foodList.length,
                        itemBuilder: (context, index) => _Food(
                          food: foodList[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Food extends StatelessWidget {
  final Food food;

  const _Food({
    Key key,
    this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(bigPadding),
      shadowColor: Colors.grey,
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailScreen(food: food);
          }));
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: bigPadding),
                    child: Text(
                      food.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: bigPadding),
                    child: Text(
                      food.rangePrice,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: Stack(
                alignment: Alignment.topRight,
                overflow: Overflow.visible,
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Positioned(
                    top: -20,
                    right: 40,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Hero(
                          tag: food.name,
                          child: Image.asset(
                            food.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GreetingMessage extends StatelessWidget {
  const _GreetingMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: bigPadding),
            child: Card(
              shadowColor: Colors.grey,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: bigPadding,
                    right: normalPadding,
                    bottom: bigPadding,
                    left: normalPadding),
                child: Text(
                  'Mau Makan Apa Hari Ini ?',
                  style: GoogleFonts.montserrat(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppCustomBar extends StatelessWidget {
  const AppCustomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
