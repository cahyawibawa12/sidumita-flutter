import 'package:flutter/material.dart';
import 'package:posyandu/Page/Balita/JadwalBalitaPage.dart';
import 'package:posyandu/Page/Balita/ProfilBalitaPage.dart';
import 'package:posyandu/Page/Balita/StatistikBalitaPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../Controller/PemeriksaanBalitaController.dart';

class HomePageBalita extends StatefulWidget {
  const HomePageBalita({super.key});

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

  @override
  void initState() {
    super.initState();
    pemeriksaanbalita.getPemeriksaanBalita(2);
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
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              margin: EdgeInsets.only(left: 20),
                              child: Center(
                                child: Text(
                                  "Putu Nyoman",
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
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilBalitaPage()),
                            );
                          }),
                          icon: const Icon(CupertinoIcons.bell),
                          iconSize: 35,
                          color: Color.fromARGB(255, 24, 98, 26),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                          .listPemeriksaanBalita[0].berat_badan
                                          .toString());
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green),
                                    child: Center(child: Text('Normal')),
                                  ),
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
                                          .listPemeriksaanBalita[0].tinggi_badan
                                          .toString());
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green),
                                    child: Center(child: Text('Tidak Normal')),
                                  )
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
                                          .lingkar_kepala
                                          .toString());
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green),
                                    child: Center(child: Text('Normal')),
                                  )
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
                                      pemeriksaanbalita.listPemeriksaanBalita[0]
                                          .tanggal_pemeriksaan
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StatistikBalitaPage()));
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JadwalBalitaPage()));
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
