import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posyandu/Controller/CekDataController.dart';
import 'package:posyandu/Controller/PemeriksaanIbuHamilController.dart';
import 'package:posyandu/Model/IbuHamilModel.dart';
import 'package:posyandu/Page/Balita/Statistik/BeratBadanPage.dart';
import 'package:posyandu/Page/Balita/Statistik/LingkarKepalaPage.dart';
import 'package:posyandu/Page/Balita/Statistik/TinggiBadanPage.dart';
import 'package:posyandu/widget/BackgroundImage.dart';
import 'package:posyandu/widget/listchart/listChartIbu.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class StatistikIbuHamilPage extends StatefulWidget {
  StatistikIbuHamilPage({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<StatistikIbuHamilPage> createState() => _StatistikIbuHamilPageState();
}

class _StatistikIbuHamilPageState extends State<StatistikIbuHamilPage> {
  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());
  var dataBeratIbu = Get.put(CekDataController());
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;

  Future<void> _refresh(bool reload) async {
    await Get.find<PemeriksaanIbuHamilController>()
        .getPemeriksaanIbuHamil(widget.ibuHamilModel.id!)
        .then((value) => dataBeratIbu.getBeratIbu(widget.ibuHamilModel.id!));
  }

  @override
  void initState() {
    initializeDateFormatting('id');
    super.initState();
    pemeriksaanibuhamil
        .getPemeriksaanIbuHamil(widget.ibuHamilModel.id!)
        .then((value) => dataBeratIbu.getBeratIbu(widget.ibuHamilModel.id!));

    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: (() {
              if (pemeriksaanibuhamil.listPemeriksaanIbuHamil.isNotEmpty) {
                return SafeArea(
                    child: Obx(
                  () => pemeriksaanibuhamil.isLoading.value ||
                          dataBeratIbu.isLoading.value
                      ? CircularProgressIndicator()
                      : RefreshIndicator(
                          onRefresh: () async {
                            await _refresh(true);
                          },
                          child: SingleChildScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  margin: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:
                                          Color.fromARGB(255, 185, 246, 188)),
                                  child: Center(
                                    child: Text("Statistik Ibu Hamil",
                                        style: GoogleFonts.gentiumBasic(
                                          textStyle: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:
                                          Color.fromARGB(162, 255, 255, 255)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Usia Kandungan: "),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(pemeriksaanibuhamil
                                                  .listPemeriksaanIbuHamil[0]
                                                  .umurKandungan +
                                              " Minggu"),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("Data Terkini:"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            pemeriksaanibuhamil
                                                .listPemeriksaanIbuHamil[0]
                                                .beratBadan
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(DateFormat('dd MMMM yyyy', "id")
                                              .format(DateTime.parse(
                                                  pemeriksaanibuhamil
                                                      .listPemeriksaanIbuHamil[
                                                          0]
                                                      .tanggalPemeriksaan)))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Builder(builder: (context) {
                                        return Container(
                                          color: Theme.of(context).cardColor,
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                              child: (() {
                                            if (dataBeratIbu.hasilStatusBeratIbu
                                                    .value.status ==
                                                "Underweight") {
                                              return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text:
                                                            'Umur Kandungan(Minggu)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Rekomendasi Berat Tambahan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 1),
                                                  series: <CartesianSeries>[
                                                    LineSeries<Map, int>(
                                                        name:
                                                            "Umur Kandungan:Peningkatan Berat",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        dataSource:
                                                            dataBeratIbu.data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_kandungan"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    SplineRangeAreaSeries<
                                                            ChartData, num>(
                                                        dataSource: underWeight,
                                                        enableTooltip: false,
                                                        xValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.xValue,
                                                        lowValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.lowValue,
                                                        highValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.highValue,
                                                        opacity: 0.5,
                                                        color:
                                                            Colors.blue[500]),
                                                  ]);
                                            } else if (dataBeratIbu
                                                    .hasilStatusBeratIbu
                                                    .value
                                                    .status ==
                                                "Normal") {
                                              return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text:
                                                            'Umur Kandungan(Minggu)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Rekomendasi Berat Tambahan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 1),
                                                  series: <CartesianSeries>[
                                                    LineSeries<Map, int>(
                                                        name:
                                                            "Umur Kandungan:Peningkatan Berat",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        dataSource:
                                                            dataBeratIbu.data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_kandungan"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    SplineRangeAreaSeries<
                                                            ChartData, num>(
                                                        enableTooltip: false,
                                                        dataSource:
                                                            normalWeight,
                                                        xValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.xValue,
                                                        lowValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.lowValue,
                                                        highValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.highValue,
                                                        opacity: 0.5,
                                                        color: Colors.red[500]),
                                                  ]);
                                            } else if (dataBeratIbu
                                                    .hasilStatusBeratIbu
                                                    .value
                                                    .status ==
                                                "Overweight") {
                                              return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  tooltipBehavior:
                                                      _tooltipBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text:
                                                            'Umur Kandungan(Minggu)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Rekomendasi Berat Tambahan(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 1),
                                                  series: <CartesianSeries>[
                                                    LineSeries<Map, int>(
                                                        dataSource:
                                                            dataBeratIbu.data,
                                                        name:
                                                            "Umur Kandungan:Peningkatan Berat",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_kandungan"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    SplineRangeAreaSeries<
                                                            ChartData, num>(
                                                        dataSource: overWeight,
                                                        enableTooltip: false,
                                                        xValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.xValue,
                                                        lowValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.lowValue,
                                                        highValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.highValue,
                                                        opacity: 0.5,
                                                        color:
                                                            Colors.green[500]),
                                                  ]);
                                            } else {
                                              return SfCartesianChart(
                                                  zoomPanBehavior:
                                                      _zoomPanBehavior,
                                                  primaryXAxis: NumericAxis(
                                                    title: AxisTitle(
                                                        text:
                                                            'Umur Kandungan(Minggu)',
                                                        textStyle: TextStyle(
                                                            fontSize: 10)),
                                                    interval: 1,
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                      title: AxisTitle(
                                                          text:
                                                              'Rekomendasi Berat(Kg)',
                                                          textStyle: TextStyle(
                                                              fontSize: 10)),
                                                      interval: 1),
                                                  series: <CartesianSeries>[
                                                    LineSeries<Map, int>(
                                                        name:
                                                            "Umur Kandungan:Peningkatan Berat",
                                                        isVisibleInLegend:
                                                            false,
                                                        enableTooltip: true,
                                                        dataSource:
                                                            dataBeratIbu.data,
                                                        xValueMapper: (Map data,
                                                                _) =>
                                                            int.parse(data[
                                                                "umur_kandungan"]),
                                                        yValueMapper: (Map data,
                                                                _) =>
                                                            data["berat_badan"],
                                                        dataLabelSettings:
                                                            DataLabelSettings(
                                                          // Renders the data label
                                                          isVisible: true,
                                                        ),
                                                        markerSettings:
                                                            MarkerSettings(
                                                                isVisible:
                                                                    true)),
                                                    SplineRangeAreaSeries<
                                                            ChartData, num>(
                                                        dataSource: obeseWeight,
                                                        enableTooltip: false,
                                                        xValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.xValue,
                                                        lowValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.lowValue,
                                                        highValueMapper:
                                                            (ChartData data,
                                                                    _) =>
                                                                data.highValue,
                                                        opacity: 0.5,
                                                        color:
                                                            Colors.grey[500]),
                                                  ]);
                                            }
                                          }())),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:
                                          Color.fromARGB(162, 255, 255, 255)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text("Indeks Masa Tubuh:"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(dataBeratIbu
                                              .hasilStatusBeratIbu.value.imt
                                              .toString()),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Rekomendasi Berat:"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(dataBeratIbu.hasilStatusBeratIbu
                                                  .value.bbMinimal
                                                  .toString() +
                                              " Kg - " +
                                              dataBeratIbu.hasilStatusBeratIbu
                                                  .value.bbMaksimal
                                                  .toString() +
                                              " Kg"),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("IMT Status:"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            dataBeratIbu.hasilStatusBeratIbu
                                                .value.status
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.green),
                                          ),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
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
                                              child: Text('Cara Membaca IMT')),
                                          content: Table(
                                            border: TableBorder.all(),
                                            columnWidths: const <int,
                                                TableColumnWidth>{
                                              0: FlexColumnWidth(),
                                              1: FlexColumnWidth(),
                                              2: FixedColumnWidth(30),
                                            },
                                            defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .middle,
                                            children: [
                                              TableRow(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text("<18,5")),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text(
                                                            "Underweight")),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    // width: 10,
                                                    color: Colors.blue,
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text(
                                                            "18.5 - 24.9")),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text("Normal")),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text(
                                                            "25.0 - 29.9")),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child:
                                                            Text("Overweight")),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    color: Colors.green,
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text(">= 30")),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Center(
                                                        child: Text("Obese")),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            Center(
                                              child: TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
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
                            ),
                          ),
                        ),
                ));
              } else {
                return SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await _refresh(true);
                    },
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 185, 246, 188)),
                            child: Center(
                              child: Text("Statistik Ibu Hamil",
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
                                    Text("Usia Kandungan: "),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  return Container(
                                    color: Theme.of(context).cardColor,
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: SfCartesianChart(
                                        zoomPanBehavior: _zoomPanBehavior,
                                        primaryXAxis: NumericAxis(
                                          title: AxisTitle(
                                              text: 'Umur Kandungan(Minggu)',
                                              textStyle:
                                                  TextStyle(fontSize: 10)),
                                          interval: 1,
                                        ),
                                        primaryYAxis: NumericAxis(
                                            title: AxisTitle(
                                                text: 'Rekomendasi Berat(Kg)',
                                                textStyle:
                                                    TextStyle(fontSize: 10)),
                                            interval: 1),
                                        series: <CartesianSeries>[
                                          SplineRangeAreaSeries<ChartData, num>(
                                              dataSource: underWeight,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.xValue,
                                              lowValueMapper:
                                                  (ChartData data, _) =>
                                                      data.lowValue,
                                              highValueMapper:
                                                  (ChartData data, _) =>
                                                      data.highValue,
                                              opacity: 0.5,
                                              color: Colors.blue[500]),
                                          SplineRangeAreaSeries<ChartData, num>(
                                              dataSource: normalWeight,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.xValue,
                                              lowValueMapper:
                                                  (ChartData data, _) =>
                                                      data.lowValue,
                                              highValueMapper:
                                                  (ChartData data, _) =>
                                                      data.highValue,
                                              opacity: 0.5,
                                              color: Colors.red[500]),
                                          SplineRangeAreaSeries<ChartData, num>(
                                              dataSource: overWeight,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.xValue,
                                              lowValueMapper:
                                                  (ChartData data, _) =>
                                                      data.lowValue,
                                              highValueMapper:
                                                  (ChartData data, _) =>
                                                      data.highValue,
                                              opacity: 0.5,
                                              color: Colors.green[500]),
                                          SplineRangeAreaSeries<ChartData, num>(
                                              dataSource: obeseWeight,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.xValue,
                                              lowValueMapper:
                                                  (ChartData data, _) =>
                                                      data.lowValue,
                                              highValueMapper:
                                                  (ChartData data, _) =>
                                                      data.highValue,
                                              opacity: 0.5,
                                              color: Colors.grey[500]),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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
                                    Text("Indeks Masa Tubuh:"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Rekomendasi Berat:"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("IMT Status:"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
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
                                    title:
                                        Center(child: Text('Cara Membaca IMT')),
                                    content: Table(
                                      border: TableBorder.all(),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FlexColumnWidth(),
                                        1: FlexColumnWidth(),
                                        2: FixedColumnWidth(30),
                                      },
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: [
                                        TableRow(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child:
                                                  Center(child: Text("<18,5")),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: Center(
                                                  child: Text("Underweight")),
                                            ),
                                            Container(
                                              height: 10,
                                              // width: 10,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: Center(
                                                  child: Text("18.5 - 24.9")),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child:
                                                  Center(child: Text("Normal")),
                                            ),
                                            Container(
                                              height: 10,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: Center(
                                                  child: Text("25.0 - 29.9")),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: Center(
                                                  child: Text("Overweight")),
                                            ),
                                            Container(
                                              height: 10,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child:
                                                  Center(child: Text(">= 30")),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child:
                                                  Center(child: Text("Obese")),
                                            ),
                                            Container(
                                              height: 10,
                                              color: Colors.grey,
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                      ),
                    ),
                  ),
                );
              }
            }()))
      ],
    );
  }
}
