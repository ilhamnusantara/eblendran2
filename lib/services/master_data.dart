import '../models/models.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterData1 {
  final String baseUrl = 'http://taman.e-blendrang.com/api';
  Future<List<dynamic>> getMasterData(String query) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    String path = "$baseUrl/createData";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var response = await http.get(Uri.parse(path), headers: headers);
    debugPrint("response dropdown=>" + response.statusCode.toString());
    List<dynamic> sugestion = [];
    if (response.statusCode == 200) {
      if (query.toUpperCase().contains("JENIS_BELANJA")) {
        final jsonS = convert.json.decode(response.body);
        var data = jsonS['data']['jenis_belanja'];
        sugestion = List<JenisBelanja>.from(
            data.map((model) => JenisBelanja.fromJson(model)));
      } else if (query.toUpperCase().contains("INSTANSI")) {
        final jsonS = convert.json.decode(response.body);
        var data = jsonS['data']['instansi'];
        sugestion =
            List<Instansi>.from(data.map((model) => Instansi.fromJson(model)));
      } else {
        final jsonS = convert.json.decode(response.body);
        var data = jsonS['data']['rekanan'];
        sugestion =
            List<Rekanan1>.from(data.map((model) => Rekanan1.fromJson(model)));
      }
    }
    return sugestion;
  }
}
