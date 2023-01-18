import '../models/models.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterData1 {
  final String baseUrl = 'http://103.23.198.126/api';
  Future<List<Map<String, dynamic>>> getMasterData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    String path = "$baseUrl/createData";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var response = await http.get(Uri.parse(path), headers: headers);

    List<CreateData> sugestion = [];
    if (response.statusCode == 200) {
      final jsonS = json.decode(response.body)["data"];
      sugestion = List<CreateData>.from(
          jsonS.map((model) => CreateData.fromJson(model)));
      // if (q.toUpperCase().contains("MASTERDATA")) {
      //   return Future.value(sugestion
      //       .map((e) => {
      //             'jenisBelanja': e.jenisBelanja!.first!.jenisBelanja,
      //             'idJenis': e.jenisBelanja!.first!.idJenis
      //           })
      //       .toList());
      // } else if (q.toUpperCase().contains("NAMAINSTANSI")) {
      //   return Future.value(sugestion
      //       .map((e) => {
      //             'namaInstansi': e.instansi!.first!.namaInstansi,
      //             'idinstansi': e.instansi!.first!.idInstansi
      //           })
      //       .toList());
      // } else if (q.toUpperCase().contains("REKANAN")) {
      //   return Future.value(sugestion
      //       .map((e) => {
      //             'namaRekanan': e.rekanan!.first!.namaRekanan,
      //             'idRekanan': e.rekanan!.first!.idRekanan
      //           })
      //       .toList());
      // }

    }
    return Future.value(sugestion
        .map((e) => {
              'jenisBelanja': e.jenisBelanja!.first!.jenisBelanja,
              'idJenis': e.jenisBelanja!.first!.idJenis,
              'namaInstansi': e.instansi!.first!.namaInstansi,
              'idinstansi': e.instansi!.first!.idInstansi,
              'namaRekanan': e.rekanan!.first!.namaRekanan,
              'idRekanan': e.rekanan!.first!.idRekanan
            })
        .toList());
  }
}
