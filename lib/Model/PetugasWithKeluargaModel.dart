class PetugasWithKeluargaModel {
  String? id;
  String? noKartuKeluarga;
  String? kepalaKeluarga;
  String? alamat;
  String? jumlah;
  String? userId;
  String? dusunId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? namaDusun;
  String? desaId;

  PetugasWithKeluargaModel(
      {this.id,
      this.noKartuKeluarga,
      this.kepalaKeluarga,
      this.alamat,
      this.jumlah,
      this.userId,
      this.dusunId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.namaDusun,
      this.desaId});

  PetugasWithKeluargaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    noKartuKeluarga = json['no_kartu_keluarga'];
    kepalaKeluarga = json['kepala_keluarga'];
    alamat = json['alamat'];
    jumlah = json['jumlah'];
    userId = json['user_id'].toString();
    dusunId = json['dusun_id'].toString();
    createdAt = json['created_at'] ?? "-";
    updatedAt = json['updated_at'] ?? "-";
    deletedAt = json['deleted_at'] ?? "-";
    namaDusun = json['nama_dusun'];
    desaId = json['desa_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_kartu_keluarga'] = this.noKartuKeluarga;
    data['kepala_keluarga'] = this.kepalaKeluarga;
    data['alamat'] = this.alamat;
    data['jumlah'] = this.jumlah;
    data['user_id'] = this.userId;
    data['dusun_id'] = this.dusunId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['nama_dusun'] = this.namaDusun;
    data['desa_id'] = this.desaId;
    return data;
  }
}
