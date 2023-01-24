import 'dart:convert';
import 'dart:io';
import 'package:eblendrang2/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DokumenService {
  String baseUrl = 'http://taman.e-blendrang.com/api';
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

  Future<String> addDokumen(DokumenUpload doc) async {
    var path =
        "$baseUrl/store?id_jenis=${doc.id_jenis}&id_instansi=${doc.id_instansi}&keterangan_belanja=${doc.keterangan_belanja}&no_spk=${doc.no_spk}&tgl_spk=${doc.tgl_spk}&no_bast=${doc.no_bast}&tgl_bast=${doc.tgl_bast}&tahun=${doc.tahun}&satuan=${doc.satuan}&volume=${doc.volume}&nominal_belanja=${doc.nominal_belanja}&id_rekanan=${doc.id_rekanan}&no_pbb_ls=${doc.no_pbb_ls}&tanggal_belanja=${doc.tgl_belanja}";

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var response = await http.post(Uri.parse(path), headers: headers);
    debugPrint("=> ${response.statusCode}");
    if (response.statusCode == 200) {
      return "Dokumen Berhasil di Unggah";
    } else {
      return "Lengkapi data anda";
    }
  }

  Future<int> updateDokumen(Dokumen docs) async {
    var path =
        "$baseUrl/dokumenUpdate?id_dokumen=${docs.idDokumen}&tgl_spk=${docs.tglSpk}&no_spk=${docs.noSpk}&no_bast=${docs.noBast}&tgl_bast=${docs.tglBast}";

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var response = await http.put(Uri.parse(path), headers: headers);
    debugPrint(response.statusCode.toString());
    debugPrint("path=> $path");
    if (response.statusCode == 200) {
      // print(dokumens);
      return response.statusCode;
    } else {
      // throw Exception('Gagal Get Dokumen!');
      return response.statusCode;
    }
  }

  Future<List<Dokumen>> getDokumens() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = await pref.getString("accessToken");
    String? session1 = await pref.getString("session");
    String session = (session1 == null) ? "" : session1;
    var url = '$baseUrl/anyDokumens?session=$session';
    debugPrint(url);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    debugPrint("code dokumensAny => ${response.statusCode}");
    print("body => ${response.body}");

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

  Future<String> asyncFileUpload(
      String docId, File file, String path, String field) async {
    //create multipart request for POST or PATCH method
    final headers = <String, String>{}
      ..addAll({"Content-Type": "multipart/form-data;"});
    var request = http.MultipartRequest("POST", Uri.parse("$baseUrl/$path"));
    //add text fields
    request.fields["id_dokumen"] = docId; //muat atau bongkar
    request.headers.addAll(headers);
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath(field, file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    debugPrint(responseString);
    debugPrint(response.statusCode.toString());
    // var a = jsonDecode(responseString);
    if (response.statusCode >= 300) {
      debugPrint((response.statusCode >= 300).toString());
      return "Error, Gagal Save Foto";
    } else {
      // return a["message"].toString();
    }
    // return a["status"].toString();
    return "Data berhasil di Upload";
  }
}
