class KabupatenModel {
  int? id;
  String? namaKabupaten;
  int? provinsiId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  KabupatenModel(
      {this.id,
      this.namaKabupaten,
      this.provinsiId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  KabupatenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKabupaten = json['nama_kabupaten'];
    provinsiId = json['provinsi_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kabupaten'] = this.namaKabupaten;
    data['provinsi_id'] = this.provinsiId!.toInt();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
