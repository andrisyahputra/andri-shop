import 'dart:convert';

class AuthResponseModel {
  final String jwtToken;
  final User user;

  AuthResponseModel({
    required this.jwtToken,
    required this.user,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        jwtToken: json["jwt-token"] as String,
        user: User.fromMap(json["user"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        "jwt-token": jwtToken,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;
  final String?
      role; // Menggunakan tanda tanya (?) untuk mengizinkan nilai null

  User({
    required this.id,
    required this.name,
    this.role, // Mengizinkan role untuk null
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] as int,
        name: json["name"] as String,
        role: json["role"]
            as String?, // Menggunakan tanda tanya (?) untuk mengizinkan nilai null
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "role": role,
      };
}
