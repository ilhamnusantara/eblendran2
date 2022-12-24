import 'dart:convert';
import 'package:eblendrang2/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class InstansiService {
  String baseUrl = 'http://103.23.198.126/api';

  Future<List<Instansi>> getInstansi() async {
    var url = '$baseUrl/dokumenValue';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      print(data);
      List<Instansi> instansi = [];
      for (var item in data) {
        instansi.add(Instansi.fromJson(item));
      }
      // print(dokumens);
      return instansi;
    } else {
      throw Exception('Gagal Get Instansi!');
    }
  }
}
