class KontenModel {
  int? id;
  String? judul;
  String? konten;
  String? gambar;
  String? createdAt;
  String? updatedAt;

  KontenModel(
      {this.id,
      this.judul,
      this.konten,
      this.gambar,
      this.createdAt,
      this.updatedAt});

  KontenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    konten = json['konten'];
    gambar = json['gambar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['konten'] = this.konten;
    data['gambar'] = this.gambar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
