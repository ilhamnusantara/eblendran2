part of 'models.dart';

class CreateData {
  CreateData({
    required this.jenisBelanja,
    required this.instansi,
    required this.rekanan,
  });

  final List<JenisBelanja?>? jenisBelanja;
  final List<Instansi?>? instansi;
  final List<Rekanan1?>? rekanan;

  CreateData copyWith({
    List<JenisBelanja?>? jenisBelanja,
    List<Instansi?>? instansi,
    List<Rekanan1?>? rekanan,
  }) =>
      CreateData(
        jenisBelanja: jenisBelanja ?? this.jenisBelanja,
        instansi: instansi ?? this.instansi,
        rekanan: rekanan ?? this.rekanan,
      );

  factory CreateData.fromJson(Map<String, dynamic> json) => CreateData(
        jenisBelanja: json["jenis_belanja"] == null
            ? []
            : List<JenisBelanja?>.from(
                json["jenis_belanja"]!.map((x) => JenisBelanja.fromJson(x))),
        instansi: json["instansi"] == null
            ? []
            : List<Instansi?>.from(
                json["instansi"]!.map((x) => Instansi.fromJson(x))),
        rekanan: json["rekanan"] == null
            ? []
            : List<Rekanan1?>.from(
                json["rekanan"]!.map((x) => Rekanan1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jenis_belanja": jenisBelanja == null
            ? []
            : List<dynamic>.from(jenisBelanja!.map((x) => x!.toJson())),
        "instansi": instansi == null
            ? []
            : List<dynamic>.from(instansi!.map((x) => x!.toJson())),
        "rekanan": rekanan == null
            ? []
            : List<dynamic>.from(rekanan!.map((x) => x!.toJson())),
      };
}

class JenisBelanja {
  JenisBelanja({
    required this.idJenis,
    required this.jenisBelanja,
    required this.norekJenis,
    required this.kategori,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? idJenis;
  final String? jenisBelanja;
  final String? norekJenis;
  final String? kategori;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  JenisBelanja copyWith({
    int? idJenis,
    String? jenisBelanja,
    String? norekJenis,
    String? kategori,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      JenisBelanja(
        idJenis: idJenis ?? this.idJenis,
        jenisBelanja: jenisBelanja ?? this.jenisBelanja,
        norekJenis: norekJenis ?? this.norekJenis,
        kategori: kategori ?? this.kategori,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory JenisBelanja.fromJson(Map<String, dynamic> json) => JenisBelanja(
        idJenis: json["id_jenis"],
        jenisBelanja: json["jenis_belanja"],
        norekJenis: json["norek_jenis"],
        kategori: json["kategori"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_jenis": idJenis,
        "jenis_belanja": jenisBelanja,
        "norek_jenis": norekJenis,
        "kategori": kategori,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
