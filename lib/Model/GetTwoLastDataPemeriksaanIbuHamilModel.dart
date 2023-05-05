class GetTwoLastDataPemeriksaanIbuHamilModel {
  int id;
  String tanggalPemeriksaan;
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

  GetTwoLastDataPemeriksaanIbuHamilModel({
    required this.id,
    required this.tanggalPemeriksaan,
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
}
