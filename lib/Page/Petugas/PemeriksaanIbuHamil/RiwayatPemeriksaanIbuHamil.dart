import 'package:flutter/material.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Controller/PemeriksaanIbuHamilController.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/DetailRiwayatIbuHamil.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/FormPemeriksaanIbuHamil.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/StatistikIbuHamilPetugas.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class RiwayatPemeriksaanIbuHamil extends StatefulWidget {
  RiwayatPemeriksaanIbuHamil(
      {super.key, required this.petugasWithIbuHamilModel});
  final Map petugasWithIbuHamilModel;

  @override
  State<RiwayatPemeriksaanIbuHamil> createState() =>
      _RiwayatPemeriksaanIbuHamilState();
}

class _RiwayatPemeriksaanIbuHamilState
    extends State<RiwayatPemeriksaanIbuHamil> {
  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());
  var dataBeratIbu = Get.put(CekDataController());

  @override
  void initState() {
    super.initState();
    pemeriksaanibuhamil
        .getPemeriksaanIbuHamil(widget.petugasWithIbuHamilModel["id"])
        .whenComplete(
      () {
        dataBeratIbu.getBeratIbu(widget.petugasWithIbuHamilModel["id"]);
      },
    );
    dataBeratIbu.statusBeratIbu(
        ibu_hamil_id: widget.petugasWithIbuHamilModel["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        pemeriksaanibuhamil
            .getPemeriksaanIbuHamil(widget.petugasWithIbuHamilModel["id"]);
      },
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Riwayat Ibu Hamil"),
              backgroundColor: Color(0xff34BE82),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormPemeriksaanIbuHamil(
                                        petugasWithIbuHamilModel:
                                            widget.petugasWithIbuHamilModel,
                                      )));
                        },
                        child: const Text("Tambah Data"),
                      ),
                    ),
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StatistikIbuHamilPetugas(
                                    petugasWithIbuHamilModel:
                                        widget.petugasWithIbuHamilModel,
                                  )));
                        },
                        child: const Text("Statistik"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              Text("T. Fundus"),
                              Text("(Cm)"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("D. Jantung Bayi"),
                              Text("(bpm)"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Nadi Ibu"),
                              Text("(bpm)"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Obx(() => pemeriksaanibuhamil.isLoading.value
                      ? CircularProgressIndicator()
                      : SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white),
                                child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .tanggalPemeriksaan),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .lingkarPerut
                                          .toString()),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .denyutJantungBayi
                                          .toString()),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .denyutNadi
                                          .toString()),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailRiwayatIbuHamil(
                                                          id: pemeriksaanibuhamil
                                                              .listPemeriksaanIbuHamil[
                                                                  index]
                                                              .id,
                                                          tanggal_pemeriksaan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .tanggalPemeriksaan,
                                                          umur_kandungan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .umurKandungan,
                                                          berat_badan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .beratBadan
                                                                  .toString(),
                                                          tinggi_badan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .tinggiBadan
                                                                  .toString(),
                                                          lingkar_perut:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .lingkarPerut
                                                                  .toString(),
                                                          denyut_jantung_bayi:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .denyutJantungBayi
                                                                  .toString(),
                                                          denyut_nadi:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .denyutNadi
                                                                  .toString(),
                                                          keluhan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .keluhan,
                                                          penanganan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .penanganan,
                                                          catatan:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .catatan,
                                                          ibu_hamil_id:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .ibuHamilId
                                                                  .toString(),
                                                          petugas_kesehatan_id:
                                                              pemeriksaanibuhamil
                                                                  .listPemeriksaanIbuHamil[
                                                                      index]
                                                                  .petugasKesehatanId
                                                                  .toString(),
                                                        )));
                                          },
                                          icon: const Icon(
                                            Icons.search,
                                            size: 15.0,
                                          ),
                                        ),
                                      ),
                                    ]),
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: pemeriksaanibuhamil
                                .listPemeriksaanIbuHamil.length,
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
