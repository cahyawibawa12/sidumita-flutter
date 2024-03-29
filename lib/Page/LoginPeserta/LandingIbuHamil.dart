import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/IbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/ButtonNavBarIbuHamil.dart';
import 'package:posyandu/Page/IbuHamil/PagePraKehamilan.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:posyandu/Page/LoginPeserta/EditPeserta/FormAnggotaPeserta.dart';
import 'package:posyandu/Page/LoginPeserta/TambahIbuHamil.dart';
import 'package:posyandu/widget/widgets.dart';

class LandingIbuHamil extends StatefulWidget {
  const LandingIbuHamil({super.key});

  @override
  State<LandingIbuHamil> createState() => _LandingIbuHamilState();
}

class _LandingIbuHamilState extends State<LandingIbuHamil> {
  var ibuHamil = Get.put(IbuHamilController());

  @override
  void initState() {
    super.initState();
    ibuHamil.ShowIbuHamil();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        ibuHamil.ShowIbuHamil();
      },
      child: Stack(
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
                      SizedBox(
                        height: 20,
                      ),
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
                                    builder: (context) => TambahIbuHamil()));
                          },
                          child: const Text("Tambah Data"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(162, 255, 255, 255)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "List Ibu Hamil :",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Obx(() => ibuHamil.isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : SingleChildScrollView(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount:
                                                ibuHamil.listIbuHamil.length,
                                            physics: const ScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Card(
                                                child: ListTile(
                                                  title: Text(ibuHamil
                                                      .listIbuHamil[index]
                                                      .detailKeluarga!
                                                      .namaLengkap
                                                      .toString()),
                                                  subtitle: Text(
                                                      "Kehamilan ke " +
                                                          ibuHamil
                                                              .listIbuHamil[
                                                                  index]
                                                              .kehamilanKe
                                                              .toString()),
                                                  onTap: () {
                                                    if (ibuHamil
                                                                .listIbuHamil[
                                                                    index]
                                                                .beratBadanPrakehamilan ==
                                                            "0" ||
                                                        ibuHamil
                                                                .listIbuHamil[
                                                                    index]
                                                                .tinggiBadanPrakehamilan ==
                                                            "0") {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PagePraKehamilan(
                                                                    ibuHamilModel:
                                                                        ibuHamil
                                                                            .listIbuHamil[index],
                                                                  )));
                                                    } else {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ButtonNavBarIbuHamil(
                                                                    ibuHamilModel:
                                                                        ibuHamil
                                                                            .listIbuHamil[index],
                                                                  )));
                                                    }
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
      ),
    );
  }
}
