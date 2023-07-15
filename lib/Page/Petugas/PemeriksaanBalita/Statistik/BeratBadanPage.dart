import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:posyandu/widget/listchart/listchartBerat.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class BeratBadanPagePetugas extends StatefulWidget {
  BeratBadanPagePetugas({super.key, required this.petugasWithBalitaModel});

  final Map petugasWithBalitaModel;

  @override
  State<BeratBadanPagePetugas> createState() => _BeratBadanPagePetugasState();
}

class _BeratBadanPagePetugasState extends State<BeratBadanPagePetugas> {
  var pemeriksaanbalita = Get.put(PemeriksaanBalitaController());
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;
  var umur = Get.put(DetailKeluargaController());

  @override
  void initState() {
    initializeDateFormatting('id');
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
                                              if (widget.petugasWithBalitaModel[
                                                      "jenis_kelamin"] ==
                                                  "Laki-Laki") {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  // tooltipBehavior: _tooltipBehavior,
                                                  legend:
                                                      Legend(isVisible: true),
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text: 'Umur(Bulan)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Berat Badan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      dataSource: chartBerat3l,
                                                      color: Colors.black,
                                                      name: "3",
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "2",
                                                      dataSource: chartBerat2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.yellow,
                                                      name: "1",
                                                      dataSource: chartBerat1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.green,
                                                      name: "0",
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
                                                      dataSource: chartBeratn1l,
                                                      color: Colors.yellow,
                                                      name: "-1",
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "-2",
                                                      dataSource: chartBeratn2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "-3",
                                                      dataSource: chartBeratn3l,
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
                                                  legend:
                                                      Legend(isVisible: true),
                                                  // tooltipBehavior: _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text: 'Umur(Bulan)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Berat Badan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "3",
                                                      dataSource: chartBerat3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "2",
                                                      dataSource: chartBerat2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.yellow,
                                                      name: "1",
                                                      dataSource: chartBerat1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.green,
                                                      name: "0",
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
                                                      color: Colors.yellow,
                                                      name: "-1",
                                                      dataSource: chartBeratn1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "-2",
                                                      dataSource: chartBeratn2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "-3",
                                                      dataSource: chartBeratn3p,
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
                                        Obx(() => Text(DateFormat(
                                                'dd MMMM yy', "id")
                                            .format(DateTime.parse(
                                                pemeriksaanbalita
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
                                              if (widget.petugasWithBalitaModel[
                                                      "jenis_kelamin"] ==
                                                  "Laki-Laki") {
                                                return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  legend:
                                                      Legend(isVisible: true),
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text: 'Umur(Bulan)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Berat Badan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        color: Colors.blue[700],
                                                        name: "Bulan:Berat",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        dataSource:
                                                            pemeriksaanbalita
                                                                .data,
                                                        xAxisName: "bulan",
                                                        yAxisName: "kg",
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_balita"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        // dataLabelMapper: (Map data,
                                                        //         _) =>
                                                        //     data["umur_balita"] +
                                                        //     ': ' +
                                                        //     data["berat_badan"]
                                                        //         .toString(),
                                                        // dataLabelSettings:
                                                        //     DataLabelSettings(
                                                        //   // Renders the data label
                                                        //   isVisible: true,
                                                        // ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.black,
                                                      name: "3",
                                                      dataSource: chartBerat3l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.red,
                                                      name: "2",
                                                      dataSource: chartBerat2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.yellow,
                                                      name: "1",
                                                      dataSource: chartBerat1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.green,
                                                      name: "0",
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
                                                      enableTooltip: false,
                                                      color: Colors.yellow,
                                                      name: "-1",
                                                      dataSource: chartBeratn1l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.red,
                                                      name: "-2",
                                                      dataSource: chartBeratn2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      enableTooltip: false,
                                                      color: Colors.black,
                                                      name: "-3",
                                                      dataSource: chartBeratn3l,
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
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  legend:
                                                      Legend(isVisible: true),
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text: 'Umur(Bulan)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Berat Badan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        isVisibleInLegend:
                                                            false,
                                                        color: Colors.blue[700],
                                                        name: "Bulan:Berat",
                                                        enableTooltip: true,
                                                        xAxisName: "bulan",
                                                        yAxisName: "kg",
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
                                                        // dataLabelMapper: (Map data,
                                                        //         _) =>
                                                        //     data["umur_balita"] +
                                                        //     ': ' +
                                                        //     data["berat_badan"]
                                                        //         .toString(),
                                                        // dataLabelSettings:
                                                        //     DataLabelSettings(
                                                        //   // Renders the data label
                                                        //   isVisible: true,
                                                        // )
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "3",
                                                      dataSource: chartBerat3p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "2",
                                                      dataSource: chartBerat2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.yellow,
                                                      name: "1",
                                                      dataSource: chartBerat1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.green,
                                                      name: "0",
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
                                                      color: Colors.yellow,
                                                      name: "-1",
                                                      dataSource: chartBeratn1p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.red,
                                                      name: "-2",
                                                      dataSource: chartBeratn2p,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "-3",
                                                      dataSource: chartBeratn3p,
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
