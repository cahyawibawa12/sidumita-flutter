import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/KontenController.dart';
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
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  var cekDataBalita = Get.put(CekDataController());
  var umur = Get.put(DetailKeluargaController());
  var kontenController = Get.put(KontenController());

  Future<void> _refresh(bool reload) async {
    await Get.find<CekDataController>()
        .CekImunisasiBalita(widget.balitaModel.id!);
    await Get.find<DetailKeluargaController>()
        .GetUmur(widget.balitaModel.detailKeluarga!.id!);
    await Get.find<PemeriksaanBalitaController>()
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
    await Get.find<KontenController>().ShowKonten();
  }

  @override
  void initState() {
    super.initState();
    kontenController.ShowKonten();
    cekDataBalita.CekImunisasiBalita(widget.balitaModel.id!);
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
    initializeDateFormatting('id');
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
                            : InkWell(
                                onTap: () {
                                  var buttonNavBalitaController =
                                      Get.put(ButtonNavBalitaController());
                                  buttonNavBalitaController
                                      .tabController.value.index = 4;
                                },
                                child: Container(
                                  height: 100,
                                  padding: EdgeInsets.all(10),
                                  child: Card(
                                    color: Color.fromARGB(255, 185, 246, 188),
                                    child: ListTile(
                                        title: Text(
                                          widget.balitaModel.detailKeluarga!
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
                                        if (pemeriksaanbalita
                                                .listPemeriksaanBalita.length !=
                                            0) {
                                          return Text(pemeriksaanbalita
                                                  .listPemeriksaanBalita[0]
                                                  .beratBadan
                                                  .toString() +
                                              ' Kg');
                                        } else {
                                          return Text('Kosong');
                                        }
                                      }),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx((() {
                                        if (cekDataBalita.isLoading.value) {
                                          return Text('Kosong');
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
                                          } else if (cekDataBalita
                                                  .hasilCekDataBerat
                                                  .value
                                                  .status ==
                                              "Normal") {
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
                                                "Kosong",
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
                                          return Text('Kosong');
                                        }
                                      }),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx((() {
                                        if (cekDataBalita.isLoading.value) {
                                          return Text('Kosong');
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
                                          } else if (cekDataBalita
                                                  .hasilCekDataTinggi
                                                  .value
                                                  .status ==
                                              "Normal") {
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
                                                "Kosong",
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
                                          return Text('Kosong');
                                        }
                                      }),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx((() {
                                        if (cekDataBalita.isLoading.value) {
                                          return Text('Kosong');
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
                                          } else if (cekDataBalita
                                                  .hasilCekDataKepala
                                                  .value
                                                  .status ==
                                              "Normal") {
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
                                                "Kosong",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Obx(() {
                                    if (pemeriksaanbalita
                                            .listPemeriksaanBalita.length !=
                                        0) {
                                      return Text('Tgl : ' +
                                          DateFormat('dd MMMM yyyy', "id")
                                              .format(DateTime.parse(
                                                  pemeriksaanbalita
                                                      .listPemeriksaanBalita[0]
                                                      .tanggalPemeriksaan
                                                      .toString())));
                                    } else {
                                      return Text('Kosong');
                                    }
                                  }),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color.fromARGB(119, 33, 149, 243)),
                                    child: TextButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: StatistikBalitaPage(
                                              balitaModel: widget.balitaModel,
                                            ),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
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
                                children: kontenController.listKonten.value
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
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
                                  "Jadwal Posyandu",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    var buttonNavBalitaController =
                                        Get.put(ButtonNavBalitaController());
                                    buttonNavBalitaController
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
                            var buttonNavBalitaController =
                                Get.put(ButtonNavBalitaController());
                            buttonNavBalitaController
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
                        //             var buttonNavBalitaController =
                        //                 Get.put(ButtonNavBalitaController());
                        //             buttonNavBalitaController
                        //                 .tabController.value.index = 1;
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
