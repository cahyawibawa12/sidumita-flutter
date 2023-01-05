import 'dart:ffi';

class PemeriksaanBalitaModel {
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

  PemeriksaanBalitaModel({
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

  factory PemeriksaanBalitaModel.fromJson(Map<String, dynamic> json) =>
      PemeriksaanBalitaModel(
        id: json["id"],
        tanggalPemeriksaan: json["tanggal_pemeriksaan"],
        lingkarKepala: json["lingkar_kepala"],
        lingkarLengan: json["lingkar_lengan"],
        tinggiBadan: json["tinggi_badan"],
        beratBadan: json["berat_badan"],
        penanganan: json["penanganan"],
        keluhan: json["keluhan"],
        catatan: json["catatan"],
        vitaminId: json["vitamin_id"],
        balitaId: json["balita_id"],
        petugasKesehatanId: json["petugas_kesehatan_id"],
        dokterId: json["dokter_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}
