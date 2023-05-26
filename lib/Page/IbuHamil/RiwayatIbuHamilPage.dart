import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/IbuHamil/DetailPemeriksaanIbuHamil.dart';

import 'package:posyandu/widget/widgets.dart';

import '../../Controller/PemeriksaanIbuHamilController.dart';

class RiwayatIbuHamilPage extends StatefulWidget {
  RiwayatIbuHamilPage({super.key, required this.ibuHamilModel});
  IbuHamilModel ibuHamilModel;

  @override
  State<RiwayatIbuHamilPage> createState() => _RiwayatIbuHamilPageState();
}

class _RiwayatIbuHamilPageState extends State<RiwayatIbuHamilPage> {
  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());

  @override
  void initState() {
    super.initState();
    pemeriksaanibuhamil.getPemeriksaanIbuHamil(widget.ibuHamilModel.id!);
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
          body: SafeArea(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 30),
                    child: Text(
                      "Riwayat Pemeriksaan",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
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
                  )
                ],
              ),
              Expanded(
                  child: Obx(() => SingleChildScrollView(
                        physics: ScrollPhysics(),
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
                                    width: 20,
                                  ),
                                  Text(pemeriksaanibuhamil
                                      .listPemeriksaanIbuHamil[index]
                                      .tanggalPemeriksaan),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(pemeriksaanibuhamil
                                      .listPemeriksaanIbuHamil[index]
                                      .lingkarPerut
                                      .toString()),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(pemeriksaanibuhamil
                                      .listPemeriksaanIbuHamil[index]
                                      .denyutJantungBayi
                                      .toString()),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(pemeriksaanibuhamil
                                      .listPemeriksaanIbuHamil[index].denyutNadi
                                      .toString()),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: DetailPemeriksaanIbuHamil(
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
                                              berat_badan: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .beratBadan
                                                  .toString(),
                                              tinggi_badan: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .tinggiBadan
                                                  .toString(),
                                              lingkar_perut: pemeriksaanibuhamil
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
                                              denyut_nadi: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .denyutNadi
                                                  .toString(),
                                              keluhan: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .keluhan,
                                              penanganan: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .penanganan,
                                              catatan: pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[
                                                      index]
                                                  .catatan,
                                              ibu_hamil_id: pemeriksaanibuhamil
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
                                            ),
                                            withNavBar:
                                                false, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino);
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
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pemeriksaanibuhamil
                              .listPemeriksaanIbuHamil.length,
                        ),
                      )))
            ],
          )),
        )
      ],
    );
  }
}
