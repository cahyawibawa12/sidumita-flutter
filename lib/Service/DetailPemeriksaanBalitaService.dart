import 'dart:convert';

import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;

class DetailPemeriksaanBalitaService {
  Future<http.Response> detailpemeriksaanbalita(int balita_id) async {
    var url =
        Uri.parse(baseURL + 'detailpemeriksaan-balita/' + balita_id.toString());
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);
    return response;
  }
}
