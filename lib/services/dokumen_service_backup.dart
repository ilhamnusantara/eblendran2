import 'dart:convert';
import 'package:eblendrang2/models/dokumen_model_backup2.dart';
import 'package:eblendrang2/models/models.dart';
import 'package:http/http.dart' as http;

class DokumenService {
  String baseUrl = 'http://e-blendrang.id/api';
  late String id;
  Future<List<Dokumen>> getDokumens() async {
    var url = '$baseUrl/dokumens';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      print(data);
      List<Dokumen> dokumens = [];
      for (var item in data) {
        dokumens.add(Dokumen.fromJson(item));
      }
      print(dokumens);
      return dokumens;
    } else {
      throw Exception('Gagal Get Dokumen!');
    }
  }
}
