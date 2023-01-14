import 'dart:convert';
import 'package:eblendrang2/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class InstansiService {
  String baseUrl = 'http://103.23.198.126/api';

  Future<List<Instansi>> getInstansi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    String? session1 = await pref.getString("session");
    String session = (session1 == null) ? "" : session1;
    var url = '$baseUrl/dokumenValue?session=$session';
    debugPrint(url);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
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
