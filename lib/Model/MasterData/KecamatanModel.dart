class KecamatanModel {
  int? id;
  String? namaKecamatan;
  int? kabupatenId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  KecamatanModel(
      {this.id,
      this.namaKecamatan,
      this.kabupatenId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  KecamatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKecamatan = json['nama_kecamatan'];
    kabupatenId = json['kabupaten_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kecamatan'] = this.namaKecamatan;
    data['kabupaten_id'] = this.kabupatenId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
