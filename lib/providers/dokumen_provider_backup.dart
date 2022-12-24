import 'package:eblendrang2/models/dokumen_model_backup2.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:flutter/material.dart';

class DokumenProvider with ChangeNotifier {
  List<DokumenModel> _dokumens = [];

  List<DokumenModel> get dokumens => _dokumens;

  set dokumens(List<DokumenModel> dokumens) {
    _dokumens = dokumens;
    notifyListeners();
  }
  // Future<void> getDokumens() async{
  //   return await DokumenService().getDokumens().toString();
  // }

  // Future<void> getDokumens() async {
  //   try{
  //     List<DokumenModel> dokumens = await DokumenService().getDokumens();
  //     _dokumens = dokumens;
  //     return _dokumens;
  //   } catch (e){
  //     print(e);
  //   }
  // }
}
