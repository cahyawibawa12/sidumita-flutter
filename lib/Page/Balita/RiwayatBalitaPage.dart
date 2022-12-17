import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Page/Balita/DetailPemeriksaanBalita.dart';
import 'package:posyandu/widget/widgets.dart';

class RiwayatBalitaPage extends StatefulWidget {
  const RiwayatBalitaPage({super.key});

  @override
  State<RiwayatBalitaPage> createState() => _RiwayatBalitaPageState();
}

class _RiwayatBalitaPageState extends State<RiwayatBalitaPage> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());

  @override
  void initState() {
    super.initState();
    pemeriksaanbalita.getPemeriksaanBalita(2);
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
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index]
                                      .tanggal_pemeriksaan),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index].berat_badan
                                      .toString()),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index].tinggi_badan
                                      .toString()),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[index]
                                      .lingkar_kepala
                                      .toString()),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPemeriksaanBalita(
                                                    id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .id,
                                                    tanggal_pemeriksaan:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .tanggal_pemeriksaan,
                                                    lingkar_kepala:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .lingkar_kepala
                                                            .toString(),
                                                    lingkar_lengan:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .lingkar_lengan
                                                            .toString(),
                                                    berat_badan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .berat_badan
                                                        .toString(),
                                                    tinggi_badan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .tinggi_badan
                                                        .toString(),
                                                    keluhan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .keluhan,
                                                    penanganan: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .penanganan,
                                                    balita_id: pemeriksaanbalita
                                                        .listPemeriksaanBalita[
                                                            index]
                                                        .balita_id
                                                        .toString(),
                                                    petugas_kesehatan_id:
                                                        pemeriksaanbalita
                                                            .listPemeriksaanBalita[
                                                                index]
                                                            .petugas_kesehatan_id
                                                            .toString(),
                                                  )));
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          physics: NeverScrollableScrollPhysics(),
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
