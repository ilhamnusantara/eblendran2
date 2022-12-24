// import 'package:app_eblendrang/models/instansi_model.dart';
import 'dart:convert';

// List<DokumenModel> modelDokumenFromJson (String str) =>
//     List<DokumenModel>.from(json.decode(str).map((x) => DokumenModel.fromJson(x)));
// String modelDokumenToJson(List<DokumenModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DokumenModel {
  final int id_dokumen;
  final String keterangan_belanja;
  final String no_spk;
  final DateTime tanggal_spk;
  final String no_bast;
  final String alamat;
  final Instansi instansi;
  // DateTime createdAt;
  // DateTime updateAt;

  DokumenModel({
    required this.id_dokumen,
    required this.keterangan_belanja,
    required this.no_spk,
    required this.tanggal_spk,
    required this.no_bast,
    required this.alamat,
    required this.instansi,
    // this.createdAt,
    // this.updateAt,
  });

  factory DokumenModel.fromJson(Map<String, dynamic> json) {
    return DokumenModel(
      id_dokumen: json['id_dokumen'],
      keterangan_belanja: json['keterangan_belanja'],
      no_spk: json['no_spk'],
      tanggal_spk: (json['tgl_spk'] == null)
          ? DateTime.now()
          : DateTime.parse(json['tgl_spk']),
      no_bast: json['no_bast'],
      alamat: json['alamat'],
      instansi: Instansi.fromJson(json['instansi']),
      // createdAt: DateTime.parse(json["created_at"]),
      // updateAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_dokumen'] = this.id_dokumen;
    data['keterangan_belanja'] = this.keterangan_belanja;
    data['no_spk'] = this.no_spk;
    data['tgl_spk'] = this.tanggal_spk.toString();
    data['no_bast'] = this.no_bast;
    data['alamat'] = this.alamat;
    data['instansi'] = this.instansi.toJson();
    // "created_at": createdAt.toString(),
    return data;
  }
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

// class UninitializedDokumenModel extends DokumenModel {}
