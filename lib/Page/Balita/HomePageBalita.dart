import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Model/DetailKeluargaModel.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/ProfilBalitaPage.dart';
import 'package:posyandu/Page/Balita/StatistikBalitaPage.dart';
import 'package:posyandu/Page/LoginPeserta/LoginPagePeserta.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:posyandu/widget/widgetBeratBadan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/PemeriksaanBalitaController.dart';
import '../../Service/AuthService.dart';

class HomePageBalita extends StatefulWidget {
  HomePageBalita({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<HomePageBalita> createState() => _HomePageBalitaState();
}

class _HomePageBalitaState extends State<HomePageBalita> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> slider = [
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text1'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text2'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text3'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text4'),
    ),
    Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text('text5'),
    )
  ];

  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  var cekDataBalita = Get.put(CekDataController());
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();

    umur.GetUmur(widget.balitaModel.detailKeluarga!.id!);
    pemeriksaanbalita
        .getPemeriksaanBalita(widget.balitaModel.id!)
        .then((value) {
      if (widget.balitaModel.detailKeluarga!.jenisKelamin.toString() ==
          "Laki-Laki") {
        cekDataBalita.cekBoys(
            umur: int.parse(
                pemeriksaanbalita.listPemeriksaanBalita[0].umurBalita),
            data_ukur: pemeriksaanbalita.listPemeriksaanBalita[0].beratBadan
                .toDouble(),
            data_ukur2: pemeriksaanbalita.listPemeriksaanBalita[0].tinggiBadan
                .toDouble(),
            data_ukur3: pemeriksaanbalita.listPemeriksaanBalita[0].lingkarKepala
                .toDouble());
      } else {
        cekDataBalita.cekGirls(
            umur: int.parse(
                pemeriksaanbalita.listPemeriksaanBalita[0].umurBalita),
            data_ukur: pemeriksaanbalita.listPemeriksaanBalita[0].beratBadan,
            data_ukur2: pemeriksaanbalita.listPemeriksaanBalita[0].tinggiBadan,
            data_ukur3:
                pemeriksaanbalita.listPemeriksaanBalita[0].lingkarKepala);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Obx(() => umur.isLoading.value
                          ? CircularProgressIndicator()
                          : Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
                              child: Card(
                                color: Color.fromARGB(255, 185, 246, 188),
                                child: ListTile(
                                  title: Text(
                                    widget
                                        .balitaModel.detailKeluarga!.namaLengkap
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    umur.umurPeserta.value.umur.toString() +
                                        " Tahun " +
                                        (umur.umurPeserta.value.usiaBulan! % 12)
                                            .toString() +
                                        " Bulan",
                                  ),
                                ),
                              ),
                            )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Berat Badan',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx(() {
                                      if (pemeriksaanbalita
                                              .listPemeriksaanBalita.length !=
                                          0) {
                                        return Text(pemeriksaanbalita
                                                .listPemeriksaanBalita[0]
                                                .beratBadan
                                                .toString() +
                                            ' Kg');
                                      } else {
                                        return Text('Empty');
                                      }
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx((() {
                                      if (cekDataBalita.isLoading.value) {
                                        return Text('Empty');
                                      } else {
                                        if (cekDataBalita.hasilCekDataBerat
                                                    .value.status ==
                                                "Kurus" ||
                                            cekDataBalita.hasilCekDataBerat
                                                    .value.status ==
                                                "Gemuk") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.yellow),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataBerat
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else if (cekDataBalita
                                                    .hasilCekDataBerat
                                                    .value
                                                    .status ==
                                                "Sangat Kurus" ||
                                            cekDataBalita.hasilCekDataBerat
                                                    .value.status ==
                                                "Sangat Gemuk") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.red),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataBerat
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataBerat
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        }
                                      }
                                    }))
                                  ],
                                ),
                                // VerticalDivider(
                                //   color: Colors.black,
                                //   indent: 10,
                                //   thickness: 2,
                                //   endIndent: 10,
                                // ),
                                Column(
                                  children: [
                                    Text(
                                      'Tinggi Badan',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx(() {
                                      if (pemeriksaanbalita
                                              .listPemeriksaanBalita.length !=
                                          0) {
                                        return Text(pemeriksaanbalita
                                                .listPemeriksaanBalita[0]
                                                .tinggiBadan
                                                .toString() +
                                            ' Cm');
                                      } else {
                                        return Text('Empty');
                                      }
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx((() {
                                      if (cekDataBalita.isLoading.value) {
                                        return Text('Empty');
                                      } else {
                                        if (cekDataBalita.hasilCekDataTinggi
                                                    .value.status ==
                                                "Tinggi" ||
                                            cekDataBalita.hasilCekDataTinggi
                                                    .value.status ==
                                                "Pendek") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.yellow),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataTinggi
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else if (cekDataBalita
                                                    .hasilCekDataTinggi
                                                    .value
                                                    .status ==
                                                "Sangat Pendek" ||
                                            cekDataBalita.hasilCekDataTinggi
                                                    .value.status ==
                                                "Sangat Tinggi") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.red),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataTinggi
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataTinggi
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        }
                                      }
                                    }))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Lingkar Kepala',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx(() {
                                      if (pemeriksaanbalita
                                              .listPemeriksaanBalita.length !=
                                          0) {
                                        return Text(pemeriksaanbalita
                                                .listPemeriksaanBalita[0]
                                                .lingkarKepala
                                                .toString() +
                                            ' Cm');
                                      } else {
                                        return Text('Empty');
                                      }
                                    }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Obx((() {
                                      if (cekDataBalita.isLoading.value) {
                                        return Text('Empty');
                                      } else {
                                        if (cekDataBalita.hasilCekDataKepala
                                                    .value.status ==
                                                "Kecil" ||
                                            cekDataBalita.hasilCekDataKepala
                                                    .value.status ==
                                                "Besar") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.yellow),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataKepala
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else if (cekDataBalita
                                                    .hasilCekDataKepala
                                                    .value
                                                    .status ==
                                                "Sangat Kecil" ||
                                            cekDataBalita.hasilCekDataKepala
                                                    .value.status ==
                                                "Sangat Besar") {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.red),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataKepala
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        } else {
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green),
                                            child: Center(
                                                child: Text(
                                              cekDataBalita.hasilCekDataKepala
                                                  .value.status
                                                  .toString(),
                                            )),
                                          );
                                        }
                                      }
                                    }))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Obx(() {
                                  if (pemeriksaanbalita
                                          .listPemeriksaanBalita.length !=
                                      0) {
                                    return Text('Date : ' +
                                        pemeriksaanbalita
                                            .listPemeriksaanBalita[0]
                                            .tanggalPemeriksaan
                                            .toString());
                                  } else {
                                    return Text('Empty');
                                  }
                                }),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(119, 33, 149, 243)),
                                  child: TextButton(
                                      onPressed: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: StatistikBalitaPage(
                                            balitaModel: widget.balitaModel,
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: Text(
                                        'Lihat Grafik Pertumbuhan',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                        items: slider,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: slider.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 7.0,
                              height: 7.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        height: 40,
                        width: Get.width,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  var buttonNavBalitaController =
                                      Get.put(ButtonNavBalitaController());
                                  buttonNavBalitaController
                                      .tabController.value.index = 1;
                                },
                                child: Text(
                                  'Jadwal Pemeriksaan',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
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
