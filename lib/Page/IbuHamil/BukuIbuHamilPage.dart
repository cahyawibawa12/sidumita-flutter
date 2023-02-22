import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Page/Balita/ImunisasiBalitaPage.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/StatistikBalitaPage.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:posyandu/Page/IbuHamil/JadwalIbuHamilPage.dart';

import '../../Controller/GetTwoLastDataPemeriksaanIbuHamilController.dart';
import '../../widget/widgets.dart';

class BukuIbuHamilPage extends StatefulWidget {
  BukuIbuHamilPage({super.key});

  @override
  State<BukuIbuHamilPage> createState() => _BukuIbuHamilPageState();
}

class _BukuIbuHamilPageState extends State<BukuIbuHamilPage> {
  var getTwoLastDataPemeriksaanIbuHamil =
      Get.put(GetTwoLastDataPemeriksaanIbuHamilController());

  @override
  void initState() {
    super.initState();
    getTwoLastDataPemeriksaanIbuHamil.getTwoLastDataPemeriksaanIbuHamil(1);
    // print('frompage' +
    //     getTwoLastDataPemeriksaanBalita.listTwoLastDataPemeriksaanBalita.length
    //         .toString());
  }

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
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('assets/images/bg.png'),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 150,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: EdgeInsets.only(left: 20),
                              child: Center(
                                child: Text(
                                  "Bu Wayan",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "0 Tahun 6 Bulan",
                                textAlign: TextAlign.start,
                                // style: Padding(padding: EdgeInsets.only(left: 10)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          JadwalIbuHamilPage()));
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
                                    Text("Tinggi Fundus"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    1]
                                                .lingkarPerut
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                    Text("D. Jantung Bayi"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    1]
                                                .denyutJantungBayi
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                    Text("Nadi Ibu"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    1]
                                                .denyutNadi
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                        .length !=
                                    0) {
                                  return Text('Date : ' +
                                      getTwoLastDataPemeriksaanIbuHamil
                                          .listTwoLastDataPemeriksaanIbuHamil[1]
                                          .tanggalPemeriksaan
                                          .toString());
                                } else {
                                  return Text('Loading');
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
                                    Text("Tinggi Fundus"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    0]
                                                .lingkarPerut
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                    Text("D. Jantung Bayi"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    0]
                                                .denyutJantungBayi
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                    Text("Nadi Ibu"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (getTwoLastDataPemeriksaanIbuHamil
                                              .listTwoLastDataPemeriksaanIbuHamil
                                              .length !=
                                          0) {
                                        return Text(
                                            getTwoLastDataPemeriksaanIbuHamil
                                                .listTwoLastDataPemeriksaanIbuHamil[
                                                    0]
                                                .denyutNadi
                                                .toString());
                                      } else {
                                        return Text('Loading');
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
                                        .length !=
                                    0) {
                                  return Text('Date : ' +
                                      getTwoLastDataPemeriksaanIbuHamil
                                          .listTwoLastDataPemeriksaanIbuHamil[0]
                                          .tanggalPemeriksaan
                                          .toString());
                                } else {
                                  return Text('Loading');
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
                                backgroundImage:
                                    AssetImage('assets/images/bg.png'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ImunisasiBalitaPage()));
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
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
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
                ])
              ],
            ),
          )),
        )
      ],
    );
  }
}