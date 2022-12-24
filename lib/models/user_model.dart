import 'package:eblendrang2/models/instansi_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String password;
  final int status;
  final InstansiModel instansi;
  late final String token;

  UserModel(
      {required this.status,
      required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.instansi,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: (json['status'] == null) ? 1 : json['status'],
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        instansi: InstansiModel.fromJson(json['instansi']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'instansi': instansi.toJson(),
      'token': token,
    };
  }
}
