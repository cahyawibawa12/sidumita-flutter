import 'dart:convert';

import 'package:posyandu/Model/MasterData/KecamatanModel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KecamatanService {
  Future<http.Response> showKecamatan() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'kecamatan');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }

  Future<http.Response> fecthKabupaten(KecamatanModel kecamatanModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'fetch-kabupaten');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(kecamatanModel.toJson()));
    print(response.body);
    return response;
  }
}
