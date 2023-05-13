import 'dart:convert';

import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;

class DetailPemeriksaanBalitaService {
  Future<http.Response> detailpemeriksaanbalita(int balita_id) async {
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'detailpemeriksaan-balita/' + balita_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> showDetailPemeriksaanBalita(int balita_id) async {
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'detailpemeriksaan/balita/' + balita_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }
}
