class DokterModel {
  int? id;
  String? nip;
  String? namaDokter;
  String? noTelp;
  String? alamat;
  int? dusunId;
  Null? createdAt;
  Null? updatedAt;
  Dusun? dusun;

  DokterModel(
      {this.id,
      this.nip,
      this.namaDokter,
      this.noTelp,
      this.alamat,
      this.dusunId,
      this.createdAt,
      this.updatedAt,
      this.dusun});

  DokterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nip = json['nip'];
    namaDokter = json['nama_dokter'];
    noTelp = json['no_telp'];
    alamat = json['alamat'];
    dusunId = json['dusun_id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    dusun = json['dusun'] != null ? new Dusun.fromJson(json['dusun']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nip'] = this.nip;
    data['nama_dokter'] = this.namaDokter;
    data['no_telp'] = this.noTelp;
    data['alamat'] = this.alamat;
    data['dusun_id'] = this.dusunId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.dusun != null) {
      data['dusun'] = this.dusun!.toJson();
    }
    return data;
  }
}

class Dusun {
  int? id;
  String? namaDusun;
  int? desaId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Dusun(
      {this.id,
      this.namaDusun,
      this.desaId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Dusun.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaDusun = json['nama_dusun'];
    desaId = json['desa_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_dusun'] = this.namaDusun;
    data['desa_id'] = this.desaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
