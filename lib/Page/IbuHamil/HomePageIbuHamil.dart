import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/JadwalIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/ProfilIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/StatistikIbuHamilPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../Controller/PemeriksaanIbuHamilController.dart';

class HomePageIbuHamil extends StatefulWidget {
  HomePageIbuHamil({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<HomePageIbuHamil> createState() => _HomePageIbuHamilState();
}

class _HomePageIbuHamilState extends State<HomePageIbuHamil> {
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

  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    super.initState();
    pemeriksaanibuhamil.getPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
    umur.GetUmur(widget.ibuHamilModel.detailKeluarga!.id!);
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
                                      .ibuHamilModel.detailKeluarga!.namaLengkap
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
                                    'Tinggi Fundus',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      return Text(pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .lingkarPerut
                                              .toString() +
                                          ' Cm');
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx((() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      if (pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .lingkarPerut <=
                                          4) {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.green),
                                          child: Center(child: Text('Normal')),
                                        );
                                      } else {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red),
                                          child: Center(
                                              child: Text('Tidak Normal')),
                                        );
                                      }
                                    } else {
                                      return Text('Loading');
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
                                    'D. Jantung Bayi',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      return Text(pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .denyutJantungBayi
                                              .toString() +
                                          ' bpm');
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx((() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      if (pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .denyutJantungBayi <=
                                          4) {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.green),
                                          child: Center(child: Text('Normal')),
                                        );
                                      } else {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red),
                                          child: Center(
                                              child: Text('Tidak Normal')),
                                        );
                                      }
                                    } else {
                                      return Text('Loading');
                                    }
                                  }))
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Nadi Ibu',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      return Text(pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .denyutNadi
                                              .toString() +
                                          ' bpm');
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx((() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      if (pemeriksaanibuhamil
                                              .listPemeriksaanIbuHamil[0]
                                              .denyutNadi >=
                                          50) {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.green),
                                          child: Center(child: Text('Normal')),
                                        );
                                      } else {
                                        return Container(
                                          // width: 60,
                                          // height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red),
                                          child: Center(
                                              child: Text('Tidak Normal')),
                                        );
                                      }
                                    } else {
                                      return Text('Loading');
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
                                if (pemeriksaanibuhamil
                                        .listPemeriksaanIbuHamil.length !=
                                    0) {
                                  return Text('Date : ' +
                                      pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[0]
                                          .tanggalPemeriksaan
                                          .toString());
                                } else {
                                  return Text('Loading');
                                }
                              }),
                              Container(
                                width: 180,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(119, 33, 149, 243)),
                                child: TextButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: StatistikIbuHamilPage(
                                              ibuHamilModel:
                                                  widget.ibuHamilModel),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation
                                                  .cupertino);
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
                                var buttonNavIbuHamilController =
                                    Get.put(ButtonNavIbuHamilController());
                                buttonNavIbuHamilController
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
        )
      ],
    );
  }
}
