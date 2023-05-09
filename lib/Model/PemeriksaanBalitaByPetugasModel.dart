class PemeriksaanBalitaByPetugas {
  int? id;
  String? tanggalPemeriksaan;
  String? umurBalita;
  double? lingkarKepala;
  double? lingkarLengan;
  double? tinggiBadan;
  double? beratBadan;
  String? penanganan;
  String? keluhan;
  String? catatan;
  int? vitaminId;
  int? balitaId;
  int? petugasKesehatanId;
  int? dokterId;
  List<int>? vaksinId = [];
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<DetailPemeriksaanBalita>? detailPemeriksaanBalita;

  PemeriksaanBalitaByPetugas(
      {this.id,
      this.tanggalPemeriksaan,
      this.umurBalita,
      this.lingkarKepala,
      this.lingkarLengan,
      this.tinggiBadan,
      this.beratBadan,
      this.penanganan,
      this.keluhan,
      this.catatan,
      this.vitaminId,
      this.balitaId,
      this.petugasKesehatanId,
      this.dokterId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.detailPemeriksaanBalita});

  PemeriksaanBalitaByPetugas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggalPemeriksaan = json['tanggal_pemeriksaan'];
    umurBalita = json['umur_balita'];
    lingkarKepala = json['lingkar_kepala'];
    lingkarLengan = json['lingkar_lengan'];
    tinggiBadan = json['tinggi_badan'];
    beratBadan = json['berat_badan'];
    penanganan = json['penanganan'];
    keluhan = json['keluhan'];
    catatan = json['catatan'];
    vitaminId = json['vitamin_id'];
    balitaId = json['balita_id'];
    petugasKesehatanId = json['petugas_kesehatan_id'];
    dokterId = json['dokter_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['detail_pemeriksaan_balita'] != null) {
      detailPemeriksaanBalita = <DetailPemeriksaanBalita>[];
      json['detail_pemeriksaan_balita'].forEach((v) {
        detailPemeriksaanBalita!.add(new DetailPemeriksaanBalita.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal_pemeriksaan'] = this.tanggalPemeriksaan;
    data['umur_balita'] = this.umurBalita;
    data['lingkar_kepala'] = this.lingkarKepala;
    data['lingkar_lengan'] = this.lingkarLengan;
    data['tinggi_badan'] = this.tinggiBadan;
    data['berat_badan'] = this.beratBadan;
    data['penanganan'] = this.penanganan;
    data['keluhan'] = this.keluhan;
    data['catatan'] = this.catatan;
    data['vitamin_id'] = this.vitaminId;
    data['balita_id'] = this.balitaId;
    data['petugas_kesehatan_id'] = this.petugasKesehatanId;
    data['dokter_id'] = this.dokterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['vaksin_id'] = this.vaksinId;
    if (this.detailPemeriksaanBalita != null) {
      data['detail_pemeriksaan_balita'] =
          this.detailPemeriksaanBalita!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailPemeriksaanBalita {
  int? id;
  int? pemeriksaanBalitaId;
  int? balitaId;
  List<int>? vaksinId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  DetailPemeriksaanBalita(
      {this.id,
      this.pemeriksaanBalitaId,
      this.balitaId,
      this.vaksinId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DetailPemeriksaanBalita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pemeriksaanBalitaId = json['pemeriksaan_balita_id'];
    balitaId = json['balita_id'];
    vaksinId = json['vaksin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pemeriksaan_balita_id'] = this.pemeriksaanBalitaId;
    data['balita_id'] = this.balitaId;
    data['vaksin_id'] = this.vaksinId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
