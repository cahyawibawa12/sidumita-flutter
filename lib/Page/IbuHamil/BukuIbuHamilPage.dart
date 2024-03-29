import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/Balita/ImunisasiBalitaPage.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/StatistikBalitaPage.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/JadwalIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/StatistikIbuHamilPage.dart';

import '../../Controller/GetTwoLastDataPemeriksaanIbuHamilController.dart';
import '../../widget/widgets.dart';

class BukuIbuHamilPage extends StatefulWidget {
  BukuIbuHamilPage({super.key, required this.ibuHamilModel});
  IbuHamilModel ibuHamilModel;

  @override
  State<BukuIbuHamilPage> createState() => _BukuIbuHamilPageState();
}

class _BukuIbuHamilPageState extends State<BukuIbuHamilPage> {
  var getTwoLastDataPemeriksaanIbuHamil =
      Get.put(GetTwoLastDataPemeriksaanIbuHamilController());
  var umur = Get.put(DetailKeluargaController());

  Future<void> _refresh(bool reload) async {
    await Get.find<GetTwoLastDataPemeriksaanIbuHamilController>()
        .getTwoLastDataPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id');
    getTwoLastDataPemeriksaanIbuHamil
        .getTwoLastDataPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
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
                      InkWell(
                        onTap: () {
                          var buttonNavIbuHamilController =
                              Get.put(ButtonNavIbuHamilController());
                          buttonNavIbuHamilController
                              .tabController.value.index = 4;
                        },
                        child: Container(
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
                                subtitle: (() {
                                  if (umur.umurPeserta.value.format
                                          .toString() ==
                                      "tahun") {
                                    return Text(
                                      umur.umurPeserta.value.umur.toString() +
                                          " Tahun " +
                                          (umur.umurPeserta.value.usiaBulan! %
                                                  12)
                                              .toString() +
                                          " Bulan",
                                    );
                                  } else {
                                    return Text(
                                      "0 Tahun " +
                                          (umur.umurPeserta.value.usiaBulan! %
                                                  12)
                                              .toString() +
                                          " Bulan",
                                    );
                                  }
                                }())),
                          ),
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
                                var buttonNavIbuHamilController =
                                    Get.put(ButtonNavIbuHamilController());
                                buttonNavIbuHamilController
                                    .tabController.value.index = 1;
                                ;
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Tinggi Fundus"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      1]
                                                  .lingkarPerut
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .lingkarPerut
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("D. Jantung Bayi"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      1]
                                                  .denyutJantungBayi
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .denyutJantungBayi
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Nadi Ibu"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      1]
                                                  .denyutNadi
                                                  .toString());
                                        } else if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length ==
                                            1) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .denyutNadi
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(() {
                                  if (getTwoLastDataPemeriksaanIbuHamil
                                          .listTwoLastDataPemeriksaanIbuHamil
                                          .length >=
                                      2) {
                                    return Text('Tgl : ' +
                                        DateFormat('dd MMMM yyyy', "id").format(
                                            DateTime.parse(
                                                getTwoLastDataPemeriksaanIbuHamil
                                                    .listTwoLastDataPemeriksaanIbuHamil[
                                                        1]
                                                    .tanggalPemeriksaan
                                                    .toString())));
                                  } else if (getTwoLastDataPemeriksaanIbuHamil
                                          .listTwoLastDataPemeriksaanIbuHamil
                                          .length ==
                                      1) {
                                    return Text('Tgl : ' +
                                        DateFormat('dd MMMM yyyy', "id").format(
                                            DateTime.parse(
                                                getTwoLastDataPemeriksaanIbuHamil
                                                    .listTwoLastDataPemeriksaanIbuHamil[
                                                        0]
                                                    .tanggalPemeriksaan
                                                    .toString())));
                                  } else {
                                    return Text('Kosong');
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Tinggi Fundus"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .lingkarPerut
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("D. Jantung Bayi"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .denyutJantungBayi
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
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
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Nadi Ibu"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() {
                                        if (getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil
                                                .length >=
                                            2) {
                                          return Text(
                                              getTwoLastDataPemeriksaanIbuHamil
                                                  .listTwoLastDataPemeriksaanIbuHamil[
                                                      0]
                                                  .denyutNadi
                                                  .toString());
                                        } else {
                                          return Text('Kosong');
                                        }
                                      })
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Obx(() {
                                  if (getTwoLastDataPemeriksaanIbuHamil
                                          .listTwoLastDataPemeriksaanIbuHamil
                                          .length >=
                                      2) {
                                    return Text('Tgl : ' +
                                        DateFormat('dd MMMM yyyy', "id").format(
                                            DateTime.parse(
                                                getTwoLastDataPemeriksaanIbuHamil
                                                    .listTwoLastDataPemeriksaanIbuHamil[
                                                        0]
                                                    .tanggalPemeriksaan
                                                    .toString())));
                                  } else {
                                    return Text('Kosong');
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
                      InkWell(
                        child: Container(
                          // padding:
                          //     EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Card(
                            elevation: 0,
                            child: ListTile(
                              title: Text(
                                "Pertumbuhan Ibu Hamil",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: StatistikIbuHamilPage(
                                        ibuHamilModel: widget.ibuHamilModel),
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
                        ),
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: StatistikIbuHamilPage(
                                ibuHamilModel: widget.ibuHamilModel),

                            withNavBar:
                                false, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                      ),
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
