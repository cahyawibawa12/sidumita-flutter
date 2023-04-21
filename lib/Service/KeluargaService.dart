import 'dart:convert';

import 'package:posyandu/Model/KeluargaModel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KeluargaService {
  Future<http.Response> showMyKeluarga() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/keluarga');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> storeMyKeluarga(KeluargaModel keluargaModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/create-keluarga');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(keluargaModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> updateMyKeluarga(KeluargaModel keluargaModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/update-keluarga');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(keluargaModel.toJson()));
    print(response.body);
    return response;
  }
}
