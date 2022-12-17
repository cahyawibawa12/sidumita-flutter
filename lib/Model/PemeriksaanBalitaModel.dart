class PemeriksaanBalitaModel {
  int id;
  String tanggal_pemeriksaan;
  double lingkar_kepala;
  double lingkar_lengan;
  double tinggi_badan;
  double berat_badan;
  String penanganan;
  String keluhan;
  int bulan_imunisasi_id;
  int balita_id;
  int petugas_kesehatan_id;
  String created_at;
  String updated_at;

  PemeriksaanBalitaModel({
    required this.id,
    required this.tanggal_pemeriksaan,
    required this.lingkar_kepala,
    required this.lingkar_lengan,
    required this.tinggi_badan,
    required this.berat_badan,
    required this.penanganan,
    required this.keluhan,
    required this.bulan_imunisasi_id,
    required this.balita_id,
    required this.petugas_kesehatan_id,
    required this.created_at,
    required this.updated_at,
  });

  factory PemeriksaanBalitaModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanBalitaModel(
        id: json["id"],
        tanggal_pemeriksaan: json["tanggal_pemeriksaan"],
        lingkar_kepala: json["lingkar_kepala"],
        lingkar_lengan: json["lingkar_lengan"],
        tinggi_badan: json["tinggi_badan"],
        berat_badan: json["berat_badan"],
        penanganan: json["penanganan"],
        keluhan: json["keluhan"],
        bulan_imunisasi_id: json["bulan_imunisasi_id"],
        balita_id: json["balita_id"],
        petugas_kesehatan_id: json["petugas_kesehatan_id"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
