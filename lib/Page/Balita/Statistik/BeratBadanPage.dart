import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/GetTwoLastDataPemeriksaanController.dart';
import '../../../widget/widgets.dart';

class BeratBadanPage extends StatefulWidget {
  const BeratBadanPage({super.key});

  @override
  State<BeratBadanPage> createState() => _BeratBadanPageState();
}

class _BeratBadanPageState extends State<BeratBadanPage> {
  var getTwoLastDataPemeriksaanBalita =
      Get.put(GetTwoLastDataPemeriksaanBalitaController());

  @override
  void initState() {
    super.initState();
    getTwoLastDataPemeriksaanBalita.getTwoLastDataPemeriksaanBalita(1);
    // print('frompage' +
    //     getTwoLastDataPemeriksaanBalita.listTwoLastDataPemeriksaanBalita.length
    //         .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(162, 255, 255, 255)),
                          child: Column(
                            children: [
                              // Obx(() {
                              //   if (getTwoLastDataPemeriksaanBalita
                              //           .listTwoLastDataPemeriksaanBalita
                              //           .length !=
                              //       0) {
                              //     if (getTwoLastDataPemeriksaanBalita
                              //             .listTwoLastDataPemeriksaanBalita[0]
                              //             .beratBadan >=
                              //         4) {
                              //       return Column(
                              //         children: [
                              //           Row(
                              //             children: [
                              //               Text("Berat Anak Anda : "),
                              //               Container(
                              //                 // width: 60,
                              //                 // height: 20,
                              //                 decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(5),
                              //                     color: Colors.green),
                              //                 child:
                              //                     Center(child: Text('Normal')),
                              //               )
                              //             ],
                              //           )
                              //         ],
                              //       );
                              //     }
                              //   } else {
                              //     return Text("Loading");
                              //   }
                              // })
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(162, 255, 255, 255)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("Usia: "),
                                  Text("0 Tahun 6 Bulan"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Data Terkini:"),
                                  Text("berat"),
                                  Text("tanggal")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
          ),
        )
      ],
    );
  }
}
