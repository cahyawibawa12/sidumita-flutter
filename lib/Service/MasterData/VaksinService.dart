import 'dart:convert';

import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VaksinService {
  Future<http.Response> showVaksin() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'vaksin');
    http.Response response = await http.get(url, headers: setHeaders(token));
    print(response.body);
    return response;
  }
}
