class KeluargaModel {
  int? id;
  String? noKartuKeluarga;
  String? kepalaKeluarga;
  String? alamat;
  int? jumlah;
  int? userId;
  int? dusunId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Dusun? dusun;
  User? user;
  List<DetailKeluargas>? detailKeluargas;

  KeluargaModel(
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
      this.dusun,
      this.user,
      this.detailKeluargas});

  KeluargaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noKartuKeluarga = json['no_kartu_keluarga'];
    kepalaKeluarga = json['kepala_keluarga'];
    alamat = json['alamat'];
    jumlah = json['jumlah_keluarga'];
    userId = json['user_id'];
    dusunId = json['dusun_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dusun = json['dusun'] != null ? new Dusun.fromJson(json['dusun']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['detail_keluargas'] != null) {
      detailKeluargas = <DetailKeluargas>[];
      json['detail_keluargas'].forEach((v) {
        detailKeluargas!.add(new DetailKeluargas.fromJson(v));
      });
    }
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
    if (this.dusun != null) {
      data['dusun'] = this.dusun!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.detailKeluargas != null) {
      data['detail_keluargas'] =
          this.detailKeluargas!.map((v) => v.toJson()).toList();
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

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  int? roleId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.roleId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class DetailKeluargas {
  int? id;
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
  int? keluargaId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  DetailKeluargas(
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

  DetailKeluargas.fromJson(Map<String, dynamic> json) {
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
