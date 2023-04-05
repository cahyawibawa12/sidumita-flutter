import 'dart:convert';

import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;

class GetTwoLastDataPemeriksaanIbuHamilService {
  Future<http.Response> twolastdatapemeriksaanibuhamil(int ibu_hamil_id) async {
    var token = await getToken();
    var url = Uri.parse(baseURL +
        'pemeriksaan-ibuhamil/latest-ibuhamil/' +
        ibu_hamil_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }
}
