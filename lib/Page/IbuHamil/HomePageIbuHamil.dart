import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/KontenController.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/JadwalIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/ProfilIbuHamilPage.dart';
import 'package:posyandu/Page/IbuHamil/StatistikIbuHamilPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:intl/intl.dart';

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
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());
  var umur = Get.put(DetailKeluargaController());
  var dataBeratIbu = Get.put(CekDataController());
  var kontenController = Get.put(KontenController());

  Future<void> _refresh(bool reload) async {
    await Get.find<PemeriksaanIbuHamilController>()
        .getPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
    await Get.find<CekDataController>()
        .statusBeratIbu(ibu_hamil_id: widget.ibuHamilModel.id!);
    await Get.find<DetailKeluargaController>()
        .GetUmur(widget.ibuHamilModel.detailKeluarga!.id!);
    await Get.find<KontenController>().ShowKonten();
  }

  @override
  void initState() {
    super.initState();
    kontenController.ShowKonten();
    pemeriksaanibuhamil.getPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
    umur.GetUmur(widget.ibuHamilModel.detailKeluarga!.id!);
    dataBeratIbu.statusBeratIbu(ibu_hamil_id: widget.ibuHamilModel.id!);
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
                        Obx(() => umur.isLoading.value
                            ? CircularProgressIndicator()
                            : Container(
                                height: 100,
                                padding: EdgeInsets.all(10),
                                child: Card(
                                  color: Color.fromARGB(255, 185, 246, 188),
                                  child: ListTile(
                                      title: Text(
                                        widget.ibuHamilModel.detailKeluarga!
                                            .namaLengkap
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
                                            umur.umurPeserta.value.umur
                                                    .toString() +
                                                " Tahun " +
                                                (umur.umurPeserta.value
                                                            .usiaBulan! %
                                                        12)
                                                    .toString() +
                                                " Bulan",
                                          );
                                        } else {
                                          return Text(
                                            "0 Tahun " +
                                                (umur.umurPeserta.value
                                                            .usiaBulan! %
                                                        12)
                                                    .toString() +
                                                " Bulan",
                                          );
                                        }
                                      }())),
                                ),
                              )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        if (pemeriksaanibuhamil
                                                .listPemeriksaanIbuHamil
                                                .length !=
                                            0) {
                                          return Text(pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[0]
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
                                        if (dataBeratIbu.isLoading.value) {
                                          return Text('Empty');
                                        } else {
                                          if (dataBeratIbu.hasilStatusBeratIbu
                                                  .value.status ==
                                              "Normal") {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.green),
                                              child: Center(
                                                  child: Text(dataBeratIbu
                                                      .hasilStatusBeratIbu
                                                      .value
                                                      .status
                                                      .toString())),
                                            );
                                          } else if (dataBeratIbu
                                                  .hasilStatusBeratIbu
                                                  .value
                                                  .status ==
                                              "Obese") {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.red),
                                              child: Center(
                                                  child: Text(dataBeratIbu
                                                      .hasilStatusBeratIbu
                                                      .value
                                                      .status
                                                      .toString())),
                                            );
                                          } else if (dataBeratIbu
                                                  .hasilStatusBeratIbu
                                                  .value
                                                  .status ==
                                              "Underweight") {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.red),
                                              child: Center(
                                                  child: Text(dataBeratIbu
                                                      .hasilStatusBeratIbu
                                                      .value
                                                      .status
                                                      .toString())),
                                            );
                                          } else {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.yellow),
                                              child: Center(
                                                  child: Text(dataBeratIbu
                                                      .hasilStatusBeratIbu
                                                      .value
                                                      .status
                                                      .toString())),
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
                                        'D. Jantung Bayi',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(() {
                                        if (pemeriksaanibuhamil
                                                .listPemeriksaanIbuHamil
                                                .length !=
                                            0) {
                                          return Text(pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[0]
                                                  .denyutJantungBayi
                                                  .toString() +
                                              ' bpm');
                                        } else {
                                          return Text('Empty');
                                        }
                                      }),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx((() {
                                        if (pemeriksaanibuhamil
                                                .listPemeriksaanIbuHamil
                                                .length !=
                                            0) {
                                          if (pemeriksaanibuhamil
                                                      .listPemeriksaanIbuHamil[
                                                          0]
                                                      .denyutJantungBayi >=
                                                  120 &&
                                              pemeriksaanibuhamil
                                                      .listPemeriksaanIbuHamil[
                                                          0]
                                                      .denyutJantungBayi <=
                                                  160) {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.green),
                                              child:
                                                  Center(child: Text('Normal')),
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
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green),
                                            child:
                                                Center(child: Text('Normal')),
                                          );
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
                                                .listPemeriksaanIbuHamil
                                                .length !=
                                            0) {
                                          return Text(pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[0]
                                                  .denyutNadi
                                                  .toString() +
                                              ' bpm');
                                        } else {
                                          return Text('Empty');
                                        }
                                      }),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx((() {
                                        if (pemeriksaanibuhamil
                                                .listPemeriksaanIbuHamil
                                                .length !=
                                            0) {
                                          if (pemeriksaanibuhamil
                                                      .listPemeriksaanIbuHamil[
                                                          0]
                                                      .denyutNadi >=
                                                  60 &&
                                              pemeriksaanibuhamil
                                                      .listPemeriksaanIbuHamil[
                                                          0]
                                                      .denyutNadi <=
                                                  100) {
                                            return Container(
                                              // width: 60,
                                              // height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.green),
                                              child:
                                                  Center(child: Text('Normal')),
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
                                          return Container(
                                            // width: 60,
                                            // height: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.green),
                                            child:
                                                Center(child: Text('Normal')),
                                          );
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Obx(() {
                                    if (pemeriksaanibuhamil
                                            .listPemeriksaanIbuHamil.length !=
                                        0) {
                                      return Text('Date : ' +
                                          DateFormat('dd MMMM yyyy').format(
                                              DateTime.parse(pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[0]
                                                  .tanggalPemeriksaan
                                                  .toString())));
                                    } else {
                                      return Text('Empty');
                                    }
                                  }),
                                  Container(
                                    width: 180,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(119, 33, 149, 243)),
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
                                          'Grafik Pertumbuhan',
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
                        Builder(builder: (context) {
                          List images = [
                            "https://akah.desa.id/desa/upload/artikel/sedang_1583992455_PSOYANDU.jpg",
                            "https://dinkes.blorakab.go.id/packages/upload/photo/2022-08-08/WhatsApp-Image-2022-08-01-at-12.42.14.jpeg",
                            "https://dinkes.blorakab.go.id/packages/upload/portal/images/WhatsApp%20Image%202022-08-01%20at%2012.42.13.jpeg",
                            "https://purwosari.magetan.go.id/media/img/berita/berita_3185e42771946ee32.18845142.jpg",
                            "https://i1.wp.com/dinkes.rembangkab.go.id/binangkit/uploads/2023/02/Cover-Berita.jpg?resize=675%2C482&ssl=1",
                          ];

                          return Column(
                            children: [
                              CarouselSlider(
                                carouselController: carouselController,
                                options: CarouselOptions(
                                  height: 200.0,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    currentIndex = index;
                                    setState(() {});
                                  },
                                ),
                                items: kontenController.listKonten.value
                                    .map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://sidumita.definitelynotgod.com/storage/" +
                                                  imageUrl.gambar!,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: images.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 12.0,
                                      height: 12.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              (Theme.of(context).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  .withOpacity(
                                                      currentIndex == entry.key
                                                          ? 0.9
                                                          : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }),
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
                                    var buttonNavIbuHamilController =
                                        Get.put(ButtonNavIbuHamilController());
                                    buttonNavIbuHamilController
                                        .tabController.value.index = 1;
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
                            var buttonNavIbuHamilController =
                                Get.put(ButtonNavIbuHamilController());
                            buttonNavIbuHamilController
                                .tabController.value.index = 1;
                          },
                        ),
                        // Container(
                        //   height: 40,
                        //   width: Get.width,
                        //   margin: EdgeInsets.all(20),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white),
                        //   child: Row(
                        //     children: [
                        //       TextButton(
                        //           onPressed: () {
                        // var buttonNavIbuHamilController =
                        //     Get.put(ButtonNavIbuHamilController());
                        // buttonNavIbuHamilController
                        //     .tabController.value.index = 1;
                        //           },
                        //           child: Text(
                        //             'Jadwal Pemeriksaan',
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontStyle: FontStyle.normal),
                        //           )),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
