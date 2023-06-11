import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/Statistik/LingkarKepalaPage.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanBalita/Statistik/TinggiBadanPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class StatistikBalitaPetugas extends StatefulWidget {
  StatistikBalitaPetugas({super.key, required this.petugasWithBalitaModel});

  final Map petugasWithBalitaModel;

  @override
  State<StatistikBalitaPetugas> createState() => _StatistikBalitaPetugasState();
}

class _StatistikBalitaPetugasState extends State<StatistikBalitaPetugas> {
  // List<Widget> _buildPage() {
  //   return [
  //     const BeratBadanPage(),
  //     const LingkarKepalaPage(),
  //     const TinggiBadanPage(),
  //   ];
  // }
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  var umur = Get.put(DetailKeluargaController());

  void initState() {
    // pemeriksaanbalita.getPemeriksaanBalita(widget.petugasWithBalitaModel["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      DefaultTabController(
        length: 3,
        child: Scaffold(
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
                      child: Text("Statistik Balita",
                          style: GoogleFonts.gentiumBasic(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    margin: EdgeInsets.all(10),
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25.0)),
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(25.0)),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Berat Badan',
                        ),
                        Tab(
                          text: 'L.Kepala',
                        ),
                        Tab(
                          text: 'Tinggi Badan',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(children: <Widget>[
                    BeratBadanPagePetugas(
                      petugasWithBalitaModel: widget.petugasWithBalitaModel,
                    ),
                    LingkarKepalaPagePetugas(
                        petugasWithBalitaModel: widget.petugasWithBalitaModel),
                    TinggiBadanPagePetugas(
                        petugasWithBalitaModel: widget.petugasWithBalitaModel)
                  ]))
                ],
              ),
            )),
      )
    ]);
  }
}
