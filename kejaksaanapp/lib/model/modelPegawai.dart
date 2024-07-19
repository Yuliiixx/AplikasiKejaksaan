class Pegawai {
  final int? id;
  final String nama;
  final String nohp;
  final String ktp;
  final String laporan;
  final String dokumen;
  final String status;

  Pegawai({
    this.id,
    required this.nama,
    required this.nohp,
    required this.ktp,
    required this.laporan,
    required this.dokumen,
    required this.status,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) {
    return Pegawai(
      id: json['id'],
      nama: json['nama'],
      nohp: json['nohp'],
      ktp: json['ktp'],
      laporan: json['laporan'],
      dokumen: json['dokumen'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nohp': nohp,
      'ktp': ktp,
      'laporan': laporan,
      'dokumen': dokumen,
      'status': status,
    };
  }
}
