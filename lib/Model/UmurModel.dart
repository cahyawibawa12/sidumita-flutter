class UmurModel {
  int? umur;
  String? format;
  int? usiaBulan;

  UmurModel({this.umur, this.format, this.usiaBulan});

  UmurModel.fromJson(Map<String, dynamic> json) {
    umur = json['umur'];
    format = json['format'];
    usiaBulan = json['usia_bulan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['umur'] = this.umur;
    data['format'] = this.format;
    data['usia_bulan'] = this.usiaBulan;
    return data;
  }
}
