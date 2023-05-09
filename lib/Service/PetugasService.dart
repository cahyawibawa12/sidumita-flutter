import 'dart:convert';

import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Model/PetugasModel.dart';

import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PetugasService {
  Future<http.Response> showMyPetugas() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/petugas');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> showBalitaForPetugas() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'petugas/with-balita');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> showIbuHamilForPetugas() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'petugas/with-ibu-hamil');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> updateMyPetugas(PetugasModel petugasModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/update-petugas');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(petugasModel.toJson()));
    print(response.body);
    return response;
  }
}
