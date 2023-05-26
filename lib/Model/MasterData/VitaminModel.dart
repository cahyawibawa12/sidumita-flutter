class VitaminModel {
  int? id;
  String? namaVitamin;
  String? dosis;
  String? catatan;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  VitaminModel(
      {this.id,
      this.namaVitamin,
      this.dosis,
      this.catatan,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  VitaminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaVitamin = json['nama_vitamin'];
    dosis = json['dosis'];
    catatan = json['catatan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_vitamin'] = this.namaVitamin;
    data['dosis'] = this.dosis;
    data['catatan'] = this.catatan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
