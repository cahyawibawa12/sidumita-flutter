import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Model/BalitaModel.dart';

import '../../widget/BackgroundImage.dart';

class ImunisasiBalitaPage extends StatefulWidget {
  ImunisasiBalitaPage({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<ImunisasiBalitaPage> createState() => _ImunisasiBalitaPageState();
}

class _ImunisasiBalitaPageState extends State<ImunisasiBalitaPage> {
  var dataImunisasi = Get.put(CekDataController());

  @override
  void initState() {
    super.initState();
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
              Text("Imunisasi Balita",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
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
                                  // subtitle: const Text("Programmer"),
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
