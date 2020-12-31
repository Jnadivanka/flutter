import 'package:flutter/material.dart';
import 'package:cek_ongkirmu/model/rajaongkirAPI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Ongkirmu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cek Ongkirmu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List<String> listAwal = [
    'Silahakan Pilih',
    'Surabaya',
    'Jakarta',
    'Bandung',
    'Kediri',
    'Yogyakarta'
  ];

  List<String> listTujuan = [
    'Silahakan Pilih',
    'Surabaya',
    'Jakarta',
    'Bandung',
    'Kediri',
    'Yogyakarta'
  ];

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String namaKotaAwal = "Silahakan Pilih", namaKotaTujuan = "Silahakan Pilih";
  String kodeAsal, kodeTujuan;

  RajaongkirAPI dataAPI = null;
  TextEditingController berat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Kota Asal"),
            Container(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                value: namaKotaAwal,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.teal[700]),
                underline: Container(
                  height: 2,
                  color: Colors.teal[700],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    namaKotaAwal = newValue;

                    if (namaKotaAwal == 'Surabaya') {
                      kodeAsal = "444";
                    } else if (namaKotaAwal == 'Jakarta') {
                      kodeAsal = "152";
                    } else if (namaKotaAwal == 'Bandung') {
                      kodeAsal = "23";
                    } else if (namaKotaAwal == 'Kediri') {
                      kodeAsal = "179";
                    } else if (namaKotaAwal == 'Yogyakarta') {
                      kodeAsal = "501";
                    }
                  });
                },
                items: widget.listAwal.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Text('Kota Tujuan'),
            Container(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                value: namaKotaTujuan,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 1,
                style: TextStyle(color: Colors.deepOrange),
                underline: Container(
                  height: 2,
                  color: Colors.deepOrange,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    namaKotaTujuan = newValue;

                    if (namaKotaTujuan == 'Surabaya') {
                      kodeTujuan = "444";
                    } else if (namaKotaTujuan == 'Jakarta') {
                      kodeTujuan = "152";
                    } else if (namaKotaTujuan == 'Bandung') {
                      kodeTujuan = "23";
                    } else if (namaKotaTujuan == 'Kediri') {
                      kodeTujuan = "179";
                    } else if (namaKotaTujuan == 'Yogyakarta') {
                      kodeTujuan = "501";
                    }
                  });
                },
                items: widget.listAwal.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: berat,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Berat Barang (Kg)",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                RajaongkirAPI.konekAPI(kodeAsal, kodeTujuan, berat.text)
                    .then((value) {
                  dataAPI = value;
                });
                setState(() {});
              },
              child: Text("Cek Ongkirmu"),
            ),
            Text((dataAPI != null)
                ? 'Service : ' +
                    dataAPI.serviceOKE +
                    ' | Ongkos Kirim : ' +
                    dataAPI.hargaOKE +
                    ' | Estimasi Pengiriman : ' +
                    dataAPI.etdOKE
                : "Silahkan masukkan"),
            Text((dataAPI != null)
                ? 'Service : ' +
                    dataAPI.serviceREG +
                    ' | Ongkos Kirim : ' +
                    dataAPI.hargaREG +
                    ' | Estimasi Pengiriman : ' +
                    dataAPI.etdREG
                : ""),
          ],
        ),
      ),
    );
  }
}
