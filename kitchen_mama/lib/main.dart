import 'package:flutter/material.dart';
import 'package:kitchen_mama/foodAPI.dart';
import 'dart:math';

Random random = new Random();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<FoodList> foodlist;

  @override
  int randoM() {
    return random.nextInt(13) + 1;
  }

  @override
  void initState() {
    super.initState();
    foodlist = getFoodList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen Mama'),
      ),
      body: FutureBuilder<FoodList>(
          future: foodlist,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return GridView.builder(
                    itemCount: snapshot.data.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              margin: EdgeInsets.all(14.0),
                              child: Image.network(
                                  '${snapshot.data.categories[randoM()].strCategoryThumb}'),
                            ),
                            Text(
                                '${snapshot.data.categories[randoM()].strCategory}')
                          ],
                          // subtitle: Text(
                          //     '${snapshot.data.categories[index].strCategoryDescription}'),
                          // isThreeLine: true,
                        ),
                      );
                    });
            }
            return null;
          }),
    );
  }
}
