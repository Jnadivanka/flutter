import 'dart:convert';
import 'package:http/http.dart' as http;

class RajaongkirAPI {
  String serviceOKE;
  String hargaOKE;
  String etdOKE;

  String serviceREG;
  String hargaREG;
  String etdREG;

  RajaongkirAPI(
      {this.serviceOKE,
      this.hargaOKE,
      this.etdOKE,
      this.serviceREG,
      this.hargaREG,
      this.etdREG});

  factory RajaongkirAPI.result(Map<String, dynamic> object) {
    return RajaongkirAPI(
      serviceOKE: object['results'][0]['costs'][0]['service'],
      hargaOKE: object['results'][0]['costs'][0]['cost'][0]['value'].toString(),
      etdOKE: object['results'][0]['costs'][0]['cost'][0]['etd'],
      serviceREG: object['results'][0]['costs'][1]['service'],
      hargaREG: object['results'][0]['costs'][1]['cost'][0]['value'].toString(),
      etdREG: object['results'][0]['costs'][1]['cost'][0]['etd'],
    );
  }

  static Future<RajaongkirAPI> konekAPI(
      String kodeAsal, String kodeTujuan, String berat) async {
    String apiUrl = "https://api.rajaongkir.com/starter/cost";

    Map<String, dynamic> body = {
      "origin": kodeAsal,
      "destination": kodeTujuan,
      "weight": berat,
      "courier": "jne"
    };

    var apiResult = await http.post(apiUrl, body: body, headers: {
      "key": "951418dc2609665405038ebef0ed62b9",
      "content-type": "application/x-www-form-urlencoded"
    });
    var jsonObject = json.decode(apiResult.body);
    var dataAPI = (jsonObject as Map<String, dynamic>)['rajaongkir'];
    return RajaongkirAPI.result(dataAPI);
  }
}
