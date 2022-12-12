class GetTwoLastDataPemeriksaanModel {
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

  GetTwoLastDataPemeriksaanModel({
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
}
