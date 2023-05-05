class DesaModel {
  int? id;
  String? namaDesa;
  int? kecamatanId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  DesaModel(
      {this.id,
      this.namaDesa,
      this.kecamatanId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DesaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaDesa = json['nama_desa'];
    kecamatanId = json['kecamatan_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_desa'] = this.namaDesa;
    data['kecamatan_id'] = this.kecamatanId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
