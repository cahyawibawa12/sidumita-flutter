import 'dart:convert';

import 'package:posyandu/Model/CekDataModel.dart';
import 'package:posyandu/Model/StatusBeratIbuModel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CekDataService {
  Future<http.Response> cekDataBeratBoys(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-berat-boys');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekDataBeratGirls(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-berat-girls');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekDataTinggiBoys(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-tinggi-boys');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekDataTinggiGirls(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-tinggi-girls');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekDataKepalaBoys(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-kepala-boys');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekDataKepalaGirls(CekDataModel cekDataModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'cek-kepala-girls');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(cekDataModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> getBeratIbu(int ibu_hamil_id) async {
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'data-grafik-ibu-hamil/' + ibu_hamil_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> statusBeratIbu(
      StatusBeratIbuModel statusBeratIbuModel) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL +
        'cek-berat-ibu-hamil' +
        '?' +
        'ibu_hamil_id=' +
        statusBeratIbuModel.id.toString() +
        '&berat_badan=' +
        statusBeratIbuModel.beratBadan.toString() +
        '&umur_kandungan=' +
        statusBeratIbuModel.umurKandungan.toString());
    http.Response response = await http.post(url,
        headers: setHeaders(token),
        body: jsonEncode(statusBeratIbuModel.toJson()));
    print(response.body);
    return response;
  }

  Future<http.Response> cekImunisasiBalita(int balita_id) async {
    var token = await getToken();
    var url =
        Uri.parse(baseURL + 'cek-imunisasi-balita/' + balita_id.toString());
    http.Response response = await http.get(
      url,
      headers: setHeaders(token),
    );
    print(response.body);
    return response;
  }
}
