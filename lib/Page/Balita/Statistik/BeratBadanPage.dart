import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/widget/listchart/listchartBerat.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widget/widgets.dart';

class BeratBadanPage extends StatefulWidget {
  BeratBadanPage({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<BeratBadanPage> createState() => _BeratBadanPageState();
}

class _BeratBadanPageState extends State<BeratBadanPage> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    // super.initState();
    // pemeriksaanbalita.getPemeriksaanBalita(widget.balitaModel.id!);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() => Text(
                                        pemeriksaanbalita
                                            .listPemeriksaanBalita[0].beratBadan
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.green),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() => Text(pemeriksaanbalita
                                      .listPemeriksaanBalita[0]
                                      .tanggalPemeriksaan))
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
                                  return Container(
                                    color: Theme.of(context).cardColor,
                                    padding: const EdgeInsets.all(12.0),
                                    child: Obx(() {
                                      if (pemeriksaanbalita.isLoading.value) {
                                        return CircularProgressIndicator();
                                      } else {
                                        return SfCartesianChart(
                                          zoomPanBehavior: _zoomPanBehavior,
                                          primaryXAxis: NumericAxis(
                                            interval: 1,
                                          ),
                                          primaryYAxis:
                                              NumericAxis(interval: 0.5),
                                          series: <ChartSeries>[
                                            LineSeries<Map, int>(
                                                dataSource:
                                                    pemeriksaanbalita.data,
                                                xValueMapper: (Map data, _) =>
                                                    int.parse(
                                                        data["umur_balita"]),
                                                yValueMapper: (Map data, _) =>
                                                    data["berat_badan"],
                                                dataLabelMapper:
                                                    (Map data, _) =>
                                                        data["umur_balita"] +
                                                        ': ' +
                                                        data["berat_badan"]
                                                            .toString(),
                                                dataLabelSettings:
                                                    DataLabelSettings(
                                                  // Renders the data label
                                                  isVisible: true,
                                                )),
                                            LineSeries<Map, int>(
                                              dataSource: chartBeratn3l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBeratn2l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBeratn1l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBeratNormall,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBerat1l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBerat2l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            ),
                                            LineSeries<Map, int>(
                                              dataSource: chartBerat3l,
                                              xValueMapper: (Map data, _) =>
                                                  data["umur"],
                                              yValueMapper: (Map data, _) =>
                                                  data["data"],
                                            )
                                          ],
                                        );
                                      }
                                    }),
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
