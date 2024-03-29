import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/HomePageBalita.dart';
import 'package:posyandu/Page/EmailVerifPage.dart';
import 'package:posyandu/Page/LandingPage.dart';
import 'package:posyandu/Page/LoginPeserta/LandingLoginPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/RegisterPeserta.dart';
import 'package:posyandu/Page/LupaPassPage.dart';
import 'package:posyandu/Page/ResetPassword.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:posyandu/globals.dart';
import 'package:posyandu/AuthService.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/BackgroundImage.dart';

class LoginPagePeserta extends StatefulWidget {
  const LoginPagePeserta({Key? key}) : super(key: key);

  @override
  State<LoginPagePeserta> createState() => _LoginPagePesertaState();
}

class _LoginPagePesertaState extends State<LoginPagePeserta> {
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
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/Logo.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "Sistem Informasi Posyandu Ibu Hamil dan Balita",
                                  style: TextStyle(fontSize: 11),
                                ),
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
                                    // hintText: "Email",
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
                                  // hintText: "Password",
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
                                        horizontal: 60, vertical: 10),
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
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
                                child: TextButton(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    child: Text(
                                      _isLoading ? 'Proccessing..' : 'Register',
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPeserta()));
                                  },
                                ),
                              ),
                            ),
                            // RoundedButton(
                            //   btnText: 'REGISTER',
                            //   onBtnPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 RegisterPeserta()));
                            //   },
                            // ),
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
    String fcm_token = "";
    await FirebaseMessaging.instance.getToken().then((value) {
      fcm_token = value.toString();
    });
    print(fcm_token);

    var data = {'email': email, 'password': password, 'fcm_token': fcm_token};

    var res = await Network().auth(data, 'auth/login');
    var body = json.decode(res.body);
    print(json.encode(body['access_token']));
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (body['success'] == true || res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      if (body['user']['role_id'] == 4 && body['user']['isValid'] == "1") {
        // Navigator.pushReplacement(
        //   context,
        //   new MaterialPageRoute(builder: (context) => LandinLoginPeserta()),
        // );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LandinLoginPeserta()),
            (Route<dynamic> route) => false);
        var token = jsonDecode(localStorage.getString('token') ?? '');
        print('localstorage: $token');
      } else {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(builder: (context) => LoginPagePeserta()),
        );
        Get.snackbar(
          'User Belum Tervalidasi',
          "Mohon Menunggu Validasi",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      Get.snackbar(
        'Login Gagal',
        "Mohon periksa email dan password",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
