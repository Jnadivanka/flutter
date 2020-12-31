import "package:flutter/material.dart";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> item = [
    "Makan & Minum : Rp. 500.000",
    "Belanja : Rp 300.000",
    "Kos : Rp 800.000",
    "Wifi : Rp 250.000",
    "SPP : Rp 850.000",
    "Paket Data : Rp 50.000",
    "Langganan Netflix : Rp 30.000",
    "Kebutuhan Mendesak : Rp 200.000",
    "Tabungan : Rp 700.000",
    "Lain - lain : Rp 100.000"
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("E - Pocket"),
        ),
        body: new Container(
          child: GridView.builder(
            padding: EdgeInsets.only(top: 10.0),
            scrollDirection: Axis.horizontal,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: item.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 58.0,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      '${item[index]}',
                      style: TextStyle(color: Colors.white, fontSize: 19.0),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
