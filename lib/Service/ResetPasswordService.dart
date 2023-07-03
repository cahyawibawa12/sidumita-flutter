import 'dart:convert';

import 'package:posyandu/Model/ResetPasswordmodel.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordService {
  // var data = {'email': email};
  Future<http.Response> SendEmailOTP(data) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'auth/request_otp');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(data));
    print(response.body);
    return response;
  }

  Future<http.Response> VerifOtp(data) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'auth/verify_otp');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(data));
    print(response.body);
    return response;
  }

  Future<http.Response> resetPassword(data) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var token = localStorage.getString('token')?.replaceAll('"', "");
    var token = await getToken();
    var url = Uri.parse(baseURL + 'auth/forgot_password');
    http.Response response = await http.post(url,
        headers: setHeaders(token), body: jsonEncode(data));
    print(response.body);
    return response;
  }
}
