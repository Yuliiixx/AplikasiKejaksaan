import 'dart:convert';

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  bool sukses;
  int status;
  String pesan;
  Data data;

  ModelLogin({
    required this.sukses,
    required this.status,
    required this.pesan,
    required this.data,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        sukses: json["sukses"],
        status: json["status"],
        pesan: json["pesan"],
        data: json["data"] != null
            ? Data.fromJson(json["data"])
            : Data(
                id_user: "",
                nama: "",
                email: "",
                password: "",
                no_telpon: "",
                noktp: "",
                alamat: "",
                level: "",
              ),
      );

  Map<String, dynamic> toJson() => {
        "sukses": sukses,
        "status": status,
        "pesan": pesan,
        "data": data.toJson(),
      };
}

class Data {
  String id_user;
  String nama;
  String email;
  String password;
  String no_telpon;
  String noktp;
  String alamat;
  String level;

  Data({
    required this.id_user,
    required this.nama,
    required this.email,
    required this.password,
    required this.no_telpon,
    required this.noktp,
    required this.alamat,
    required this.level,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id_user: json['id_user'] ?? "",
        nama: json['nama'] ?? "",
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        no_telpon: json['no_telpon'] ?? "",
        noktp: json['noktp'] ?? "",
        alamat: json['alamat'] ?? "",
        level: json['level'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id_user": id_user,
        "nama": nama,
        "email": email,
        "password": password,
        "no_telpon": no_telpon,
        "noktp": noktp,
        "alamat": alamat,
        "level": level,
      };
}
