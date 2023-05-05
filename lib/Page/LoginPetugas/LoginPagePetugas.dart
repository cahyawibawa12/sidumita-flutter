import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/HomePageBalita.dart';
import 'package:posyandu/Page/LandingPage.dart';
import 'package:posyandu/Page/LoginPeserta/LandingLoginPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/RegisterPeserta.dart';
import 'package:posyandu/Page/LupaPassPage.dart';
import 'package:posyandu/Page/Petugas/HomePagePetugas.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:posyandu/globals.dart';
import 'package:posyandu/AuthService.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/BackgroundImage.dart';

class LoginPagePetugas extends StatefulWidget {
  const LoginPagePetugas({Key? key}) : super(key: key);

  @override
  State<LoginPagePetugas> createState() => _LoginPagePetugasState();
}

class _LoginPagePetugasState extends State<LoginPagePetugas> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    AssetImage('assets/images/bg.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("Sistem Informasi Ibu Hamil dan Balita"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(162, 255, 255, 255)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Email'),
                            TextFormField(
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                ),
                                validator: (emailValue) {
                                  if (emailValue!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  email = emailValue;
                                  return null;
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            Text("Password"),
                            TextFormField(
                                cursorColor: Colors.blue,
                                keyboardType: TextInputType.text,
                                obscureText: _secureText,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  password = passwordValue;
                                  return null;
                                }),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LupaPassPage()));
                                      },
                                      child: Text(
                                        'Forgot Password',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontStyle: FontStyle.normal),
                                      )),
                                ]),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
                                child: TextButton(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 10),
                                    child: Text(
                                      _isLoading ? 'Proccessing..' : 'Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _login();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        )
      ],
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await Network().auth(data, 'auth/login');
    var body = json.decode(res.body);
    print(json.encode(body['access_token']));
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      if (body['user']['role_id'] == 3) {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => HomePagePetugas()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => LoginPagePetugas()),
        );
        Get.snackbar(
          'User Tidak Sesuai',
          "Mohon menggun",
          colorText: Colors.white,
          backgroundColor: Colors.lightBlue,
        );
      }
    } else {
      Get.snackbar(
        'Login Gagal',
        "Mohon periksa email dan password",
        colorText: Colors.white,
        backgroundColor: Colors.lightBlue,
      );
    }
    var token = jsonDecode(localStorage.getString('token') ?? '');
    print('localstorage: $token');

    setState(() {
      _isLoading = false;
    });
  }
}
