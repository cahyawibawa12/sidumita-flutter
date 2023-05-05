import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Page/Petugas/HomePagePetugas.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/BiodataPetugas.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/EditBiodataPetugas.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPetugas extends StatefulWidget {
  const ProfilPetugas({super.key});

  @override
  State<ProfilPetugas> createState() => _ProfilPetugasState();
}

class _ProfilPetugasState extends State<ProfilPetugas> {
  // var bioPetugas = Get.put(PetugasController());

  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    // bioPetugas.ShowPetugas();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if (user != null) {
      setState(() {
        name = user['name'];
        email = user['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Profil Petugas"),
            backgroundColor: Color(0xff34BE82),
          ),
          body: SafeArea(
              child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Color.fromARGB(255, 185, 246, 188),
                  child: ListTile(
                    title: Text(
                      '${name}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${email}'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Biodata Petugas"),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BiodataPetugas()));
                            },
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BiodataPetugas()));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Change Password"),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePagePetugas()));
                            },
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePagePetugas()));
                      },
                    ),
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Logout"),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePagePetugas()));
                            },
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePagePetugas()));
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
        )
      ],
    );
  }
}