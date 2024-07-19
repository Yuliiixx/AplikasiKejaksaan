import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  bool? sukses;
  int status;
  String pesan;
  Data? data; // Mengizinkan data untuk bernilai null

  ModelUser({
    this.sukses,
    required this.status,
    required this.pesan,
    this.data, // Tidak wajib untuk diisi
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        sukses: json["sukses"],
        status: json["status"],
        pesan: json["pesan"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "sukses": sukses,
        "status": status,
        "pesan": pesan,
        "data": data?.toJson(), // Menggunakan null-aware operator
      };
}

class Data {
  String id;
  String name;
  String email;
  String password;
  String phone;
  String noktp;
  String address;
  String role;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.noktp,
    required this.address,
    required this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        noktp: json["noktp"],
        address: json["address"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "noktp": noktp,
        "address": address,
        "role": role,
      };
}
