import 'package:flutter/material.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailRiwayatIbuHamil extends StatefulWidget {
  final int id;
  final String tanggal_pemeriksaan;
  final String umur_kandungan;
  final String tinggi_badan;
  final String berat_badan;
  final String lingkar_perut;
  final String denyut_jantung_bayi;
  final String denyut_nadi;
  final String penanganan;
  final String keluhan;
  final String catatan;
  final String ibu_hamil_id;
  final String petugas_kesehatan_id;

  const DetailRiwayatIbuHamil(
      {required this.id,
      required this.tanggal_pemeriksaan,
      required this.umur_kandungan,
      required this.tinggi_badan,
      required this.berat_badan,
      required this.lingkar_perut,
      required this.denyut_jantung_bayi,
      required this.denyut_nadi,
      required this.penanganan,
      required this.keluhan,
      required this.catatan,
      required this.ibu_hamil_id,
      required this.petugas_kesehatan_id});

  @override
  State<DetailRiwayatIbuHamil> createState() => _DetailRiwayatIbuHamilState();
}

class _DetailRiwayatIbuHamilState extends State<DetailRiwayatIbuHamil> {
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
                                        Text("Umur Kandungan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.umur_kandungan + " Minggu")
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
                                        Text("Denyut Nadi"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.denyut_nadi + " bpm")
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
                                        Text("Tinggi Fundus"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.lingkar_perut + " Cm")
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
                                        Text("Denyut Jantung Bayi"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            widget.denyut_jantung_bayi + " bpm")
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
                                        Text("Tinggi Badan"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(widget.tinggi_badan + " Cm")
                                      ]),
                                ),
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
                        SizedBox(
                          height: 20,
                        ),
                        Text("Date : " +
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
