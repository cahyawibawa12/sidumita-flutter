class UpdatePetugasModel {
  int? id;
  String? nama;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? alamat;
  String? noTelp;
  String? nik;
  int? userId;
  int? dusunId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  UpdatePetugasModel(
      {this.id,
      this.nama,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.alamat,
      this.noTelp,
      this.nik,
      this.userId,
      this.dusunId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UpdatePetugasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    noTelp = json['no_telp'];
    nik = json['nik'];
    userId = json['user_id'];
    dusunId = json['dusun_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['alamat'] = this.alamat;
    data['no_telp'] = this.noTelp;
    data['nik'] = this.nik;
    data['user_id'] = this.userId;
    data['dusun_id'] = this.dusunId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
