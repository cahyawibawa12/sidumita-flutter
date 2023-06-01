class PetugasWithIbuHamilModel {
  String? id;
  String? beratBadanPrakehamilan;
  String? tinggiBadanPrakehamilan;
  String? detailKeluargaId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
  String? noKartuKeluarga;
  String? kepalaKeluarga;
  String? alamat;
  String? jumlah;
  String? userId;
  String? dusunId;
  String? namaDusun;
  String? desaId;

  PetugasWithIbuHamilModel(
      {this.id,
      this.beratBadanPrakehamilan,
      this.tinggiBadanPrakehamilan,
      this.detailKeluargaId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
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
      this.noKartuKeluarga,
      this.kepalaKeluarga,
      this.alamat,
      this.jumlah,
      this.userId,
      this.dusunId,
      this.namaDusun,
      this.desaId});

  PetugasWithIbuHamilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beratBadanPrakehamilan = json['berat_badan_prakehamilan'];
    tinggiBadanPrakehamilan = json['tinggi_badan_prakehamilan'];
    detailKeluargaId = json['detail_keluarga_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
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
    noKartuKeluarga = json['no_kartu_keluarga'];
    kepalaKeluarga = json['kepala_keluarga'];
    alamat = json['alamat'];
    jumlah = json['jumlah'];
    userId = json['user_id'];
    dusunId = json['dusun_id'];
    namaDusun = json['nama_dusun'];
    desaId = json['desa_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['berat_badan_prakehamilan'] = this.beratBadanPrakehamilan;
    data['tinggi_badan_prakehamilan'] = this.tinggiBadanPrakehamilan;
    data['detail_keluarga_id'] = this.detailKeluargaId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
    data['no_kartu_keluarga'] = this.noKartuKeluarga;
    data['kepala_keluarga'] = this.kepalaKeluarga;
    data['alamat'] = this.alamat;
    data['jumlah'] = this.jumlah;
    data['user_id'] = this.userId;
    data['dusun_id'] = this.dusunId;
    data['nama_dusun'] = this.namaDusun;
    data['desa_id'] = this.desaId;
    return data;
  }
}
