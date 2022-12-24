part of 'models.dart';

class Instansi extends Equatable {
  Instansi({
    this.dokumenList,
    required this.idInstansi,
    required this.namaInstansi,
    required this.alamat,
    required this.noTelp,
    required this.createdAt,
    required this.updatedAt,
    required this.data_null,
  });

  final int idInstansi;
  final String namaInstansi;
  final String alamat;
  final String noTelp;
  final int data_null;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<Dokumen>? dokumenList;

  Instansi copyWith(
          {required int idInstansi,
          required String namaInstansi,
          required String alamat,
          required String noTelp,
          required dynamic createdAt,
          required dynamic updatedAt,
          required int data_null,
          List<Dokumen>? dokumenList}) =>
      Instansi(
        idInstansi: idInstansi ?? this.idInstansi,
        namaInstansi: namaInstansi ?? this.namaInstansi,
        alamat: alamat ?? this.alamat,
        noTelp: noTelp ?? this.noTelp,
        dokumenList: dokumenList ?? this.dokumenList,
        data_null: data_null ?? this.data_null,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
      idInstansi: json["id_instansi"],
      namaInstansi: json["nama_instansi"],
      alamat: json["alamat"],
      noTelp: json["no_telp"],
      data_null: (json['data_null'] == null) ? 0 : json['data_null'],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      dokumenList:
          List<Dokumen>.from(json["dokumen"].map((x) => Dokumen.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id_instansi": idInstansi,
        "nama_instansi": namaInstansi,
        "alamat": alamat,
        "no_telp": noTelp,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "dokumen": List<dynamic>.from(dokumenList!.map((e) => e.toJson()))
      };

  @override
  List<Object?> get props =>
      [idInstansi, namaInstansi, alamat, noTelp, dokumenList, data_null];
}
