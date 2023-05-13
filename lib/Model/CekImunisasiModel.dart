class CekImunisasiModel {
  int? vaksinId;
  String? vaksin;
  String? status;

  CekImunisasiModel({this.vaksinId, this.vaksin, this.status});

  CekImunisasiModel.fromJson(Map<String, dynamic> json) {
    vaksinId = json['vaksin_id'];
    vaksin = json['vaksin'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaksin_id'] = this.vaksinId;
    data['vaksin'] = this.vaksin;
    data['status'] = this.status;
    return data;
  }
}
