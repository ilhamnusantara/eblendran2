part of 'models.dart';

class User extends Equatable {
  User({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final UserClass user;

  User copyWith({
    required String accessToken,
    required String tokenType,
    required int expiresIn,
    required UserClass user,
  }) =>
      User(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        user: user ?? this.user,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user.toJson(),
      };

  @override
  List<Object?> get props => [accessToken, tokenType];
}

class UserClass extends Equatable {
  UserClass({
    required this.id,
    required this.name,
    required this.username,
    required this.idInstansi,
    required this.email,
    required this.status,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String username;
  final int idInstansi;
  final String email;
  final String status;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserClass copyWith({
    required int id,
    required String name,
    required String username,
    required int idInstansi,
    required String email,
    required String status,
    required dynamic emailVerifiedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) =>
      UserClass(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        idInstansi: idInstansi ?? this.idInstansi,
        email: email ?? this.email,
        status: status ?? this.status,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        idInstansi: json["id_instansi"],
        email: json["email"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "id_instansi": idInstansi,
        "email": email,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [id, name, username, idInstansi, email, status];
}
