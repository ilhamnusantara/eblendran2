import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:flutter/material.dart';

class DokumenProvider with ChangeNotifier {
  List<Dokumen> _dokumens = [];

  List<Dokumen> get dokumens => _dokumens;

  set dokumens(List<Dokumen> dokumens) {
    _dokumens = dokumens;
    notifyListeners();
  }
  // Future<void> getDokumens() async{
  //   return await DokumenService().getDokumens().toString();
  // }

  Future<List<Dokumen>> getDokumens() async {
    try {
      List<Dokumen> dokumens = await DokumenService().getDokumens();
      var _dokumens = dokumens;
      print(_dokumens);
      return _dokumens;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
