import 'package:flutter/material.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/BottomNavBar1.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/LandingLogin.dart';
import 'package:posyandu/Page/LandingPage.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/EditPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/LandingLoginPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/Page/LoginPeserta/RegisterPeserta.dart';
import 'package:posyandu/Page/Petugas/HomePagePetugas.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logintest/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPagePeserta(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
