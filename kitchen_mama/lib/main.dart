import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kitchen_mama/foodAPI.dart';

Random random = Random();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Meals',
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
  void initState() {
    super.initState();
    foodlist = getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen Mama'),
      ),
      body: FutureBuilder<FoodList>(
          future: foodlist,
          builder: (BuildContext context, AsyncSnapshot<FoodList> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return GridView.builder(
                    itemCount: snapshot.data.categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          // ignore: always_specify_types
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.all(14.0),
                              child: Image.network(
                                  '${snapshot.data.categories[index].strCategoryThumb}'),
                            ),
                            Text(
                                '${snapshot.data.categories[index].strCategory}')
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
