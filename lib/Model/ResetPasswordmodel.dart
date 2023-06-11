class ResetPasswordModel {
  String? email;

  ResetPasswordModel({this.email});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    email = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.email;

    return data;
  }
}
