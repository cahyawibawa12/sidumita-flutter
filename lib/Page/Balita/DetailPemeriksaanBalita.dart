import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailPemeriksaanBalitaController.dart';

import '../../widget/widgets.dart';

class DetailPemeriksaanBalita extends StatefulWidget {
  final int id;
  final String tanggal_pemeriksaan;
  final String umur_balita;
  final String lingkar_kepala;
  final String lingkar_lengan;
  final String tinggi_badan;
  final String berat_badan;
  final String penanganan;
  final String keluhan;
  final String catatan;
  final String balita_id;
  final String petugas_kesehatan_id;

  const DetailPemeriksaanBalita(
      {required this.id,
      required this.tanggal_pemeriksaan,
      required this.umur_balita,
      required this.lingkar_kepala,
      required this.lingkar_lengan,
      required this.tinggi_badan,
      required this.berat_badan,
      required this.penanganan,
      required this.keluhan,
      required this.catatan,
      required this.balita_id,
      required this.petugas_kesehatan_id});

  @override
  State<DetailPemeriksaanBalita> createState() =>
      _DetailPemeriksaanBalitaState();
}

class _DetailPemeriksaanBalitaState extends State<DetailPemeriksaanBalita> {
  // var detailpemeriksaanbalita = Get.put(DetailPemeriksaanBalitaController());

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) async {
  //       try {
  //         detailpemeriksaanbalita =
  //             Get.find<DetailPemeriksaanBalitaController>();
  //       } catch (e) {
  //         detailpemeriksaanbalita =
  //             Get.put(DetailPemeriksaanBalitaController());
  //       }
  //       await detailpemeriksaanbalita.listDetailPemeriksaanBalita[widget.id];
  //     },
  //   );
  //   super.initState();
  //   // detailpemeriksaanbalita.getDetailPemeriksaanBalita(widget.id);
  // }

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
              Column(
                children: [
                  Text(
                    "PEMERIKSAAN BALITA",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(111, 23, 196, 98)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Umur Balita"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.umur_balita + " Bulan")
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Berat"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.berat_badan + ' Kg')
                                      ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Lingkar Kepala"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.lingkar_kepala + " Cm")
                                      ]),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Tinggi Badan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.tinggi_badan + " Cm")
                                      ]),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 60,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromARGB(111, 23, 196, 98)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Lingkar Lengan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.lingkar_kepala + " Cm")
                                      ]),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(111, 23, 196, 98)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Keluhan"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.keluhan)
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(111, 23, 196, 98)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Penanganan"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.penanganan)
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 60,
                          width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(111, 23, 196, 98)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Catatan Khusus"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.catatan)
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Date : " + widget.tanggal_pemeriksaan)
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
        )
      ],
    );
  }
}
