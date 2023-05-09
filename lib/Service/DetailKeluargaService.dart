import 'dart:convert';

import 'package:posyandu/Model/DetailKeluargaModel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailKeluargaService {
  Future<http.Response> showDetailKeluarga() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/detail-keluarga');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> storeMyDetailKeluarga(
      DetailKeluargaModel detailKeluargaModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/create-detail-keluarga');
    http.Response response = await http.post(url,
        headers: setHeaders(token),
        body: jsonEncode(detailKeluargaModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> updateMyDetailKeluarga(
      DetailKeluargaModel detailKeluargaModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/update-detail-keluarga');
    http.Response response = await http.post(url,
        headers: setHeaders(token),
        body: jsonEncode(detailKeluargaModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> deleteMyDetailKeluarga(int id) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'detail-keluarga/' + id.toString());
    http.Response response = await http.delete(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> GetUmur(int id) async {
    var token = await getToken();
    var url = Uri.parse(baseURL + 'umur/' + id.toString());
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }
}
