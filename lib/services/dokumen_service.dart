import 'dart:convert';
import 'package:eblendrang2/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DokumenService {
  String baseUrl = 'http://103.23.198.126/api';
  // String id;

  // List dokumens = [];
  // Future getDokumens() async{
  //   try{
  //     final response = await http.get(Uri.parse("http://e-blendrang.id/api/dokumens"));
  //     if(response.statusCode == 200){
  //       final data = jsonDecode(response.body)['data'];
  //       dokumens = data;
  //       print(data);
  //     }
  //   } catch(e){
  //     print(e);
  //   }
  // }
  Future<List<Dokumen>> getDokumens() async {
    var url = '$baseUrl/anyDokumens';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      print("getDokumen=> $data");
      List<Dokumen> dokumens = [];
      for (var item in data) {
        dokumens.add(Dokumen.fromJson(item));
      }
      // print(dokumens);
      return dokumens;
    } else {
      throw Exception('Gagal Get Dokumen!');
    }
  }
}
