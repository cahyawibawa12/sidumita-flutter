class PemeriksaanIbuHamilByPetugasModel {
  String? tanggalPemeriksaan;
  String? umurKandungan;
  String? lingkarPerut;
  String? denyutNadi;
  String? denyutJantungBayi;
  String? tinggiBadan;
  String? beratBadan;
  String? keluhan;
  String? catatan;
  int? ibuHamilId;
  String? penanganan;
  int? petugasKesehatanId;
  String? updatedAt;
  String? createdAt;
  int? id;

  PemeriksaanIbuHamilByPetugasModel(
      {this.tanggalPemeriksaan,
      this.umurKandungan,
      this.lingkarPerut,
      this.denyutNadi,
      this.denyutJantungBayi,
      this.tinggiBadan,
      this.beratBadan,
      this.keluhan,
      this.catatan,
      this.ibuHamilId,
      this.penanganan,
      this.petugasKesehatanId,
      this.updatedAt,
      this.createdAt,
      this.id});

  PemeriksaanIbuHamilByPetugasModel.fromJson(Map<String, dynamic> json) {
    tanggalPemeriksaan = json['tanggal_pemeriksaan'];
    umurKandungan = json['umur_kandungan'];
    lingkarPerut = json['lingkar_perut'];
    denyutNadi = json['denyut_nadi'];
    denyutJantungBayi = json['denyut_jantung_bayi'];
    tinggiBadan = json['tinggi_badan'];
    beratBadan = json['berat_badan'];
    keluhan = json['keluhan'];
    catatan = json['catatan'];
    ibuHamilId = json['ibu_hamil_id'];
    penanganan = json['penanganan'];
    petugasKesehatanId = json['petugas_kesehatan_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal_pemeriksaan'] = this.tanggalPemeriksaan;
    data['umur_kandungan'] = this.umurKandungan;
    data['lingkar_perut'] = this.lingkarPerut;
    data['denyut_nadi'] = this.denyutNadi;
    data['denyut_jantung_bayi'] = this.denyutJantungBayi;
    data['tinggi_badan'] = this.tinggiBadan;
    data['berat_badan'] = this.beratBadan;
    data['keluhan'] = this.keluhan;
    data['catatan'] = this.catatan;
    data['ibu_hamil_id'] = this.ibuHamilId;
    data['penanganan'] = this.penanganan;
    data['petugas_kesehatan_id'] = this.petugasKesehatanId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
