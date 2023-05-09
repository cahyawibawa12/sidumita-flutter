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

class StatistikIbuHamilPage extends StatefulWidget {
  StatistikIbuHamilPage({super.key, required this.ibuHamilModel});

  IbuHamilModel ibuHamilModel;

  @override
  State<StatistikIbuHamilPage> createState() => _StatistikIbuHamilPageState();
}

class _StatistikIbuHamilPageState extends State<StatistikIbuHamilPage> {
  var pemeriksaanibuhamil = Get.put(PemeriksaanIbuHamilController());
  var dataBeratIbu = Get.put(CekDataController());

  @override
  void initState() {
    super.initState();
    pemeriksaanibuhamil
        .getPemeriksaanIbuHamil(widget.ibuHamilModel.id!)
        .then((value) => dataBeratIbu.getBeratIbu(widget.ibuHamilModel.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Obx(
              () => pemeriksaanibuhamil.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text("Statistik Ibu Hamil",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500)),
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
                                        .listPemeriksaanIbuHamil[0].beratBadan
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(pemeriksaanibuhamil
                                      .listPemeriksaanIbuHamil[0]
                                      .tanggalPemeriksaan)
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
                                      primaryXAxis: NumericAxis(
                                        interval: 1,
                                      ),
                                      primaryYAxis: NumericAxis(interval: 1),
                                      series: <CartesianSeries>[
                                        LineSeries<Map, int>(
                                          dataSource: dataBeratIbu.data,
                                          xValueMapper: (Map data, _) =>
                                              int.parse(data["umur_kandungan"]),
                                          yValueMapper: (Map data, _) =>
                                              data["berat_badan"],
                                        ),
                                        SplineRangeAreaSeries<ChartData, num>(
                                            dataSource: underWeight,
                                            xValueMapper: (ChartData data, _) =>
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
                                            xValueMapper: (ChartData data, _) =>
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
                                            dataSource: overWeight,
                                            xValueMapper: (ChartData data, _) =>
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
                                            dataSource: obeseWeight,
                                            xValueMapper: (ChartData data, _) =>
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
                      ],
                    ),
            )))
      ],
    );
  }
}
