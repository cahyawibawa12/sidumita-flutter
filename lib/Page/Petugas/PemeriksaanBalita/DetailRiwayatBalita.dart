import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/MasterData/DokterController.dart';
import 'package:posyandu/Controller/MasterData/VitaminController.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailRiwayatBalita extends StatefulWidget {
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
  final String dokter_id;
  final String vitamin_id;

  const DetailRiwayatBalita(
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
      required this.petugas_kesehatan_id,
      required this.dokter_id,
      required this.vitamin_id});

  @override
  State<DetailRiwayatBalita> createState() => _DetailRiwayatBalitaState();
}

class _DetailRiwayatBalitaState extends State<DetailRiwayatBalita> {
  // var dokterController = Get.put(DokterController());
  // var vitaminController = Get.put(VitaminController());

  // void initState() {
  //   super.initState();
  //   dokterController.getDokter();
  //   vitaminController.getVitamin();
  // }
  void initState() {
    initializeDateFormatting('id');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Detail Riwayat"),
            backgroundColor: Color(0xff34BE82),
          ),
          body: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.2,
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                              width: 10,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
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
                          width: MediaQuery.of(context).size.width / 1.2,
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
                          width: MediaQuery.of(context).size.width / 1.2,
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
                          width: MediaQuery.of(context).size.width / 1.2,
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
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Obx(() => dokterController.isLoading.value
                        //     ? CircularProgressIndicator()
                        //     : Container(
                        //         height: 60,
                        //         width: MediaQuery.of(context).size.width / 1.2,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(5),
                        //             color: Color.fromARGB(111, 23, 196, 98)),
                        //         child: (() {
                        //           for (var data
                        //               in dokterController.listDokter.value) {
                        //             if (int.parse(widget.dokter_id) ==
                        //                 data.id) {
                        //               Container(
                        //                 height: 60,
                        //                 width:
                        //                     MediaQuery.of(context).size.width /
                        //                         1.2,
                        //                 decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(5),
                        //                     color: Color.fromARGB(
                        //                         111, 23, 196, 98)),
                        //                 child: Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: [
                        //                       Text("Dokter"),
                        //                       SizedBox(
                        //                         height: 10,
                        //                       ),
                        //                       Text(data.namaDokter.toString())
                        //                     ]),
                        //               );
                        //             } else {
                        //               Container(
                        //                 height: 60,
                        //                 width:
                        //                     MediaQuery.of(context).size.width /
                        //                         1.2,
                        //                 decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(5),
                        //                     color: Color.fromARGB(
                        //                         111, 23, 196, 98)),
                        //                 child: Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: [
                        //                       Text("Dokter"),
                        //                       SizedBox(
                        //                         height: 10,
                        //                       ),
                        //                       Text(widget.dokter_id)
                        //                     ]),
                        //               );
                        //             }
                        //           }
                        //         }()))),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Tanggal : " +
                            DateFormat('dd MMMM yyyy', "id").format(
                                DateTime.parse(widget.tanggal_pemeriksaan)))
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
