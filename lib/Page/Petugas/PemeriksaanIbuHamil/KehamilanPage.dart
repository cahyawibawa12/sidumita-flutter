import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/IbuHamil.dart';
import 'package:posyandu/Controller/PetugasController.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/PagePraKehamilan.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/FormAnggotaPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/TambahIbuHamil.dart';
import 'package:posyandu/Page/Petugas/PemeriksaanIbuHamil/RiwayatPemeriksaanIbuHamil.dart';
import 'package:posyandu/widget/widgets.dart';

class KehamilanPage extends StatefulWidget {
  const KehamilanPage({super.key, required this.petugasWithIbuHamilModel});
  final Map petugasWithIbuHamilModel;

  @override
  State<KehamilanPage> createState() => _KehamilanPageState();
}

class _KehamilanPageState extends State<KehamilanPage> {
  var kehamilanIbuForPetugas = Get.put(IbuHamilController());

  @override
  void initState() {
    super.initState();
    kehamilanIbuForPetugas.showKehamilanIbuForPetugas(
        int.parse(widget.petugasWithIbuHamilModel["id"]));
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
              Expanded(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/Logo.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "SIDUMITA",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  "Sistem Informasi Posyandu Ibu Hamil dan Balita",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(162, 255, 255, 255)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pilih Kehamilan :",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Obx(() =>
                                    kehamilanIbuForPetugas.isLoading.value
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : SingleChildScrollView(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: kehamilanIbuForPetugas
                                                  .listkehamilanIbuForPetugas
                                                  .length,
                                              physics: const ScrollPhysics(),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  child: ListTile(
                                                    title: Text("Kehamilan Ke -" +
                                                        kehamilanIbuForPetugas
                                                            .listkehamilanIbuForPetugas[
                                                                index]
                                                            .kehamilanKe
                                                            .toString()),
                                                    // subtitle: Text(detailKeluarga
                                                    //     .listDetailKeluarga[index].nik!),
                                                    // onTap: () {
                                                    //   Navigator.of(context).push(
                                                    //       MaterialPageRoute(
                                                    //           builder: (context) =>
                                                    //               ButtonNavBarBalita(
                                                    //                 balitaModel:
                                                    //                     balita.listBalita[
                                                    //                         index],
                                                    //               )));
                                                    // },
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  RiwayatPemeriksaanIbuHamil(
                                                                    kehamilanModel:
                                                                        kehamilanIbuForPetugas
                                                                            .listkehamilanIbuForPetugas[index],
                                                                  )));
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          )),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        )
      ],
    );
  }
}
