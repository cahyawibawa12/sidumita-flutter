import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Page/Balita/BiodataBalita.dart';
import 'package:posyandu/Page/Petugas/HomePagePetugas.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/BiodataPetugas.dart';
import 'package:posyandu/Page/Petugas/ProfilPetugas/EditBiodataPetugas.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilBalita extends StatefulWidget {
  ProfilBalita({super.key, required this.balitaModel});
  BalitaModel balitaModel;

  @override
  State<ProfilBalita> createState() => _ProfilBalitaState();
}

class _ProfilBalitaState extends State<ProfilBalita> {
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    // umur.GetUmur(widget.balitaModel.detailKeluarga!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
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
                      widget.balitaModel.detailKeluarga!.namaLengkap.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      umur.umurPeserta.value.umur.toString() +
                          " Tahun " +
                          (umur.umurPeserta.value.usiaBulan! % 12).toString() +
                          " Bulan",
                    ),
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
                    )),
                child: Column(
                  children: [
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Biodata Balita"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: BiodataBalita(
                            balitaModel: widget.balitaModel,
                          ),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Berita"),
                          trailing: IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ));
                            },
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePagePetugas()));
                      },
                    ),
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Logout"),
                          trailing: IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePagePetugas()));
                            },
                            icon: const Icon(
                              Icons.arrow_right_sharp,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePagePetugas()));
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
