import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Builder(
                                builder: (context) {
                                  final List<Map> chartData = [
                                    {
                                      "umur": 0,
                                      "berat": 5.1,
                                    },
                                    {
                                      "umur": 2,
                                      "berat": 3,
                                    },
                                    {
                                      "umur": 3,
                                      "berat": 4,
                                    },
                                    {
                                      "umur": 4,
                                      "berat": 5,
                                    },
                                    {
                                      "umur": 5,
                                      "berat": 6,
                                    },
                                    {
                                      "umur": 6,
                                      "berat": 7,
                                    },
                                    {
                                      "umur": 8,
                                      "berat": 9,
                                    },
                                    {
                                      "umur": 9,
                                      "berat": 10,
                                    },
                                  ];

                                  return Container(
                                    color: Theme.of(context).cardColor,
                                    padding: const EdgeInsets.all(12.0),
                                    child: SfCartesianChart(
                                      series: <ChartSeries>[
                                        // Renders line chart
                                        LineSeries<Map, int>(
                                          dataSource: chartData,
                                          xValueMapper: (Map data, _) =>
                                              data["umur"],
                                          yValueMapper: (Map data, _) =>
                                              data["berat"],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
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
