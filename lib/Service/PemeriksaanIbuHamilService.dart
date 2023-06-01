import 'dart:convert';

import 'package:posyandu/Model/PemeriksaanIbuHamilByPetugasModel.dart';
import 'package:posyandu/Model/PemeriksaanIbuHamilModel.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;

class PemeriksaanIbuHamilService {
  Future<http.Response> pemeriksaanibuhamil(int ibu_hamil_id) async {
    var token = await getToken();
    var url = Uri.parse(
        baseURL + 'pemeriksaan-ibuhamil/ibuhamil/' + ibu_hamil_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> StorePemeriksaanIbuByPetugas(
      PemeriksaanIbuHamilByPetugasModel
          pemeriksaanIbuHamilByPetugasModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'pemeriksaan-ibu-hamil/byPetugas');
    http.Response response = await http.post(url,
        headers: setHeaders(token),
        body: jsonEncode(pemeriksaanIbuHamilByPetugasModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> deletePemeriksaanIbuHamilByPetugas(int id) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'destroy/pemeriksaan-ibuhamil/' + id.toString());
    http.Response response = await http.post(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }
}
