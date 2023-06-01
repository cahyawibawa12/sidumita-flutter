import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:posyandu/Service/token.dart';
import 'package:posyandu/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

// var token;
// getToken() async {
//   SharedPreferences localStorage = await SharedPreferences.getInstance();
//   // var jsonDecode2 = jsonDecode(localStorage.getString('token')!);
//   // token = (jsonDecode2['access_token']);
//   token = jsonDecode(localStorage.getString('token') ?? '');
//   return token;
// }

class Network {
  final String _url = 'https://sidumita.definitelynotgod.com/api/';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var jsonDecode2 = jsonDecode(localStorage.getString('token')!);
    // token = (jsonDecode2['access_token']);
    token =
        jsonDecode(localStorage.getString('token')?.replaceAll('"', "") ?? '');
  }

  auth(data, apiURL) async {
    var fullUrl = Uri.parse(_url + apiURL);
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = Uri.parse(_url + apiURL);
    var token = await getToken();
    return await http.post(fullUrl, headers: setHeaders(token));
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer$token',
      };
}

// pasangHeaders() {
//   var tokens = getToken();
//   Map<String, String> requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $tokens'
//   };

//   print('p= $requestHeaders');
//   return requestHeaders;
// }


// setHeaders() => {
//       'Content-type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
