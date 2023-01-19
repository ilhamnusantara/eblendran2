part of 'models.dart';

class DokumenUpload extends Equatable {
  DokumenUpload(
      {required this.id_instansi,
      required this.id_jenis,
      required this.keterangan_belanja,
      required this.no_spk,
      required this.tgl_spk,
      required this.no_bast,
      required this.tgl_bast,
      required this.tahun,
      required this.satuan,
      required this.volume,
      required this.nominal_belanja,
      required this.id_rekanan,
      required this.no_pbb_ls,
      required this.tgl_belanja});

  final int id_jenis;
  final int id_instansi;
  final String keterangan_belanja;
  final String no_spk;
  final String tgl_spk;
  final String no_bast;
  final String tgl_bast;
  final String tahun;
  final String satuan;
  final int volume;
  final int nominal_belanja;
  final int id_rekanan;
  final String no_pbb_ls;
  final String tgl_belanja;

  DokumenUpload copyWith(
          {required int id_jenis,
          required int id_instansi,
          required String keterangan_belanja,
          required String no_spk,
          required String tgl_spk,
          required String no_bast,
          required String tgl_bast,
          required String tahun,
          required String satuan,
          required int volume,
          required int nominal_belanja,
          required int id_rekanan,
          required String no_pbb_ls,
          required String tgl_belanja}) =>
      DokumenUpload(
          id_instansi: id_instansi ?? this.id_instansi,
          id_jenis: id_jenis ?? this.id_jenis,
          keterangan_belanja: keterangan_belanja ?? this.keterangan_belanja,
          no_spk: no_spk ?? this.no_spk,
          tgl_spk: tgl_spk ?? this.tgl_spk,
          no_bast: no_bast ?? this.no_bast,
          tgl_bast: tgl_bast ?? this.tgl_bast,
          tahun: tahun ?? this.tahun,
          satuan: satuan ?? this.satuan,
          volume: volume ?? this.volume,
          nominal_belanja: nominal_belanja ?? this.nominal_belanja,
          id_rekanan: id_rekanan ?? this.id_rekanan,
          no_pbb_ls: no_pbb_ls ?? this.no_pbb_ls,
          tgl_belanja: tgl_belanja ?? this.tgl_belanja);

  @override
  List<Object?> get props => [
        id_instansi,
        id_jenis,
        keterangan_belanja,
        no_spk,
        tgl_spk,
        no_bast,
        tgl_bast,
        tahun,
        satuan,
        volume,
        nominal_belanja,
        id_rekanan,
        no_pbb_ls,
        tgl_belanja
      ];
}
