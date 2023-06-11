import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:intl/intl.dart';
import 'package:posyandu/widget/BackgroundImage.dart';

class ImunisasiBalitaPetugasPage extends StatefulWidget {
  ImunisasiBalitaPetugasPage({super.key, required this.petugasWithBalitaModel});

  final Map petugasWithBalitaModel;

  @override
  State<ImunisasiBalitaPetugasPage> createState() =>
      _ImunisasiBalitaPetugasPageState();
}

class _ImunisasiBalitaPetugasPageState
    extends State<ImunisasiBalitaPetugasPage> {
  var dataImunisasi = Get.put(CekDataController());

  @override
  void initState() {
    super.initState();
    dataImunisasi.CekImunisasiBalita(
        int.parse(widget.petugasWithBalitaModel["id"]));
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
                  child: Text("Imunisasi Balita",
                      style: GoogleFonts.gentiumBasic(
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => dataImunisasi.isLoading.value
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: ListView.separated(
                          itemCount: dataImunisasi.cekImunisasiBalita.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 4.0,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 10,
                              child: ListTile(
                                  title: Text(dataImunisasi
                                      .cekImunisasiBalita[index].vaksin
                                      .toString()),
                                  subtitle: (() {
                                    if (dataImunisasi
                                            .cekImunisasiBalita[index].status ==
                                        "Belum") {
                                      return Text('Tanggal: -');
                                    } else if (dataImunisasi
                                                .cekImunisasiBalita[index]
                                                .status ==
                                            "Kejar" ||
                                        dataImunisasi.cekImunisasiBalita[index]
                                                .status ==
                                            "Susulan" ||
                                        dataImunisasi.cekImunisasiBalita[index]
                                                .status ==
                                            "Akan") {
                                      return Text('Tanggal: ' +
                                          dataImunisasi
                                              .cekImunisasiBalita[index]
                                              .tanggalPemeriksaan
                                              .toString());
                                    } else {
                                      return Text("Tanggal: " +
                                          DateFormat('dd MMMM yyyy').format(
                                              DateTime.parse(dataImunisasi
                                                  .cekImunisasiBalita[index]
                                                  .tanggalPemeriksaan
                                                  .toString())));
                                    }
                                  }()),
                                  trailing: (() {
                                    if (dataImunisasi
                                            .cekImunisasiBalita[index].status ==
                                        "Belum") {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          dataImunisasi
                                              .cekImunisasiBalita[index].status
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    } else if (dataImunisasi
                                                .cekImunisasiBalita[index]
                                                .status ==
                                            "Akan" ||
                                        dataImunisasi.cekImunisasiBalita[index]
                                                .status ==
                                            "Kejar") {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.yellow[900],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          dataImunisasi
                                              .cekImunisasiBalita[index].status
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    } else if (dataImunisasi
                                            .cekImunisasiBalita[index].status ==
                                        "Susulan") {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue[900],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          dataImunisasi
                                              .cekImunisasiBalita[index].status
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          dataImunisasi
                                              .cekImunisasiBalita[index].status
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }
                                  }())),
                            );
                          },
                        ),
                      ),
                    )),
            ],
          )),
        )
      ],
    );
  }
}
