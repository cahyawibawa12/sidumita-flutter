import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PemeriksaanIbuHamilController.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/FormPemeriksaanIbuHamil.dart';
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

  @override
  void initState() {
    super.initState();
    pemeriksaanibuhamil
        .getPemeriksaanIbuHamil(widget.petugasWithIbuHamilModel["id"]);
    print('from page ' +
        pemeriksaanibuhamil.listPemeriksaanIbuHamil.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                            builder: (context) => FormPemeriksaanIbuHamil()));
                  },
                  child: const Text("Tambah Data"),
                ),
              ),
              Column(
                children: [
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
                    : InkWell(
                        child: SingleChildScrollView(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // SizedBox(
                                      //   width: 20,
                                      // ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .tanggalPemeriksaan),
                                      // SizedBox(
                                      //   width: 40,
                                      // ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .lingkarPerut
                                          .toString()),
                                      // SizedBox(
                                      //   width: 45,
                                      // ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .denyutJantungBayi
                                          .toString()),
                                      // SizedBox(
                                      //   width: 30,
                                      // ),
                                      Text(pemeriksaanibuhamil
                                          .listPemeriksaanIbuHamil[index]
                                          .denyutNadi
                                          .toString()),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                    ]),
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: pemeriksaanibuhamil
                                .listPemeriksaanIbuHamil.length,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FormPemeriksaanIbuHamil()));
                        },
                      )),
              )
            ],
          )),
        )
      ],
    );
  }
}
