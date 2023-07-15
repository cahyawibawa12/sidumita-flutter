import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posyandu/Controller/DetailKeluargaController.dart';
import 'package:posyandu/Controller/PemeriksaanBalitaController.dart';
import 'package:posyandu/Model/BalitaModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../widget/listchart/listchartLingkarKepala.dart';
import '../../../widget/widgets.dart';

class LingkarKepalaPage extends StatefulWidget {
  LingkarKepalaPage({super.key, required this.balitaModel});

  BalitaModel balitaModel;
  @override
  State<LingkarKepalaPage> createState() => _LingkarKepalaPageState();
}

class _LingkarKepalaPageState extends State<LingkarKepalaPage> {
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
    _tooltipBehavior = TooltipBehavior(enable: true, duration: 1);
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
                                                  .lingkarKepala
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.green),
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Obx(() => Text(DateFormat(
                                                'dd MMMM yyyy', "id")
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
                                              if (widget
                                                      .balitaModel
                                                      .detailKeluarga!
                                                      .jenisKelamin ==
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
                                                              'Lingkar Kepala(Cm)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5,
                                                      minimum: 28),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        color: Colors.blue[700],
                                                        name:
                                                            "Bulan:Lingkar Kepala",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        xAxisName: "Bulan",
                                                        yAxisName: "Cm",
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
                                                                "lingkar_kepala"],
                                                        // dataLabelMapper: (Map data,
                                                        //         _) =>
                                                        //     data["umur_balita"] +
                                                        //     ': ' +
                                                        //     data["lingkar_kepala"]
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
                                                      color: Colors.black,
                                                      name: "3",
                                                      enableTooltip: false,
                                                      dataSource: chartKepala3l,
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
                                                      enableTooltip: false,
                                                      dataSource: chartKepala2l,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource: chartKepala1l,
                                                      color: Colors.yellow,
                                                      name: "1",
                                                      enableTooltip: false,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalaNormall,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan1l,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan2l,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan3l,
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
                                                              'Lingkar Kepala(Cm)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5,
                                                      minimum: 28),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                        color: Colors.blue[700],
                                                        name:
                                                            "Bulan:Lingkar Kepala",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        xAxisName: "Bulan",
                                                        yAxisName: "Cm",
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
                                                                "lingkar_kepala"],
                                                        // dataLabelMapper: (Map
                                                        //             data,
                                                        //         _) =>
                                                        //     data[
                                                        //         "umur_balita"] +
                                                        //     ': ' +
                                                        //     data["lingkar_kepala"]
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
                                                      name: "-3",
                                                      enableTooltip: false,
                                                      dataSource: chartKepala3p,
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
                                                      enableTooltip: false,
                                                      dataSource: chartKepala2p,
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
                                                      enableTooltip: false,
                                                      dataSource: chartKepala1p,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalaNormalp,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan1p,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan2p,
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
                                                      enableTooltip: false,
                                                      dataSource:
                                                          chartKepalan3p,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Center(
                                            child: Text('Cara Membaca Grafik')),
                                        content: Table(
                                          border: TableBorder.all(),
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: FlexColumnWidth(),
                                            1: FlexColumnWidth(),
                                          },
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("> +2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child:
                                                          Text("Sangat Besar")),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text(
                                                          "-2 SD sampai dengan + 2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("Normal")),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("< -2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child:
                                                          Text("Sangat Kecil")),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    icon: Icon(Icons.help),
                                    color: Colors.white,
                                    iconSize: 30,
                                  ),
                                ],
                              )
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
                                                              'Lingkar Kepala(Cm)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5,
                                                      minimum: 28),
                                                  series: <ChartSeries>[
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "3",
                                                      dataSource: chartKepala3l,
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
                                                      dataSource: chartKepala2l,
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
                                                      dataSource: chartKepala1l,
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
                                                          chartKepalaNormall,
                                                      xValueMapper:
                                                          (Map data, _) =>
                                                              data["umur"],
                                                      yValueMapper:
                                                          (Map data, _) =>
                                                              data["data"],
                                                    ),
                                                    LineSeries<Map, int>(
                                                      dataSource:
                                                          chartKepalan1l,
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
                                                      dataSource:
                                                          chartKepalan2l,
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
                                                      dataSource:
                                                          chartKepalan3l,
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
                                                              'Lingkar Kepala(Cm)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 0.5,
                                                      minimum: 28),
                                                  series: <ChartSeries>[
                                                    // LineSeries<Map, int>(
                                                    //     dataSource:
                                                    //         pemeriksaanbalita
                                                    //             .data,
                                                    //     xValueMapper: (Map data,
                                                    //             _) =>
                                                    //         int.parse(data[
                                                    //             "umur_balita"]),
                                                    //     yValueMapper: (Map data,
                                                    //             _) =>
                                                    //         data[
                                                    //             "lingkar_kepala"],
                                                    //     dataLabelMapper: (Map
                                                    //                 data,
                                                    //             _) =>
                                                    //         data[
                                                    //             "umur_balita"] +
                                                    //         ': ' +
                                                    //         data["lingkar_kepala"]
                                                    //             .toString(),
                                                    //     dataLabelSettings:
                                                    //         DataLabelSettings(
                                                    //       // Renders the data label
                                                    //       isVisible: true,
                                                    //     )),
                                                    LineSeries<Map, int>(
                                                      color: Colors.black,
                                                      name: "3",
                                                      dataSource: chartKepala3p,
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
                                                      dataSource: chartKepala2p,
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
                                                      dataSource: chartKepala1p,
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
                                                          chartKepalaNormalp,
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
                                                      dataSource:
                                                          chartKepalan1p,
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
                                                      dataSource:
                                                          chartKepalan2p,
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
                                                      dataSource:
                                                          chartKepalan3p,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Center(
                                            child: Text('Cara Membaca Grafik')),
                                        content: Table(
                                          border: TableBorder.all(),
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: FlexColumnWidth(),
                                            1: FlexColumnWidth(),
                                          },
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("> +2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child:
                                                          Text("Sangat Besar")),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text(
                                                          "-2 SD sampai dengan + 2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("Normal")),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child: Text("< -2 SD")),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Center(
                                                      child:
                                                          Text("Sangat Kecil")),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    icon: Icon(Icons.help),
                                    color: Colors.white,
                                    iconSize: 30,
                                  ),
                                ],
                              )
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
