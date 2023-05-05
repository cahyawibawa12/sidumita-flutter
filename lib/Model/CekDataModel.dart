class CekDataModel {
  String? status;
  int? umur;
  double? dataUkur;

  CekDataModel({this.status, this.umur, this.dataUkur});

  CekDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    umur = json['umur'];
    dataUkur = json['data_ukur'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['umur'] = this.umur;
    data['data_ukur'] = this.dataUkur;
    return data;
  }
}
