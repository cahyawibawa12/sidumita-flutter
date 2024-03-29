class GetTwoLastDataPemeriksaanModel {
  int id;
  String tanggalPemeriksaan;
  double lingkarKepala;
  double lingkarLengan;
  double tinggiBadan;
  double beratBadan;
  String penanganan;
  String keluhan;
  String catatan;
  int vitaminId;
  int balitaId;
  int petugasKesehatanId;
  int dokterId;
  String createdAt;
  String updatedAt;

  GetTwoLastDataPemeriksaanModel({
    required this.id,
    required this.tanggalPemeriksaan,
    required this.lingkarKepala,
    required this.lingkarLengan,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.penanganan,
    required this.keluhan,
    required this.catatan,
    required this.vitaminId,
    required this.balitaId,
    required this.petugasKesehatanId,
    required this.dokterId,
    required this.createdAt,
    required this.updatedAt,
  });
}
