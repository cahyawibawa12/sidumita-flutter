import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/EditPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/LandingBalita.dart';
import 'package:posyandu/Page/LoginPeserta/LandingIbuHamil.dart';
import 'package:posyandu/Service/AuthService.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPagePeserta.dart';

class LandinLoginPeserta extends StatefulWidget {
  const LandinLoginPeserta({super.key});

  @override
  State<LandinLoginPeserta> createState() => _LandinLoginPesertaState();
}

class _LandinLoginPesertaState extends State<LandinLoginPeserta> {
  String _nikkaka = '';
  String _alamat = '';
  String _kepalakeluarga = '';
  String _jumlah = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if (user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang " + '${name}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Pada Sistem Informasi Posyandu Ibu Hamil dan Balita")
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: (() {
                      logout();
                    }),
                    icon: const Icon(CupertinoIcons.bell),
                    iconSize: 35,
                    color: Color.fromARGB(255, 24, 98, 26),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(162, 255, 255, 255)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text('NIK Kartu Keluarga'),
                      TextField(
                        // decoration: const InputDecoration(hintText: 'email'),
                        onChanged: (value) {
                          _nikkaka = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Alamat'),
                      TextField(
                        // decoration: const InputDecoration(hintText: 'email'),
                        onChanged: (value) {
                          _alamat = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Kepala Keluarga'),
                      TextField(
                        // decoration: const InputDecoration(hintText: 'email'),
                        onChanged: (value) {
                          _kepalakeluarga = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Jumlah'),
                      TextField(
                        // decoration: const InputDecoration(hintText: 'email'),
                        onChanged: (value) {
                          _jumlah = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        btnText: 'Save',
                        onBtnPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPeserta()));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        btnText: 'Data Keluarga',
                        onBtnPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPeserta()));
                        },
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(162, 255, 255, 255)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apakah Kamu?",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(340, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingBalita()),
                              );
                            }),
                            child: Text("Balita",
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(340, 40),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingIbuHamil()),
                              );
                            }),
                            child: Text("Ibu Hamil",
                                style: TextStyle(
                                  color: Colors.black,
                                )))
                      ]))
            ],
          ))))
    ]);
  }

  void logout() async {
    var res = await Network().getData('auth/logout');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPagePeserta()));
    }
  }
}
