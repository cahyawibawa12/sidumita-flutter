import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/BalitaController.dart';
import 'package:posyandu/Page/Balita/ButtonNavBarBalita.dart';
import 'package:posyandu/Page/Balita/HomePageBalita.dart';
import 'package:posyandu/widget/widgets.dart';

class LandingBalita extends StatefulWidget {
  const LandingBalita({super.key});

  @override
  State<LandingBalita> createState() => _LandingBalitaState();
}

class _LandingBalitaState extends State<LandingBalita> {
  var balita = Get.put(BalitaController());

  @override
  void initState() {
    super.initState();
    balita.ShowBalita();
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
                                "List Balita :",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Obx(() => balita.isLoading.value
                                    ? Center(child: CircularProgressIndicator())
                                    : SingleChildScrollView(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: balita.listBalita.length,
                                          physics: const ScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              child: ListTile(
                                                title: Text(balita
                                                    .listBalita[index]
                                                    .detailKeluarga!
                                                    .namaLengkap
                                                    .toString()),
                                                // subtitle: Text(detailKeluarga
                                                //     .listDetailKeluarga[index].nik!),
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ButtonNavBarBalita(
                                                                balitaModel:
                                                                    balita.listBalita[
                                                                        index],
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
