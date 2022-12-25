part of 'models.dart';

enum DokumenStatus { belum_ada_foto, belum_ada_spk, belum_ada_bast }

class Dokumen extends Equatable {
  Dokumen(
      {required this.idDokumen,
      required this.idJenis,
      required this.idInstansi,
      required this.keteranganBelanja,
      required this.rincianBelanja,
      required this.noSpk,
      required this.tglSpk,
      required this.fileSpk,
      required this.noBast,
      required this.tglBast,
      required this.fileBast,
      required this.merk,
      required this.bahan,
      required this.type,
      required this.ukuran,
      required this.alamat,
      required this.foto,
      required this.status,
      required this.statusBelanja,
      required this.tahun,
      required this.namaInstansi,
      required this.createdAt,
      required this.updatedAt,
      this.docStatus});

  final int idDokumen;
  final int idJenis;
  final int idInstansi;
  final String keteranganBelanja;
  final String rincianBelanja;
  final String noSpk;
  final String tglSpk;
  final String fileSpk;
  final String noBast;
  final String tglBast;
  final String fileBast;
  final String merk;
  final String bahan;
  final String type;
  final String ukuran;
  final String alamat;
  final String foto;
  final String status;
  final String statusBelanja;
  final String tahun;
  final String namaInstansi;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DokumenStatus>? docStatus;

  Dokumen copyWith(
          {required int idDokumen,
          required int idJenis,
          required int idInstansi,
          required String keteranganBelanja,
          required String rincianBelanja,
          required String noSpk,
          required String tglSpk,
          required String fileSpk,
          required String noBast,
          required String tglBast,
          required String fileBast,
          required String merk,
          required String bahan,
          required String type,
          required String ukuran,
          required String alamat,
          required String foto,
          required String status,
          required String statusBelanja,
          required String tahun,
          required String namaInstansi,
          required DateTime createdAt,
          required DateTime updatedAt,
          required List<DokumenStatus> docStatus}) =>
      Dokumen(
          idDokumen: idDokumen ?? this.idDokumen,
          idJenis: idJenis ?? this.idJenis,
          idInstansi: idInstansi ?? this.idInstansi,
          keteranganBelanja: keteranganBelanja ?? this.keteranganBelanja,
          rincianBelanja: rincianBelanja ?? this.rincianBelanja,
          noSpk: noSpk ?? this.noSpk,
          tglSpk: tglSpk ?? this.tglSpk,
          fileSpk: fileSpk ?? this.fileSpk,
          noBast: noBast ?? this.noBast,
          tglBast: tglBast ?? this.tglBast,
          fileBast: fileBast ?? this.fileBast,
          merk: merk ?? this.merk,
          bahan: bahan ?? this.bahan,
          type: type ?? this.type,
          ukuran: ukuran ?? this.ukuran,
          alamat: alamat ?? this.alamat,
          foto: foto ?? this.foto,
          status: status ?? this.status,
          statusBelanja: statusBelanja ?? this.statusBelanja,
          tahun: tahun ?? this.tahun,
          namaInstansi: namaInstansi ?? this.namaInstansi,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          docStatus: docStatus ?? this.docStatus);

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
        idDokumen: json["id_dokumen"],
        idJenis: json["id_jenis"],
        idInstansi: json["id_instansi"],
        keteranganBelanja: (json["keterangan_belanja"] == null)
            ? "Not Detect"
            : json["keterangan_belanja"],
        rincianBelanja: (json["rincian_belanja"] == null)
            ? "Not Detect"
            : json["rincian_belanja"],
        noSpk: (json["no_spk"] == null) ? "Not Detect" : json['no_spk'],
        tglSpk: (json["tgl_spk"] == null)
            ? "Not Detect"
            : json['tgl_spk'].toString(),
        fileSpk: (json["file_spk"] == null) ? "Not Detect" : json['file_spk'],
        noBast: (json["no_bast"] == null) ? "Not Detect" : json['no_bast'],
        tglBast: (json["tgl_bast"] == null)
            ? "Not Detect"
            : json['tgl_bast'].toString(),
        namaInstansi: (json['nama_instansi'] == null)
            ? 'Not Detect'
            : json['nama_instansi'],
        fileBast:
            (json["file_bast"] == null) ? "Not Detect" : json['file_bast'],
        merk: (json["merk"] == null) ? "Not Detect" : json['merk'],
        bahan: (json["bahan"] == null) ? "Not Detect" : json['bahan'],
        type: (json["type"] == null) ? "Not Detect" : json['type'],
        ukuran: (json["ukuran"] == null) ? "Not Detect" : json['ukuran'],
        alamat: (json["alamat"] == null) ? "Not Detect" : json['alamat'],
        foto: (json["foto"] == null) ? "Not Detect" : json['foto'],
        status: json["status"],
        statusBelanja: json["status_belanja"],
        tahun: json["tahun"],
        createdAt: (json["created_at"] == null)
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: (json["updated_at"] == null)
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_dokumen": idDokumen,
        "id_jenis": idJenis,
        "id_instansi": idInstansi,
        "keterangan_belanja": keteranganBelanja,
        "rincian_belanja": rincianBelanja,
        "no_spk": noSpk,
        "tgl_spk": tglSpk,
        "file_spk": fileSpk,
        "no_bast": noBast,
        "tgl_bast": tglBast,
        "file_bast": fileBast,
        "merk": merk,
        "bahan": bahan,
        "type": type,
        "ukuran": ukuran,
        "alamat": alamat,
        "foto": foto,
        "status": status,
        "status_belanja": statusBelanja,
        "tahun": tahun,
        "nama_instansi": namaInstansi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props =>
      [idDokumen, idJenis, idInstansi, noSpk, noBast, namaInstansi];
}
