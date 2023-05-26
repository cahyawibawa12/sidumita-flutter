class CekImunisasiModel {
  int? vaksinId;
  String? vaksin;
  String? status;
  String? tanggalPemeriksaan;

  CekImunisasiModel(
      {this.vaksinId, this.vaksin, this.status, this.tanggalPemeriksaan});

  CekImunisasiModel.fromJson(Map<String, dynamic> json) {
    vaksinId = json['vaksin_id'];
    vaksin = json['vaksin'];
    status = json['status'];
    tanggalPemeriksaan = json['tanggal_pemeriksaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaksin_id'] = this.vaksinId;
    data['vaksin'] = this.vaksin;
    data['status'] = this.status;
    data['tanggal_pemeriksaan'] = this.tanggalPemeriksaan;
    return data;
  }
}
