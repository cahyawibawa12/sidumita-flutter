
class DusunModel {
  int? id;
  String? namaDusun;
  int? desaId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Desa? desa;

  DusunModel(
      {this.id,
      this.namaDusun,
      this.desaId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.desa});

  DusunModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaDusun = json['nama_dusun'];
    desaId = json['desa_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    desa = json['desa'] != null ? new Desa.fromJson(json['desa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_dusun'] = this.namaDusun;
    data['desa_id'] = this.desaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.desa != null) {
      data['desa'] = this.desa!.toJson();
    }
    return data;
  }
}

class Desa {
  int? id;
  String? namaDesa;
  int? kecamatanId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Desa(
      {this.id,
      this.namaDesa,
      this.kecamatanId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Desa.fromJson(Map<String, dynamic> json) {
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
