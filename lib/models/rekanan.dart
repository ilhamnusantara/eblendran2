part of 'models.dart';

class Rekanan1 {
  Rekanan1({
    required this.idRekanan,
    required this.namaRekanan,
    required this.alamat,
    required this.namaPimpinan,
    required this.noRek,
    required this.noTelp,
    required this.noNpwp,
    required this.noSiup,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? idRekanan;
  final String? namaRekanan;
  final String? alamat;
  final String? namaPimpinan;
  final String? noRek;
  final String? noTelp;
  final dynamic noNpwp;
  final dynamic noSiup;
  final dynamic email;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Rekanan1 copyWith({
    int? idRekanan,
    String? namaRekanan,
    String? alamat,
    String? namaPimpinan,
    String? noRek,
    String? noTelp,
    dynamic noNpwp,
    dynamic noSiup,
    dynamic email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Rekanan1(
        idRekanan: idRekanan ?? this.idRekanan,
        namaRekanan: namaRekanan ?? this.namaRekanan,
        alamat: alamat ?? this.alamat,
        namaPimpinan: namaPimpinan ?? this.namaPimpinan,
        noRek: noRek ?? this.noRek,
        noTelp: noTelp ?? this.noTelp,
        noNpwp: noNpwp ?? this.noNpwp,
        noSiup: noSiup ?? this.noSiup,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Rekanan1.fromJson(Map<String, dynamic> json) => Rekanan1(
        idRekanan: json["id_rekanan"],
        namaRekanan: json["nama_rekanan"],
        alamat: json["alamat"],
        namaPimpinan: json["nama_pimpinan"],
        noRek: json["no_rek"],
        noTelp: json["no_telp"],
        noNpwp: json["no_npwp"],
        noSiup: json["no_siup"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_rekanan": idRekanan,
        "nama_rekanan": namaRekanan,
        "alamat": alamat,
        "nama_pimpinan": namaPimpinan,
        "no_rek": noRek,
        "no_telp": noTelp,
        "no_npwp": noNpwp,
        "no_siup": noSiup,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
