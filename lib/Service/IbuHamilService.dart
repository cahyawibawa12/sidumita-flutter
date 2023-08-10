import 'dart:convert';

import 'package:posyandu/Model/IbuHamilModel.dart';

import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IbuHamilService {
  Future<http.Response> showMyIbuHamils() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'me/ibu-hamil');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> updateMyIbuHamils(IbuHamilModel ibuHamilModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'ibu-hamil/' + ibuHamilModel.id.toString());
    http.Response response = await http.patch(url,
        headers: setHeaders(token), body: jsonEncode(ibuHamilModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> storeMyIbuHamil(IbuHamilModel ibuHamilModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'ibu-hamil');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(ibuHamilModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> showKehamilanIbuForPetugas(
      int detail_keluarga_id) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(
        baseURL + 'ibu-hamil/from-detail/' + detail_keluarga_id.toString());
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }
}
