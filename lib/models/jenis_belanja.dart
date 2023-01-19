part of 'models.dart';

// class CreateData {
//   CreateData({
//     required this.jenisBelanja,
//     required this.instansi,
//     required this.rekanan,
//   });

//   final List<JenisBelanja> jenisBelanja;
//   final List<Instansi> instansi;
//   final List<Rekanan1> rekanan;

//   CreateData copyWith({
//     List<JenisBelanja>? jenisBelanja,
//     List<Instansi>? instansi,
//     List<Rekanan1>? rekanan,
//   }) =>
//       CreateData(
//         jenisBelanja: jenisBelanja ?? this.jenisBelanja,
//         instansi: instansi ?? this.instansi,
//         rekanan: rekanan ?? this.rekanan,
//       );

//   factory CreateData.fromJson(Map<String, dynamic> json) => CreateData(
//         jenisBelanja: List<JenisBelanja>.from(
//             json["jenis_belanja"].map((x) => JenisBelanja.fromJson(x))),
//         instansi: List<Instansi>.from(
//             json["instansi"].map((x) => Instansi.fromJson(x))),
//         rekanan: List<Rekanan1>.from(
//             json["rekanan"].map((x) => Rekanan1.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "jenis_belanja":
//             List<dynamic>.from(jenisBelanja.map((x) => x.toJson())),
//         "instansi": List<dynamic>.from(instansi.map((x) => x.toJson())),
//         "rekanan": List<dynamic>.from(rekanan.map((x) => x.toJson())),
//       };
// }

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

  factory JenisBelanja.fromJson(Map<dynamic, dynamic> json) => JenisBelanja(
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
// class CreateData {
//   CreateData({
//     required this.meta,
//     required this.data,
//   });

//   final Meta meta;
//   final Data data;

//   CreateData copyWith({
//     required Meta meta,
//     required Data data,
//   }) =>
//       CreateData(
//         meta: meta ?? this.meta,
//         data: data ?? this.data,
//       );

//   factory CreateData.fromJson(Map<String, dynamic> json) => CreateData(
//         meta: Meta.fromJson(json["meta"]),
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "meta": meta.toJson(),
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.jenisBelanja,
//     required this.instansi,
//     required this.rekanan,
//   });

//   final List<JenisBelanja> jenisBelanja;
//   final List<Instansi> instansi;
//   final List<Rekanan1> rekanan;

//   Data copyWith({
//     required List<JenisBelanja> jenisBelanja,
//     required List<Instansi> instansi,
//     required List<Rekanan1> rekanan,
//   }) =>
//       Data(
//         jenisBelanja: jenisBelanja ?? this.jenisBelanja,
//         instansi: instansi ?? this.instansi,
//         rekanan: rekanan ?? this.rekanan,
//       );

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         jenisBelanja: List<JenisBelanja>.from(
//             json["jenis_belanja"].map((x) => JenisBelanja.fromJson(x))),
//         instansi: List<Instansi>.from(
//             json["instansi"].map((x) => Instansi.fromJson(x))),
//         rekanan: List<Rekanan1>.from(
//             json["rekanan"].map((x) => Rekanan1.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "jenis_belanja":
//             List<dynamic>.from(jenisBelanja.map((x) => x.toJson())),
//         "instansi": List<dynamic>.from(instansi.map((x) => x.toJson())),
//         "rekanan": List<dynamic>.from(rekanan.map((x) => x.toJson())),
//       };
// }

// class Instansi1 {
//   Instansi1({
//     required this.idInstansi,
//     required this.namaInstansi,
//     required this.alamat,
//     required this.noTelp,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int idInstansi;
//   final String namaInstansi;
//   final String alamat;
//   final String noTelp;
//   final dynamic? createdAt;
//   final dynamic? updatedAt;

//   Instansi1 copyWith({
//     required int idInstansi,
//     required String namaInstansi,
//     required String alamat,
//     required String noTelp,
//     required dynamic createdAt,
//     required dynamic updatedAt,
//   }) =>
//       Instansi1(
//         idInstansi: idInstansi ?? this.idInstansi,
//         namaInstansi: namaInstansi ?? this.namaInstansi,
//         alamat: alamat ?? this.alamat,
//         noTelp: noTelp ?? this.noTelp,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );

//   factory Instansi1.fromJson(Map<String, dynamic> json) => Instansi1(
//         idInstansi: json["id_instansi"],
//         namaInstansi: json["nama_instansi"],
//         alamat: json["alamat"],
//         noTelp: json["no_telp"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id_instansi": idInstansi,
//         "nama_instansi": namaInstansi,
//         "alamat": alamat,
//         "no_telp": noTelp,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// class JenisBelanja {
//   JenisBelanja({
//     required this.idJenis,
//     required this.jenisBelanja,
//     required this.norekJenis,
//     required this.kategori,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   final int idJenis;
//   final String jenisBelanja;
//   final String norekJenis;
//   final String kategori;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   JenisBelanja copyWith({
//     required int idJenis,
//     required String jenisBelanja,
//     required String norekJenis,
//     required String kategori,
//     required DateTime createdAt,
//     required DateTime updatedAt,
//   }) =>
//       JenisBelanja(
//         idJenis: idJenis ?? this.idJenis,
//         jenisBelanja: jenisBelanja ?? this.jenisBelanja,
//         norekJenis: norekJenis ?? this.norekJenis,
//         kategori: kategori ?? this.kategori,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );

//   factory JenisBelanja.fromJson(Map<String, dynamic> json) => JenisBelanja(
//         idJenis: json["id_jenis"],
//         jenisBelanja: json["jenis_belanja"],
//         norekJenis: json["norek_jenis"],
//         kategori: json["kategori"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id_jenis": idJenis,
//         "jenis_belanja": jenisBelanja,
//         "norek_jenis": norekJenis,
//         "kategori": kategori,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// class Meta {
//   Meta({
//     required this.code,
//     required this.status,
//     required this.message,
//   });

//   final int code;
//   final String status;
//   final String message;

//   Meta copyWith({
//     required int code,
//     required String status,
//     required String message,
//   }) =>
//       Meta(
//         code: code ?? this.code,
//         status: status ?? this.status,
//         message: message ?? this.message,
//       );

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         code: json["code"],
//         status: json["status"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "status": status,
//         "message": message,
//       };
// }
