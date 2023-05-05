class ProvinsiModel {
  int? id;
  String? namaProvinsi;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ProvinsiModel(
      {this.id,
      this.namaProvinsi,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProvinsiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProvinsi = json['nama_provinsi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_provinsi'] = this.namaProvinsi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
