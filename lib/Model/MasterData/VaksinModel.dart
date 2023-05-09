class VaksinModel {
  int? id;
  String? namaVaksin;
  String? dosis;
  String? catatan;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  VaksinModel(
      {this.id,
      this.namaVaksin,
      this.dosis,
      this.catatan,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  VaksinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaVaksin = json['nama_vaksin'];
    dosis = json['dosis'];
    catatan = json['catatan'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_vaksin'] = this.namaVaksin;
    data['dosis'] = this.dosis;
    data['catatan'] = this.catatan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
