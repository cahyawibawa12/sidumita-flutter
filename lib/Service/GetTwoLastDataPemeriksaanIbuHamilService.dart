import 'dart:convert';

import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;

class GetTwoLastDataPemeriksaanIbuHamilService {
  Future<http.Response> twolastdatapemeriksaanibuhamil(int ibu_hamil_id) async {
    var url = Uri.parse(baseURL +
        'pemeriksaan-ibuhamil/latest-ibuhamil/' +
        ibu_hamil_id.toString());
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
