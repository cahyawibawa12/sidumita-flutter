import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/IbuHamil/BiodataIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/PagePraKehamilan.dart';
import 'package:posyandu/Page/Konten/HalamanBerita.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilIbuHamilPage extends StatefulWidget {
  ProfilIbuHamilPage({super.key, required this.ibuHamilModel});
  IbuHamilModel ibuHamilModel;

  @override
  State<ProfilIbuHamilPage> createState() => _ProfilIbuHamilPageState();
}

class _ProfilIbuHamilPageState extends State<ProfilIbuHamilPage> {
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    // umur.GetUmur(widget.ibuHamilModel.detailKeluarga!.id!);
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
                        widget.ibuHamilModel.detailKeluarga!.namaLengkap
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: (() {
                        if (umur.umurPeserta.value.format.toString() ==
                            "tahun") {
                          return Text(
                            umur.umurPeserta.value.umur.toString() +
                                " Tahun " +
                                (umur.umurPeserta.value.usiaBulan! % 12)
                                    .toString() +
                                " Bulan",
                          );
                        } else {
                          return Text(
                            "0 Tahun " +
                                (umur.umurPeserta.value.usiaBulan! % 12)
                                    .toString() +
                                " Bulan",
                          );
                        }
                      }())),
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
                          title: const Text("Biodata Ibu"),
                          trailing: IconButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: BiodataIbuHamil(
                                  ibuHamilModel: widget.ibuHamilModel,
                                ),
                                withNavBar:
                                    false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
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
                          screen: BiodataIbuHamil(
                            ibuHamilModel: widget.ibuHamilModel,
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
                          title: const Text("Data PraKehamilan"),
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
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: PagePraKehamilan(
                            ibuHamilModel: widget.ibuHamilModel,
                          ),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    InkWell(
                      child: Card(
                        child: ListTile(
                          title: const Text("Berita"),
                          trailing: IconButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: HalamanBerita(),
                                withNavBar:
                                    false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
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
                          screen: HalamanBerita(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
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
