import 'package:eblendrang2/models/instansi_model.dart';
import 'dart:convert';

// List<DokumenModel> modelDokumenFromJson (String str) =>
//     List<DokumenModel>.from(json.decode(str).map((x) => DokumenModel.fromJson(x)));
// String modelDokumenToJson(List<DokumenModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DokumenModel {
  final int id_dokumen;
  final String keterangan_belanja;
  final String no_spk;
  final String no_bast;
  final String alamat;
  final Instansi instansi;
  // DateTime createdAt;
  // DateTime updateAt;

  DokumenModel({
    required this.id_dokumen,
    required this.keterangan_belanja,
    required this.no_spk,
    required this.no_bast,
    required this.alamat,
    required this.instansi,
    // this.createdAt,
    // this.updateAt,
  });

  factory DokumenModel.fromJson(Map<String, dynamic> json) => DokumenModel(
        id_dokumen: json['id_dokumen'],
        keterangan_belanja: json['keterangan_belanja'],
        no_spk: json['no_spk'],
        no_bast: json['no_bast'],
        alamat: json['alamat'],
        instansi: Instansi.fromJson(json['instansi']),
        // createdAt: DateTime.parse(json["created_at"]),
        // updateAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_dokumen": id_dokumen,
        "keterangan_belanja": keterangan_belanja,
        "no_spk": no_spk,
        "no_bast": no_bast,
        "alamat": alamat,
        "instansi": instansi.toJson(),
        // "created_at": createdAt.toString(),
      };
}

class Instansi {
  final int id_instansi;
  final String nama_instansi;

  Instansi({
    required this.id_instansi,
    required this.nama_instansi,
  });

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
        nama_instansi: json["nama_instansi"],
        id_instansi: json['id_instansi'],
      );

  Map<String, dynamic> toJson() => {
        "nama_instansi": nama_instansi,
      };
}

//class UninitializedDokumenModel extends DokumenModel {}
