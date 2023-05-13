import 'dart:convert';

import 'package:posyandu/Model/PemeriksaanBalitaByPetugasModel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PemeriksaanBalitaService {
  Future<http.Response> pemeriksaanbalita(int balita_id) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(
        baseURL + 'pemeriksaan-balita/balita/' + balita_id.toString());
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> StorePemeriksaanBalitaByPetugas(
      PemeriksaanBalitaByPetugas pemeriksaanBalitaByPetugas) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'pemeriksaan-balita/byPetugas');
    http.Response response = await http.post(url,
        headers: setHeaders(token),
        body: jsonEncode(pemeriksaanBalitaByPetugas.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> deletePemeriksaanBalitaByPetugas(int id) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'destroy/pemeriksaan-balita/' + id.toString());
    http.Response response = await http.post(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }
}
