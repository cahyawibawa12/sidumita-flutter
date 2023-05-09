class DataBeratIbuModel {
  int? beratBadan;
  String? umurKandungan;

  DataBeratIbuModel({this.beratBadan, this.umurKandungan});

  DataBeratIbuModel.fromJson(Map<String, dynamic> json) {
    beratBadan = json['berat_badan'];
    umurKandungan = json['umur_kandungan'];
  }

  // factory DataBeratIbuModel.fromJson(Map<String, dynamic> json) =>
  //     DataBeratIbuModel(
  //       beratBadan: json['berat_badan'],
  //       umurKandungan: json['umur_kandungan'],
  //     );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['berat_badan'] = this.beratBadan;
    data['umur_kandungan'] = this.umurKandungan;
    return data;
  }
}
