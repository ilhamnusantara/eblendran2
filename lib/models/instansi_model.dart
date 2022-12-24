class InstansiModel {
  final int id_instansi;
  final String nama_instansi;
  final int data_null;

  InstansiModel({
    required this.id_instansi,
    required this.nama_instansi,
    required this.data_null,
  });

  factory InstansiModel.fromJson(Map<String, dynamic> json) {
    return InstansiModel(
      id_instansi: json['id_instansi'],
      nama_instansi: json['nama_instansi'],
      data_null: json['data_null'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_instansi'] = this.id_instansi;
    data['nama_instansi'] = this.nama_instansi;
    data['data_null'] = this.data_null;
    return data;
  }
}
