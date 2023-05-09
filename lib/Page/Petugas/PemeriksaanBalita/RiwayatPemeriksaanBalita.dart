import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/PetugasWithBalitaModel.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/DetailRiwayatBalita.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/FormPemeriksaanBalita.dart';

import 'package:posyandu/widget/BackgroundImage.dart';

class RiwayatPemeriksaanBalita extends StatefulWidget {
  RiwayatPemeriksaanBalita({super.key, required this.petugasWithBalitaModel});

  final Map petugasWithBalitaModel;

  @override
  State<RiwayatPemeriksaanBalita> createState() =>
      _RiwayatPemeriksaanBalitaState();
}

class _RiwayatPemeriksaanBalitaState extends State<RiwayatPemeriksaanBalita> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());

  @override
  void initState() {
    super.initState();
    pemeriksaanbalita.getPemeriksaanBalita(widget.petugasWithBalitaModel["id"]);
    print('from page ' +
        pemeriksaanbalita.listPemeriksaanBalita.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        pemeriksaanbalita
            .getPemeriksaanBalita(widget.petugasWithBalitaModel["id"]);
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Riwayat Balita"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Container(
                  height: 64,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormPemeriksaanBalita(
                                  petugasWithBalitaModel:
                                      widget.petugasWithBalitaModel)));
                    },
                    child: const Text("Tambah Data"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Tanggal"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text("Berat"),
                          Text("(Kg)"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Tinggi"),
                          Text("(Cm)"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Lingkar Kepala"),
                          Text("(Cm)"),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() => pemeriksaanbalita.isLoading.value
                      ? CircularProgressIndicator()
                      : SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                child: Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 3),
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .tanggalPemeriksaan),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .beratBadan
                                          .toString()),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .tinggiBadan
                                          .toString()),
                                      // SizedBox(
                                      //   width: 30,
                                      // ),
                                      Text(pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .lingkarKepala
                                          .toString()),
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailRiwayatBalita()));
                                },
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                pemeriksaanbalita.listPemeriksaanBalita.length,
                          ),
                        )),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
