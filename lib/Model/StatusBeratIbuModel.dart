class StatusBeratIbuModel {
  int? id;
  double? imt;
  String? status;
  int? bbMinimal;
  int? bbMaksimal;

  StatusBeratIbuModel(
      {this.id, this.imt, this.status, this.bbMinimal, this.bbMaksimal});

  StatusBeratIbuModel.fromJson(Map<String, dynamic> json) {
    imt = json['imt'];
    status = json['status'];
    bbMinimal = json['bb_minimal'];
    bbMaksimal = json['bb_maksimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imt'] = this.imt;
    data['status'] = this.status;
    data['bb_minimal'] = this.bbMinimal;
    data['bb_maksimal'] = this.bbMaksimal;
    return data;
  }
}
