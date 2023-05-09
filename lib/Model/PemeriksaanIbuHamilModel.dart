class PemeriksaanIbuHamilModel {
  int id;
  String tanggalPemeriksaan;
  String umurKandungan;
  double tinggiBadan;
  double beratBadan;
  double lingkarPerut;
  double denyutJantungBayi;
  double denyutNadi;
  String penanganan;
  String keluhan;
  String catatan;
  int ibuHamilId;
  int petugasKesehatanId;
  // String createdAt;
  // String updatedAt;

  PemeriksaanIbuHamilModel({
    required this.id,
    required this.tanggalPemeriksaan,
    required this.umurKandungan,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.lingkarPerut,
    required this.denyutJantungBayi,
    required this.denyutNadi,
    required this.penanganan,
    required this.keluhan,
    required this.catatan,
    required this.ibuHamilId,
    required this.petugasKesehatanId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory PemeriksaanIbuHamilModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanIbuHamilModel(
        id: json['id'],
        tanggalPemeriksaan: json['tanggal_pemeriksaan'],
        umurKandungan: json['umur_kandungan'],
        tinggiBadan: json['tinggi_badan'].toDouble(),
        beratBadan: json['berat_badan'].toDouble(),
        lingkarPerut: json['lingkar_perut'].toDouble(),
        denyutJantungBayi: json['denyut_jantung_bayi'].toDouble(),
        denyutNadi: json['denyut_nadi'].toDouble(),
        penanganan: json['penanganan'],
        keluhan: json['keluhan'],
        catatan: json['catatan'],
        ibuHamilId: json['ibu_hamil_id'],
        petugasKesehatanId: json['petugas_kesehatan_id'],
        // createdAt: json['created_at'],
        // updatedAt: json['updated_at'],
      );
}
