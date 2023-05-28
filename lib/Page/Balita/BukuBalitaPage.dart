import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/GetTwoLastDataPemeriksaanController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/ImunisasiBalitaPage.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/StatistikBalitaPage.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/widgets.dart';

class BukuBalitaPage extends StatefulWidget {
  BukuBalitaPage({super.key, required this.balitaModel});
  BalitaModel balitaModel;
  @override
  State<BukuBalitaPage> createState() => _BukuBalitaPageState();
}

class _BukuBalitaPageState extends State<BukuBalitaPage> {
  var getTwoLastDataPemeriksaanBalita =
      Get.put(GetTwoLastDataPemeriksaanBalitaController());
  var umur = Get.put(DetailKeluargaController());

  Future<void> _refresh(bool reload) async {
    await Get.find<GetTwoLastDataPemeriksaanBalitaController>()
        .getTwoLastDataPemeriksaanBalita(widget.balitaModel.id!);
  }

  @override
  void initState() {
    super.initState();
    getTwoLastDataPemeriksaanBalita
        .getTwoLastDataPemeriksaanBalita(widget.balitaModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: RefreshIndicator(
            onRefresh: () async {
              await _refresh(true);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: 100,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          color: Color.fromARGB(255, 185, 246, 188),
                          child: ListTile(
                              title: Text(
                                widget.balitaModel.detailKeluarga!.namaLengkap
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Hasil Pertumbuhan"),
                          SizedBox(
                            width: 18,
                          ),
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
                                    color: Color.fromARGB(255, 43, 113, 218),
                                    fontStyle: FontStyle.normal),
                              )),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('Data Sebelumnya'),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Berat"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      1]
                                                  .beratBadan
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .beratBadan
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Tinggi"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      1]
                                                  .tinggiBadan
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .tinggiBadan
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Lingkar Kepala"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      1]
                                                  .lingkarKepala
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .lingkarKepala
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(() {
                                  if (getTwoLastDataPemeriksaanBalita
                                          .listTwoLastDataPemeriksaanBalita
                                          .length >=
                                      2) {
                                    return Text('Date : ' +
                                        getTwoLastDataPemeriksaanBalita
                                            .listTwoLastDataPemeriksaanBalita[1]
                                            .tanggalPemeriksaan
                                            .toString());
                                  } else if (getTwoLastDataPemeriksaanBalita
                                          .listTwoLastDataPemeriksaanBalita
                                          .length ==
                                      1) {
                                    return Text('Date : ' +
                                        getTwoLastDataPemeriksaanBalita
                                            .listTwoLastDataPemeriksaanBalita[0]
                                            .tanggalPemeriksaan
                                            .toString());
                                  } else {
                                    return Text('Empty');
                                  }
                                })
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text('Data Terakhir'),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Berat"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .beratBadan
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Tinggi"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .tinggiBadan
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Lingkar Kepala"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanBalita
                                                .listTwoLastDataPemeriksaanBalita
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanBalita
                                                  .listTwoLastDataPemeriksaanBalita[
                                                      0]
                                                  .lingkarKepala
                                                  .toString());
                                        } else {
                                          return Text('Empty');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(() {
                                  if (getTwoLastDataPemeriksaanBalita
                                          .listTwoLastDataPemeriksaanBalita
                                          .length >=
                                      2) {
                                    return Text('Date : ' +
                                        getTwoLastDataPemeriksaanBalita
                                            .listTwoLastDataPemeriksaanBalita[0]
                                            .tanggalPemeriksaan
                                            .toString());
                                  } else {
                                    return Text('Empty');
                                  }
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 180,
                            width: 150,
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.green[400],
                                  backgroundImage: AssetImage(
                                      'assets/images/pertumbuhan.png'),
                                ),
                                TextButton(
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
                                      'Pertumbuhan',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            height: 180,
                            width: 150,
                            padding: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.green[400],
                                  backgroundImage:
                                      AssetImage('assets/images/vaksin.png'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: ImunisasiBalitaPage(
                                          balitaModel: widget.balitaModel,
                                        ),
                                        withNavBar:
                                            false, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ImunisasiBalitaPage(
                                      //               balitaModel:
                                      //                   widget.balitaModel,
                                      //             )));
                                    },
                                    child: Text(
                                      'Imunisasi',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal),
                                    )),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Column(children: [
                  //   CarouselSlider(
                  //     items: slider,
                  //     carouselController: _controller,
                  //     options: CarouselOptions(
                  //         autoPlay: true,
                  //         enlargeCenterPage: true,
                  //         aspectRatio: 2.0,
                  //         onPageChanged: (index, reason) {
                  //           setState(() {
                  //             _current = index;
                  //           });
                  //         }),
                  //   ),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: slider.asMap().entries.map((entry) {
                  //       return GestureDetector(
                  //         onTap: () => _controller.animateToPage(entry.key),
                  //         child: Container(
                  //           width: 7.0,
                  //           height: 7.0,
                  //           margin: EdgeInsets.symmetric(
                  //               vertical: 8.0, horizontal: 4.0),
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               color: (Theme.of(context).brightness ==
                  //                           Brightness.dark
                  //                       ? Colors.white
                  //                       : Colors.black)
                  //                   .withOpacity(
                  //                       _current == entry.key ? 0.9 : 0.4)),
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ])
                ],
              ),
            ),
          )),
        )
      ],
    );
  }
}
