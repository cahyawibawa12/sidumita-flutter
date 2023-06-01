import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/widget/listchart/listchartBerat.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

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
  late TooltipBehavior _tooltipBehavior;
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    // super.initState();
    // pemeriksaanbalita.getPemeriksaanBalita(widget.balitaModel.id!);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    // umur.GetUmur(widget.balitaModel.detailKeluarga!.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: (() {
              if (pemeriksaanbalita.listPemeriksaanBalita.isEmpty) {
                return SafeArea(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Usia: "),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Data Terkini:"),
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
                                            if (pemeriksaanbalita
                                                .isLoading.value) {
                                              return CircularProgressIndicator();
                                            } else {
                                              if (widget
                                                      .balitaModel
                                                      .detailKeluarga!
                                                      .jenisKelamin ==
                                                  "Laki-Laki") {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  // tooltipBehavior: _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartBeratNormall,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    )
                                                  ],
                                                );
                                              } else {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartBeratNormalp,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    )
                                                  ],
                                                );
                                              }
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
                );
              } else {
                return SafeArea(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Usia: "),
                                        (() {
                                          if (umur.umurPeserta.value.format
                                                  .toString() ==
                                              "tahun") {
                                            return Text(
                                              umur.umurPeserta.value.umur
                                                      .toString() +
                                                  " Tahun " +
                                                  (umur.umurPeserta.value
                                                              .usiaBulan! %
                                                          12)
                                                      .toString() +
                                                  " Bulan",
                                            );
                                          } else {
                                            return Text(
                                              "0 Tahun " +
                                                  (umur.umurPeserta.value
                                                              .usiaBulan! %
                                                          12)
                                                      .toString() +
                                                  " Bulan",
                                            );
                                          }
                                        }())
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
                                                  .listPemeriksaanBalita[0]
                                                  .beratBadan
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Obx(() => Text(
                                            DateFormat('dd MMMM yyyy').format(
                                                DateTime.parse(pemeriksaanbalita
                                                    .listPemeriksaanBalita[0]
                                                    .tanggalPemeriksaan))))
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
                                            if (pemeriksaanbalita
                                                .isLoading.value) {
                                              return CircularProgressIndicator();
                                            } else {
                                              if (widget
                                                      .balitaModel
                                                      .detailKeluarga!
                                                      .jenisKelamin ==
                                                  "Laki-Laki") {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  // tooltipBehavior: _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        dataSource:
                                                            pemeriksaanbalita
                                                                .data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_balita"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelMapper: (Map
                                                                    data,
                                                                _) =>
                                                            data[
                                                                "umur_balita"] +
                                                            ': ' +
                                                            data["berat_badan"]
                                                                .toString(),
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartBeratNormall,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    )
                                                  ],
                                                );
                                              } else {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        dataSource:
                                                            pemeriksaanbalita
                                                                .data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_balita"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelMapper: (Map
                                                                    data,
                                                                _) =>
                                                            data[
                                                                "umur_balita"] +
                                                            ': ' +
                                                            data["berat_badan"]
                                                                .toString(),
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        )),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBeratn1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartBeratNormalp,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    )
                                                  ],
                                                );
                                              }
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
                );
              }
            }()))
      ],
    );
  }
}
