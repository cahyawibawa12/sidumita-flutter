import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Page/Balita/DetailPemeriksaanBalita.dart';
import 'package:posyandu/widget/widgets.dart';
import 'package:intl/intl.dart';

class RiwayatBalitaPage extends StatefulWidget {
  RiwayatBalitaPage({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<RiwayatBalitaPage> createState() => _RiwayatBalitaPageState();
}

class _RiwayatBalitaPageState extends State<RiwayatBalitaPage> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());

  Future<void> _refresh(bool reload) async {
    await Get.find<PemeriksaanBalitaController>()
        .getPemeriksaanBalita(widget.balitaModel.id!);
  }

  @override
  void initState() {
    super.initState();
    pemeriksaanbalita.getPemeriksaanBalita(widget.balitaModel.id!);
    print('from page ' +
        pemeriksaanbalita.listPemeriksaanBalita.length.toString());
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 185, 246, 188)),
                child: Center(
                  child: Text("Riwayat Pemeriksaan",
                      style: GoogleFonts.gentiumBasic(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
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
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 10,
                        // ),
                        Text("Tanggal"),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 10,
                        // ),
                        Column(
                          children: [
                            Text("Berat"),
                            Text("(Kg)"),
                          ],
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 10,
                        // ),
                        Column(
                          children: [
                            Text("Tinggi"),
                            Text("(Cm)"),
                          ],
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 15,
                        // ),
                        Column(
                          children: [
                            Text("Lingkar Kepala"),
                            Text("(Cm)"),
                          ],
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 6,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Obx(() => RefreshIndicator(
                        onRefresh: () async {
                          await _refresh(true);
                        },
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 3),
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        12.5,
                                  ),
                                  Text(DateFormat('yMd').format(DateTime.parse(
                                      pemeriksaanbalita
                                          .listPemeriksaanBalita[index]
                                          .tanggalPemeriksaan))),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index].beratBadan
                                      .toString()),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index].tinggiBadan
                                      .toString()),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 10,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index]
                                      .lingkarKepala
                                      .toString()),
                                  // SizedBox(
                                  //   width:
                                  //       MediaQuery.of(context).size.width / 7,
                                  // ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: DetailPemeriksaanBalita(
                                            id: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .id,
                                            tanggal_pemeriksaan:
                                                pemeriksaanbalita
                                                    .listPemeriksaanBalita[
                                                        index]
                                                    .tanggalPemeriksaan,
                                            umur_balita: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .umurBalita,
                                            lingkar_kepala: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .lingkarKepala
                                                .toString(),
                                            lingkar_lengan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .lingkarLengan
                                                .toString(),
                                            berat_badan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .beratBadan
                                                .toString(),
                                            tinggi_badan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .tinggiBadan
                                                .toString(),
                                            keluhan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .keluhan,
                                            penanganan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .penanganan,
                                            catatan: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .catatan,
                                            balita_id: pemeriksaanbalita
                                                .listPemeriksaanBalita[index]
                                                .balitaId
                                                .toString(),
                                            petugas_kesehatan_id:
                                                pemeriksaanbalita
                                                    .listPemeriksaanBalita[
                                                        index]
                                                    .petugasKesehatanId
                                                    .toString(),
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        size: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              pemeriksaanbalita.listPemeriksaanBalita.length,
                        ),
                      )))
            ],
          )),
        )
      ],
    );
  }
}
