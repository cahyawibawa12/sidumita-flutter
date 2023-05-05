class PetugasModel {
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
  String? namaDusun;
  int? desaId;
  String? namaDesa;
  int? kecamatanId;
  String? namaKecamatan;
  int? kabupatenId;
  String? namaKabupaten;
  int? provinsiId;
  String? namaProvinsi;

  PetugasModel(
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
      this.namaDusun,
      this.desaId,
      this.namaDesa,
      this.kecamatanId,
      this.namaKecamatan,
      this.kabupatenId,
      this.namaKabupaten,
      this.provinsiId,
      this.namaProvinsi});

  PetugasModel.fromJson(Map<String, dynamic> json) {
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
    namaDusun = json['nama_dusun'];
    desaId = json['desa_id'];
    namaDesa = json['nama_desa'];
    kecamatanId = json['kecamatan_id'];
    namaKecamatan = json['nama_kecamatan'];
    kabupatenId = json['kabupaten_id'];
    namaKabupaten = json['nama_kabupaten'];
    provinsiId = json['provinsi_id'];
    namaProvinsi = json['nama_provinsi'];
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
    data['nama_dusun'] = this.namaDusun;
    data['desa_id'] = this.desaId;
    data['nama_desa'] = this.namaDesa;
    data['kecamatan_id'] = this.kecamatanId;
    data['nama_kecamatan'] = this.namaKecamatan;
    data['kabupaten_id'] = this.kabupatenId;
    data['nama_kabupaten'] = this.namaKabupaten;
    data['provinsi_id'] = this.provinsiId;
    data['nama_provinsi'] = this.namaProvinsi;
    return data;
  }
}
