class PetugasWithIbuHamilModel {
  String? id;
  String? namaLengkap;
  String? nik;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? agama;
  String? pendidikan;
  String? noTelp;
  String? golonganDarah;
  String? jenisPekerjaan;
  String? statusPerkawinan;
  String? statusDalamKeluarga;
  String? kewarganegaraan;
  String? keluargaId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  PetugasWithIbuHamilModel(
      {this.id,
      this.namaLengkap,
      this.nik,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.agama,
      this.pendidikan,
      this.noTelp,
      this.golonganDarah,
      this.jenisPekerjaan,
      this.statusPerkawinan,
      this.statusDalamKeluarga,
      this.kewarganegaraan,
      this.keluargaId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PetugasWithIbuHamilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    nik = json['nik'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    agama = json['agama'];
    pendidikan = json['pendidikan'];
    noTelp = json['no_telp'];
    golonganDarah = json['golongan_darah'];
    jenisPekerjaan = json['jenis_pekerjaan'];
    statusPerkawinan = json['status_perkawinan'];
    statusDalamKeluarga = json['status_dalam_keluarga'];
    kewarganegaraan = json['kewarganegaraan'];
    keluargaId = json['keluarga_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_lengkap'] = this.namaLengkap;
    data['nik'] = this.nik;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['agama'] = this.agama;
    data['pendidikan'] = this.pendidikan;
    data['no_telp'] = this.noTelp;
    data['golongan_darah'] = this.golonganDarah;
    data['jenis_pekerjaan'] = this.jenisPekerjaan;
    data['status_perkawinan'] = this.statusPerkawinan;
    data['status_dalam_keluarga'] = this.statusDalamKeluarga;
    data['kewarganegaraan'] = this.kewarganegaraan;
    data['keluarga_id'] = this.keluargaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
