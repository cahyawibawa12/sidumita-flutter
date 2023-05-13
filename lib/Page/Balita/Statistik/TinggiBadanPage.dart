import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Controller/PemeriksaanBalitaController.dart';
import '../../../widget/listchart/listchartTinggi.dart';
import '../../../widget/widgets.dart';

class TinggiBadanPage extends StatefulWidget {
  TinggiBadanPage({super.key, required this.balitaModel});

  BalitaModel balitaModel;

  @override
  State<TinggiBadanPage> createState() => _TinggiBadanPageState();
}

class _TinggiBadanPageState extends State<TinggiBadanPage> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  late ZoomPanBehavior _zoomPanBehavior;
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
              if (pemeriksaanbalita.listPemeriksaanBalita.isNotEmpty) {
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
                                        Text(
                                          umur.umurPeserta.value.umur
                                                  .toString() +
                                              " Tahun " +
                                              (umur.umurPeserta.value
                                                          .usiaBulan! %
                                                      12)
                                                  .toString() +
                                              " Bulan",
                                        ),
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
                                                  .tinggiBadan
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green),
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
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5,
                                                      minimum: 33),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        dataSource:
                                                            pemeriksaanbalita
                                                                .data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_balita"]),
                                                        yValueMapper: (Map
                                                                    data,
                                                                _) =>
                                                            data[
                                                                "tinggi_badan"],
                                                        dataLabelMapper: (Map data,
                                                                _) =>
                                                            data["umur_balita"] +
                                                            ': ' +
                                                            data["tinggi_badan"]
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
                                                      dataSource:
                                                          chartTinggin3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggiNormall,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi3l,
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
                                                      interval: 0.5,
                                                      minimum: 33),
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
                                                            data[
                                                                "tinggi_badan"],
                                                        dataLabelMapper: (Map
                                                                    data,
                                                                _) =>
                                                            data[
                                                                "umur_balita"] +
                                                            ': ' +
                                                            data["tinggi_badan"]
                                                                .toString(),
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        )),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggiNormalp,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi3p,
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
                                                  primaryXAxis: NumericAxis(
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      interval: 0.5,
                                                      minimum: 33),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggiNormall,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi3l,
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
                                                      interval: 0.5,
                                                      minimum: 33),
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
                                                            data[
                                                                "tinggi_badan"],
                                                        dataLabelMapper: (Map
                                                                    data,
                                                                _) =>
                                                            data[
                                                                "umur_balita"] +
                                                            ': ' +
                                                            data["tinggi_badan"]
                                                                .toString(),
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        )),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggin1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartTinggiNormalp,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartTinggi3p,
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
